<?php

namespace App\Http\Controllers;

use App\Models\PaymentRequest;
use App\Models\Companies;
use App\Models\PaymentType;
use App\Models\PaymentRequestStatus;
use App\Models\PaymentRequestCategory;
use Auth;
use Carbon\Carbon;
use Yajra\DataTables\Html\Builder;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PaymentRequestController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(Request $request, Builder $builder)
    {
        try {
            $user = auth()->user();

            $start = $request->input('startDate');
            $end = $request->input('endDate');
            $companies = Companies::all();
            $payment_requests = PaymentRequest::with('status','category', 'payCompanies', 'paidCompanies', 'user')->orderBy('expiry_date', 'DESC')->get();

            $data = array('start' => $start, 'end' => $end,  'companies' => $companies, 'payment_requests' => $payment_requests);

            return view('admin.paymentrequests.payment_request_list')->with($data);
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }

    public function store(Request $request)
    {
        try {
            $user = auth()->user();
            $newData = new PaymentRequest();
            $newData->expiry_date = $request->input('expiryDate');
            $newData->payment_amount = $request->input('paymentAmount');
            $newData->payment_amount_currency = $request->input('paymentCurrency');
            $newData->pay_company_id = $request->input('payCompanyId');
            $newData->paid_company_id = $request->input('paidCompanyId');
            $newData->payment_request_category_id = $request->input('categoryId');
            $newData->payment_type_id = $request->input('paymentTypeId');
            $newData->document_no = $request->input('documentNo');
            $newData->document_date = $request->input('documentDate');
            $newData->invoice_date = $request->input('invoiceDate');
            $newData->payment_request_status_id = "1";
            $newData->note = $request->input('note');
            $newData->user_id = $user->id;

            if ($newData->save()) {
                return response($newData->id, 200);
            }
            else {
                return response(false, 500);
            }
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }

    public function create()
    {
        try {
            $companies = Companies::all();
            $payment_types = PaymentType::all();
            $categories = PaymentRequestCategory::all();
            $data = array('companies' => $companies, 'categories' => $categories, 'payment_types' => $payment_types);

            return view('admin.paymentrequests.create_payment_request')->with($data);
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }

    public function requested(Request $request, Builder $builder)
    {
        try {

            $user = auth()->user();

            $start = $request->input('startDate');
            $end = $request->input('endDate');
            $companyId = $request->input('companyId');

            $companies = Companies::all();
            $payment_request_statuses = PaymentRequestStatus::all();
            if($companyId == null){
                if($user->hasRole('Finance Admin')){
                    $payment_requests = PaymentRequest::with('status' ,'category' ,'paidCompanies' ,'payCompanies', 'user')->where('payment_request_status_id', '1')->where('user_id', '=', $user->id)->orderBy('expiry_date', 'ASC')->whereBetween('expiry_date', [date('Y-m-d', strtotime($start))." 00:00:00", date('Y-m-d', strtotime($end))." 23:59:59"])->get();
                }

                else {
                    $payment_requests = PaymentRequest::with('status'  ,'category','paidCompanies' ,'payCompanies', 'user')->where('payment_request_status_id', '1')->orderBy('expiry_date', 'DESC')->whereBetween('expiry_date', [date('Y-m-d', strtotime($start))." 00:00:00", date('Y-m-d', strtotime($end))." 23:59:59"])->get();
                }
            }
            else {
                if($user->hasRole('Finance Admin')){
                    $payment_requests = PaymentRequest::with('status'  ,'category','paidCompanies' ,'payCompanies', 'user')->where('payment_request_status_id', '1')->where('user_id', '=', $user->id)->orderBy('expiry_date', 'ASC')->whereBetween('expiry_date', [date('Y-m-d', strtotime($start))." 00:00:00", date('Y-m-d', strtotime($end))." 23:59:59"])->get();
                }

                else {
                    $payment_requests = PaymentRequest::with('status'  ,'category','paidCompanies' ,'payCompanies', 'user')->where('payment_request_status_id', '1')->where('paid_company_id', '=', $companyId)->orderBy('expiry_date', 'DESC')->whereBetween('expiry_date', [date('Y-m-d', strtotime($start))." 00:00:00", date('Y-m-d', strtotime($end))." 23:59:59"])->get();
                }
            }

            $data = array('start' => $start, 'end' => $end, 'companyId' => $companyId, 'companies' => $companies,'payment_request_statuses' =>$payment_request_statuses, 'payment_requests' => $payment_requests);

            /*if (request()->ajax()) {

                if($companyId == null){
                    if($user->hasRole('Finance Admin')){
                        $data = PaymentRequest::with('status' ,'paidCompanies' ,'payCompanies', 'user')->where('payment_request_status_id', '1')->where('user_id', '=', $user->id)->orderBy('expiry_date', 'ASC')->whereBetween('expiry_date', [date('Y-m-d', strtotime($start))." 00:00:00", date('Y-m-d', strtotime($end))." 23:59:59"]);
                    }

                    else {
                        $data = PaymentRequest::with('status' ,'paidCompanies' ,'payCompanies', 'user')->where('payment_request_status_id', '1')->orderBy('expiry_date', 'DESC')->whereBetween('expiry_date', [date('Y-m-d', strtotime($start))." 00:00:00", date('Y-m-d', strtotime($end))." 23:59:59"]);
                    }
                }
                else {
                    if($user->hasRole('Finance Admin')){
                        $data = PaymentRequest::with('status' ,'paidCompanies' ,'payCompanies', 'user')->where('payment_request_status_id', '1')->where('user_id', '=', $user->id)->orderBy('expiry_date', 'ASC')->whereBetween('expiry_date', [date('Y-m-d', strtotime($start))." 00:00:00", date('Y-m-d', strtotime($end))." 23:59:59"]);
                    }

                    else {
                        $data = PaymentRequest::with('status' ,'paidCompanies' ,'payCompanies', 'user')->where('payment_request_status_id', '1')->where('company_id', '=', $companyId)->orderBy('expiry_date', 'DESC')->whereBetween('expiry_date', [date('Y-m-d', strtotime($start))." 00:00:00", date('Y-m-d', strtotime($end))." 23:59:59"]);
                    }
                }

                return DataTables::of($data)
                    ->editColumn('action', function ($item) {
                        $action = '<a href="/paymentrequests/edit/'.$item->id.'" class="badge badge-danger">Cevapla <i class="fa fa-chevron-right icon-sm white"></i></a>';
                        return $action;
                    })
                    ->editColumn('id', function ($item) {
                        $action = date('ymd', strtotime($item->created_at)) . $item->id;
                        return $action;
                    })
                    ->editColumn('expiry_date', function ($item) {
                        return date('d-m-Y', strtotime($item->expiry_date));
                    })
                    ->editColumn('document_date', function ($item) {
                        return date('d-m-Y', strtotime($item->document_date));
                    })
                    ->editColumn('status.name', function ($item) {
                        $url = '<span class="badge badge-danger">'.$item->status->name.'</span>';
                        return $url;
                    })
                    ->editColumn('payment_amount', function ($item) {
                        $url = number_format($item->payment_amount, 2) . ' ' . $item->payment_amount_currency;
                        return $url;
                    })
                    ->editColumn('invoice_date', function ($item) {
                        return date('d-m-Y', strtotime($item->invoice_date));
                    })
                    ->rawColumns(['action', 'id', 'status.name'])

                    ->toJson();
                };
                $columns = [
                    ['data' => 'action', 'name' => 'action', 'title' => 'İşlem', 'orderable' => false, 'searchable' => false],
                    ['data' => 'id', 'name' => 'id', 'title' => 'id'],
                    ['data' => 'status.name', 'name' => 'status.name', 'title' => 'Durum'],
                    ['data' => 'companies.name', 'name' => 'companies.name', 'title' => 'Firma Adı'],
                    ['data' => 'expiry_date', 'name' => 'expiry_date', 'title' => 'Vade'],
                    ['data' => 'payment_amount', 'name' => 'payment_amount', 'title' => 'Tutar'],
                    ['data' => 'document_no', 'name' => 'document_no', 'title' => 'Belge No'],
                    ['data' => 'document_date', 'name' => 'document_date', 'title' => 'Belge Tarihi'],
                    ['data' => 'invoice_date', 'name' => 'invoice_date', 'title' => 'Fatura Tarihi'],
                    ['data' => 'user.name', 'name' => 'users.name', 'title' => 'Oluşturan'],
                ];
                $html = $builder->columns($columns)->parameters([
                    "pageLength" => 50
                ]);*/

            return view('admin.paymentrequests.requested')->with($data);
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }

    public function waiting(Request $request, Builder $builder)
    {
        try {

            $user = auth()->user();

            $start = $request->input('startDate');
            $end = $request->input('endDate');
            $companyId = $request->input('companyId');

            $companies = Companies::all();
            if($companyId == null){
                if($user->hasRole('Finance Admin')){
                    $payment_requests = PaymentRequest::with('status'  ,'category','paidCompanies' ,'payCompanies', 'user')->where('user_id', '=', $user->id)->where('payment_request_status_id', '4')->orderBy('expiry_date', 'DESC')->whereBetween('expiry_date', [date('Y-m-d', strtotime($start))." 00:00:00", date('Y-m-d', strtotime($end))." 23:59:59"])->get();
                }

                else {
                    $payment_requests = PaymentRequest::with('status'  ,'category','paidCompanies' ,'payCompanies', 'user')->where('payment_request_status_id', '4')->orderBy('expiry_date', 'DESC')->whereBetween('expiry_date', [date('Y-m-d', strtotime($start))." 00:00:00", date('Y-m-d', strtotime($end))." 23:59:59"])->get();
                }
            }

            else {
                if($user->hasRole('Finance Admin')){
                    $payment_requests = PaymentRequest::with('status'  ,'category','paidCompanies' ,'payCompanies', 'user')->where('user_id', '=', $user->id)->where('payment_request_status_id', '4')->orderBy('expiry_date', 'DESC')->whereBetween('expiry_date', [date('Y-m-d', strtotime($start))." 00:00:00", date('Y-m-d', strtotime($end))." 23:59:59"])->get();
                }

                else {
                    $payment_requests = PaymentRequest::with('status' ,'category' ,'paidCompanies' ,'payCompanies', 'user')->where('payment_request_status_id', '4')->where('paid_company_id', '=', $companyId)->orderBy('expiry_date', 'DESC')->whereBetween('expiry_date', [date('Y-m-d', strtotime($start))." 00:00:00", date('Y-m-d', strtotime($end))." 23:59:59"])->get();
                }
            }
            $data = array('start' => $start, 'end' => $end, 'companies' => $companies, 'payment_requests' => $payment_requests);

           /* if (request()->ajax()) {

                if($companyId == null){
                    if($user->hasRole('Finance Admin')){
                        $data = PaymentRequest::with('status' ,'paidCompanies' ,'payCompanies', 'user')->where('user_id', '=', $user->id)->where('payment_request_status_id', '4')->orderBy('expiry_date', 'DESC')->whereBetween('expiry_date', [date('Y-m-d', strtotime($start))." 00:00:00", date('Y-m-d', strtotime($end))." 23:59:59"]);
                    }

                    else {
                        $data = PaymentRequest::with('status' ,'paidCompanies' ,'payCompanies', 'user')->where('payment_request_status_id', '4')->orderBy('expiry_date', 'DESC')->whereBetween('expiry_date', [date('Y-m-d', strtotime($start))." 00:00:00", date('Y-m-d', strtotime($end))." 23:59:59"]);
                    }
                }

                else {
                    if($user->hasRole('Finance Admin')){
                        $data = PaymentRequest::with('status' ,'paidCompanies' ,'payCompanies', 'user')->where('user_id', '=', $user->id)->where('payment_request_status_id', '4')->orderBy('expiry_date', 'DESC')->whereBetween('expiry_date', [date('Y-m-d', strtotime($start))." 00:00:00", date('Y-m-d', strtotime($end))." 23:59:59"]);
                    }

                    else {
                        $data = PaymentRequest::with('status' ,'paidCompanies' ,'payCompanies', 'user')->where('payment_request_status_id', '4')->where('company_id', '=', $companyId)->orderBy('expiry_date', 'DESC')->whereBetween('expiry_date', [date('Y-m-d', strtotime($start))." 00:00:00", date('Y-m-d', strtotime($end))." 23:59:59"]);
                    }
                }

                return DataTables::of($data)
                    ->editColumn('action', function ($item) {
                        $action = '<a href="/paymentrequests/edit/'.$item->id.'" class="btn btn-warning edit-btn">Güncelle <i class="fa fa-chevron-right"></i></a>';
                        return $action;
                    })
                    ->editColumn('id', function ($item) {
                        $action = date('ymd', strtotime($item->created_at)) . $item->id;
                        return $action;
                    })
                    ->editColumn('expiry_date', function ($item) {
                        return date('d-m-Y', strtotime($item->expiry_date));
                    })
                    ->editColumn('document_date', function ($item) {
                        return date('d-m-Y', strtotime($item->document_date));
                    })
                    ->editColumn('status.name', function ($item) {
                        $url = '<span class="badge badge-warning">'.$item->status->name.'</span>';
                        return $url;
                    })
                    ->editColumn('payment_amount', function ($item) {
                        $url = number_format($item->payment_amount, 2) . ' ' . $item->payment_amount_currency;
                        return $url;
                    })
                    ->editColumn('invoice_date', function ($item) {
                        return date('d-m-Y', strtotime($item->invoice_date));
                    })
                    ->rawColumns(['action', 'id', 'status.name'])

                    ->toJson();
                };
                $columns = [
                    ['data' => 'action', 'name' => 'action', 'title' => 'İşlem', 'orderable' => false, 'searchable' => false],
                    ['data' => 'id', 'name' => 'id', 'title' => 'id'],
                    ['data' => 'status.name', 'name' => 'status.name', 'title' => 'Durum'],
                    ['data' => 'companies.name', 'name' => 'companies.name', 'title' => 'Firma Adı'],
                    ['data' => 'expiry_date', 'name' => 'expiry_date', 'title' => 'Vade'],
                    ['data' => 'payment_amount', 'name' => 'payment_amount', 'title' => 'Tutar'],
                    ['data' => 'document_no', 'name' => 'document_no', 'title' => 'Belge No'],
                    ['data' => 'document_date', 'name' => 'document_date', 'title' => 'Belge Tarihi'],
                    ['data' => 'invoice_date', 'name' => 'invoice_date', 'title' => 'Fatura Tarihi'],
                    ['data' => 'user.name', 'name' => 'users.name', 'title' => 'Oluşturan'],
                ];
                $html = $builder->columns($columns)->parameters([
                    "pageLength" => 50
                ]);
*/
            return view('admin.paymentrequests.waiting')->with($data);
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }

    public function completed(Request $request, Builder $builder)
    {
        try {

            $user = auth()->user();

            $start = $request->input('startDate');
            $end = $request->input('endDate');
            $companyId = $request->input('companyId');

            $companies = Companies::all();
            if($companyId == null){
                if($user->hasRole('Finance Admin')){
                    $payment_requests = PaymentRequest::with('status' ,'category' ,'paidCompanies','payCompanies', 'user')->where('user_id', '=', $user->id)->where('payment_request_status_id', '2')->orderBy('expiry_date', 'DESC')->whereBetween('expiry_date', [date('Y-m-d', strtotime($start))." 00:00:00", date('Y-m-d', strtotime($end))." 23:59:59"])->get();
                }

                else {
                    $payment_requests = PaymentRequest::with('status' ,'category' ,'paidCompanies' ,'payCompanies', 'user')->where('payment_request_status_id', '2')->orderBy('expiry_date', 'DESC')->whereBetween('expiry_date', [date('Y-m-d', strtotime($start))." 00:00:00", date('Y-m-d', strtotime($end))." 23:59:59"])->get();
                }
            }

            else {
                if($user->hasRole('Finance Admin')){
                    $payment_requests = PaymentRequest::with('status' ,'category' ,'paidCompanies' ,'payCompanies', 'user')->where('user_id', '=', $user->id)->where('payment_request_status_id', '2')->orderBy('expiry_date', 'DESC')->whereBetween('expiry_date', [date('Y-m-d', strtotime($start))." 00:00:00", date('Y-m-d', strtotime($end))." 23:59:59"])->get();
                }

                else {
                    $payment_requests = PaymentRequest::with('status' ,'category' ,'paidCompanies' ,'payCompanies', 'user')->where('payment_request_status_id', '2')->where('company_id', '=', $companyId)->orderBy('expiry_date', 'DESC')->whereBetween('expiry_date', [date('Y-m-d', strtotime($start))." 00:00:00", date('Y-m-d', strtotime($end))." 23:59:59"])->get();
                }
            }

            $data = array('start' => $start, 'end' => $end, 'companies' => $companies, 'payment_requests' => $payment_requests);
/*
            if (request()->ajax()) {

                if($companyId == null){
                    if($user->hasRole('Finance Admin')){
                        $data = PaymentRequest::with('status' ,'paidCompanies' ,'payCompanies', 'user')->where('user_id', '=', $user->id)->where('payment_request_status_id', '2')->orderBy('expiry_date', 'DESC')->whereBetween('expiry_date', [date('Y-m-d', strtotime($start))." 00:00:00", date('Y-m-d', strtotime($end))." 23:59:59"]);
                    }

                    else {
                        $data = PaymentRequest::with('status' ,'paidCompanies' ,'payCompanies', 'user')->where('payment_request_status_id', '2')->orderBy('expiry_date', 'DESC')->whereBetween('expiry_date', [date('Y-m-d', strtotime($start))." 00:00:00", date('Y-m-d', strtotime($end))." 23:59:59"]);
                    }
                }

                else {
                    if($user->hasRole('Finance Admin')){
                        $data = PaymentRequest::with('status' ,'paidCompanies' ,'payCompanies', 'user')->where('user_id', '=', $user->id)->where('payment_request_status_id', '2')->orderBy('expiry_date', 'DESC')->whereBetween('expiry_date', [date('Y-m-d', strtotime($start))." 00:00:00", date('Y-m-d', strtotime($end))." 23:59:59"]);
                    }

                    else {
                        $data = PaymentRequest::with('status' ,'paidCompanies' ,'payCompanies', 'user')->where('payment_request_status_id', '2')->where('company_id', '=', $companyId)->orderBy('expiry_date', 'DESC')->whereBetween('expiry_date', [date('Y-m-d', strtotime($start))." 00:00:00", date('Y-m-d', strtotime($end))." 23:59:59"]);
                    }
                }

                return DataTables::of($data)
                    ->editColumn('action', function ($item) {
                        $action = '<a href="/paymentrequests/edit/'.$item->id.'" class="btn btn-success edit-btn">Güncelle <i class="fa fa-chevron-right"></i></a>';
                        return $action;
                    })
                    ->editColumn('id', function ($item) {
                        $action = date('ymd', strtotime($item->created_at)) . $item->id;
                        return $action;
                    })
                    ->editColumn('expiry_date', function ($item) {
                        return date('d-m-Y', strtotime($item->expiry_date));
                    })
                    ->editColumn('document_date', function ($item) {
                        return date('d-m-Y', strtotime($item->document_date));
                    })
                    ->editColumn('status.name', function ($item) {
                        $url = '<span class="badge badge-success">'.$item->status->name.'</span>';
                        return $url;
                    })
                    ->editColumn('payment_amount', function ($item) {
                        $url = number_format($item->payment_amount, 2) . ' ' . $item->payment_amount_currency;
                        return $url;
                    })
                    ->editColumn('invoice_date', function ($item) {
                        return date('d-m-Y', strtotime($item->invoice_date));
                    })
                    ->rawColumns(['action', 'id', 'status.name'])

                    ->toJson();
                };
                $columns = [
                    ['data' => 'action', 'name' => 'action', 'title' => 'İşlem', 'orderable' => false, 'searchable' => false],
                    ['data' => 'id', 'name' => 'id', 'title' => 'id'],
                    ['data' => 'status.name', 'name' => 'status.name', 'title' => 'Durum'],
                    ['data' => 'companies.name', 'name' => 'companies.name', 'title' => 'Firma Adı'],
                    ['data' => 'expiry_date', 'name' => 'expiry_date', 'title' => 'Vade'],
                    ['data' => 'payment_amount', 'name' => 'payment_amount', 'title' => 'Tutar'],
                    ['data' => 'document_no', 'name' => 'document_no', 'title' => 'Belge No'],
                    ['data' => 'document_date', 'name' => 'document_date', 'title' => 'Belge Tarihi'],
                    ['data' => 'invoice_date', 'name' => 'invoice_date', 'title' => 'Fatura Tarihi'],
                    ['data' => 'user.name', 'name' => 'users.name', 'title' => 'Oluşturan'],
                ];
                $html = $builder->columns($columns)->parameters([
                    "pageLength" => 50
                ]);
*/
            return view('admin.paymentrequests.completed')->with($data);
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }

    public function paymentcalendar()
    {
        try {
            $user = auth()->user();

            if($user->hasRole('Super Admin')){
                $calendarCount = PaymentRequest::select('payment_requests.expiry_date as date', 'payment_requests.payment_amount_currency as currency', 'companies.id as cId', 'companies.name', 'payment_requests.payment_amount', 'payment_requests.payment_amount_currency', DB::raw('count(name) as countR'), DB::raw('SUM(payment_amount) as payment_amount'))
                ->leftJoin('companies', 'payment_requests.paid_company_id', '=', 'companies.id')
                ->whereNotNull('payment_requests.paid_company_id')
                ->whereIn('payment_requests.payment_request_status_id', array(1, 2))
                // ->whereMonth('treatment_plans.created_date', Carbon::now()->month)
                ->groupBy(['date', 'currency', 'cId']);
            }
            if($user->hasRole('Ceo')){
                $calendarCount = PaymentRequest::select('payment_requests.expiry_date as date', 'payment_requests.payment_amount_currency as currency', 'companies.id as cId', 'companies.name', 'payment_requests.payment_amount', 'payment_requests.payment_amount_currency', DB::raw('count(name) as countR'), DB::raw('SUM(payment_amount) as payment_amount'))
                ->leftJoin('companies', 'payment_requests.paid_company_id', '=', 'companies.id')
                ->whereNotNull('payment_requests.paid_company_id')
                ->whereIn('payment_requests.payment_request_status_id', array(1, 2))
                // ->whereMonth('treatment_plans.created_date', Carbon::now()->month)
                ->groupBy(['date', 'currency', 'cId']);
            }
            if($user->hasRole('Finance Admin') || $user->hasRole('Finance Person')) {
                $calendarCount = PaymentRequest::select('payment_requests.expiry_date as date', 'payment_requests.payment_amount_currency as currency', 'companies.id as cId', 'companies.name', 'payment_requests.payment_amount', 'payment_requests.payment_amount_currency', DB::raw('count(name) as countR'), DB::raw('SUM(payment_amount) as payment_amount'))
                ->leftJoin('companies', 'payment_requests.paid_company_id', '=', 'companies.id')
                ->whereNotNull('payment_requests.paid_company_id')
                ->whereIn('payment_requests.payment_request_status_id', array(1, 2))
                ->where('payment_requests.user_id', '=', $user->id)
                // ->whereMonth('treatment_plans.created_date', Carbon::now()->month)
                ->groupBy(['date', 'currency', 'cId']);
            }

            $listCountByMonth = DB::select($calendarCount->groupBy(DB::raw('cId'))->toSql(),
            $calendarCount->getBindings());

            $data = array('listCountByMonth' => $listCountByMonth);
            return view('payment_calendar')->with($data);
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }

    public function allPaymentRequestByDate(Request $request)
    {
        try {
            $user = auth()->user();
            $searchDate = $request->input('s');

            if($user->hasRole('Finance Admin')){
                $paymentRequest = PaymentRequest::select('payment_requests.expiry_date as date', 'payment_requests.id as pId', 'payment_requests.*', 'companies.name as cName', 'payment_requests_statuses.*')
                ->leftJoin('payment_requests_statuses', 'payment_requests.payment_request_status_id', '=', 'payment_requests_statuses.id')
                ->leftJoin('companies', 'payment_requests.paid_company_id', '=', 'companies.id')
                ->whereNotNull('payment_requests.paid_company_id')
                ->where('payment_requests.user_id', '=', $user->id)
                ->whereDate('payment_requests.expiry_date', '=', $searchDate)
                ->orderBy('expiry_Date', 'DESC');
            }

            else {
                $paymentRequest = PaymentRequest::select('payment_requests.expiry_date as date', 'payment_requests.id as pId', 'payment_requests.*', 'companies.name as cName', 'payment_requests_statuses.*')
                ->leftJoin('payment_requests_statuses', 'payment_requests.payment_request_status_id', '=', 'payment_requests_statuses.id')
                ->leftJoin('companies', 'payment_requests.paid_company_id', '=', 'companies.id')
                ->whereNotNull('payment_requests.paid_company_id')
                ->whereDate('payment_requests.expiry_date', '=', $searchDate)
                ->orderBy('expiry_Date', 'DESC');
            }

            $listAllByDates = DB::select($paymentRequest->orderByRaw('DATE_FORMAT(date, "%y-%m-%d")')->toSql(), $paymentRequest->getBindings());
            $datePrmtr = date('d.m.Y', strtotime($searchDate));

            $data = array('listAllByDates' => $listAllByDates, 'tableTitle' => $datePrmtr . ' Tarihine Ait Ödeme Talepleri');
            return view('admin.paymentrequests.all_paymentrequest')->with($data);
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }

    public function edit(Request $request, $id)
    {
            $payment_request = PaymentRequest::where('id', '=', $id)->first();
            $pay_companies = Companies::where('id', '!=', $payment_request->pay_company_id)->get();
            $paid_companies = Companies::where('id', '!=', $payment_request->paid_company_id)->get();
            $payment_types = PaymentType::where('id', '!=', $payment_request->payment_type_id)->get();
            $payment_request_statuses = PaymentRequestStatus::where('id', '!=', $payment_request->payment_request_status_id)->get();
            $payment_request_categories = PaymentRequestCategory::where('id', '!=', $payment_request->payment_request_category_id)->get();
            $data = array('payment_request' => $payment_request,'pay_companies' => $pay_companies, 'payment_request_categories'=> $payment_request_categories, 'payment_request_statuses' => $payment_request_statuses, 'paid_companies' => $paid_companies, 'payment_types' => $payment_types);

            $page = $request->input('page');

            if($page == "files"){
                return view('admin.paymentrequests.files')->with($data);
            }
            else {
                return view('admin.paymentrequests.edit_payment_request')->with($data);
            }
    }

    public function update(Request $request, $id)
    {
        try {
            $user = auth()->user();

            $temp['expiry_date'] = $request->input('expiryDate');
            $temp['payment_amount'] = $request->input('paymentAmount');
            $temp['payment_amount_currency'] = $request->input('paymentCurrency');
            $temp['pay_company_id'] = $request->input('payCompanyId');
            $temp['paid_company_id'] = $request->input('paidCompanyId');
            $temp['payment_request_category_id'] = $request->input('categoryId');
            $temp['payment_type_id'] = $request->input('paymentTypeId');
            $temp['document_no'] = $request->input('documentNo');
            $temp['document_date'] = $request->input('documentDate');
            $temp['invoice_date'] = $request->input('invoiceDate');
            $temp['note'] = $request->input('note');

            if (PaymentRequest::where('id', '=', $id)->update($temp)) {
                return redirect()->route('paymentrequests.requested')->with('message', 'Ödeme Talebi Başarıyla Güncellendi!');
            }
            else {
                return back()->withInput($request->input());
            }
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }

    public function postPaymentRequest(Request $request, $id)
    {
        try {
            $user = auth()->user();

            $temp['post_time'] = Carbon::now()->toDateTimeString();
            $temp['payment_request_status_id'] = $request->input('payment_request_status_id');
            $temp['answer_note'] = $request->input('note');
            $temp['answered_user_id'] = $user->id;

            if (PaymentRequest::where('id', '=', $id)->update($temp)) {
                return response(true, 200);
            }
            else {
                return response(false, 500);
            }
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }

    public function destroy($id)
    {
        PaymentRequest::find($id)->delete();
        return redirect()->route('paymentrequests.index')->with('message', 'Ödeme Talebi Başarıyla Silindi!');
    }
}
