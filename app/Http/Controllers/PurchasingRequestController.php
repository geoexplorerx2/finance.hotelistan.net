<?php

namespace App\Http\Controllers;

use App\Models\PurchasingRequestStatus;
use App\Models\PurchasingRequest;
use App\Models\PurchasingOffer;
use App\Models\PurchasingPhoto;
use App\Models\Suppliers;
use Auth;
use Yajra\DataTables\Html\Builder;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;


class PurchasingRequestController extends Controller
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
            $suppliers = Suppliers::all();
            $status = PurchasingRequestStatus::all();
            $purchasing_requests = PurchasingRequest::with('status', 'suppliers', 'user')->orderBy('created_at', 'DESC')->get();

            $data = array('start' => $start, 'end' => $end, 'suppliers' => $suppliers,'purchasing_requests'=>$purchasing_requests, 'status' => $status);

            return view('admin.purchasingrequests.purchasing_request_list')->with($data);
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }

    public function store(Request $request)
    {
        try {
            $user = auth()->user();
            $newData = new PurchasingRequest();
            $newData->product_title = $request->input('productTitle');
            $newData->product_url = $request->input('productUrl');;
            $newData->note = $request->input('note');
            $newData->purchasing_request_status_id = "1";
            //$newData->supplier_id = $request->input('supplierId');
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
            $suppliers = Suppliers::all();
            $data = array('suppliers' => $suppliers);

            return view('admin.purchasingrequests.create_purchasing_request')->with($data);
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
            $supplierId = $request->input('supplierId');
            $status = PurchasingRequestStatus::all();
            $suppliers = Suppliers::all();

            if($supplierId == null){
                if($user->hasRole('Finance Admin')){
                    $purchasing_requests = PurchasingRequest::with('status','suppliers', 'user')->where('purchasing_request_status_id', '1')->where('user_id', '=', $user->id)->orderBy('created_at', 'ASC')->whereBetween('created_at', [date('Y-m-d', strtotime($start))." 00:00:00", date('Y-m-d', strtotime($end))." 23:59:59"])->get();
                }

                else {
                    $purchasing_requests = PurchasingRequest::with('status','suppliers', 'user')->where('purchasing_request_status_id', '1')->orderBy('created_at', 'DESC')->whereBetween('created_at', [date('Y-m-d', strtotime($start))." 00:00:00", date('Y-m-d', strtotime($end))." 23:59:59"])->get();
                }
            }
            else {
                if($user->hasRole('Finance Admin')){
                    $purchasing_requests = PurchasingRequest::with('status','suppliers', 'user')->where('purchasing_request_status_id', '1')->where('user_id', '=', $user->id)->orderBy('created_at', 'ASC')->whereBetween('created_at', [date('Y-m-d', strtotime($start))." 00:00:00", date('Y-m-d', strtotime($end))." 23:59:59"])->get();
                }

                else {
                    $purchasing_requests = PurchasingRequest::with('status','suppliers', 'user')->where('purchasing_request_status_id', '1')->where('supplier_id', '=', $supplierId)->orderBy('created_at', 'DESC')->whereBetween('created_at', [date('Y-m-d', strtotime($start))." 00:00:00", date('Y-m-d', strtotime($end))." 23:59:59"])->get();
                }
            }

            $data = array('start' => $start, 'end' => $end, 'supplierId' => $supplierId, 'suppliers' => $suppliers, 'purchasing_requests' => $purchasing_requests, 'status' => $status);

            return view('admin.purchasingrequests.requested')->with($data);
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
            $supplierId = $request->input('supplierId');

            $suppliers = Suppliers::all();
            if($supplierId == null){
                if($user->hasRole('Finance Admin')){
                    $purchasing_requests = PurchasingRequest::with('status','suppliers', 'user')->where('user_id', '=', $user->id)->where('purchasing_request_status_id', '4')->orderBy('created_at', 'DESC')->whereBetween('created_at', [date('Y-m-d', strtotime($start))." 00:00:00", date('Y-m-d', strtotime($end))." 23:59:59"])->get();
                }

                else {
                    $purchasing_requests = PurchasingRequest::with('status','suppliers', 'user')->where('purchasing_request_status_id', '4')->orderBy('created_at', 'DESC')->whereBetween('created_at', [date('Y-m-d', strtotime($start))." 00:00:00", date('Y-m-d', strtotime($end))." 23:59:59"])->get();
                }
            } else {
                if($user->hasRole('Finance Admin')){
                    $purchasing_requests = PurchasingRequest::with('status','suppliers', 'user')->where('user_id', '=', $user->id)->where('purchasing_request_status_id', '4')->orderBy('created_at', 'DESC')->whereBetween('created_at', [date('Y-m-d', strtotime($start))." 00:00:00", date('Y-m-d', strtotime($end))." 23:59:59"])->get();
                }

                else {
                    $purchasing_requests = PurchasingRequest::with('status','suppliers', 'user')->where('purchasing_request_status_id', '4')->where('supplier_id', '=', $supplierId)->orderBy('created_at', 'DESC')->whereBetween('created_at', [date('Y-m-d', strtotime($start))." 00:00:00", date('Y-m-d', strtotime($end))." 23:59:59"])->get();
                }
            }

            $data = array('start' => $start, 'end' => $end, 'suppliers' => $suppliers, 'purchasing_requests' => $purchasing_requests);

            return view('admin.purchasingrequests.waiting')->with($data);
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
            $supplierId = $request->input('supplierId');

            $suppliers = Suppliers::all();

            if($supplierId == null){
                if($user->hasRole('Finance Admin')){
                    $purchasing_requests = PurchasingRequest::with('status', 'suppliers', 'user')->where('user_id', '=', $user->id)->orderBy('created_at', 'DESC')->whereBetween('created_at', [date('Y-m-d', strtotime($start))." 00:00:00", date('Y-m-d', strtotime($end))." 23:59:59"])->get();
                }

                else {
                    $purchasing_requests = PurchasingRequest::with('status', 'suppliers', 'user')->where('purchasing_request_status_id', '2')->orderBy('created_at', 'DESC')->whereBetween('created_at', [date('Y-m-d', strtotime($start))." 00:00:00", date('Y-m-d', strtotime($end))." 23:59:59"])->get();
                }
            }

            else {
                if($user->hasRole('Finance Admin')){
                    $purchasing_requests = PurchasingRequest::with('status', 'suppliers', 'user')->where('user_id', '=', $user->id)->orderBy('created_at', 'DESC')->whereBetween('created_at', [date('Y-m-d', strtotime($start))." 00:00:00", date('Y-m-d', strtotime($end))." 23:59:59"])->get();
                }

                else {
                    $purchasing_requests = PurchasingRequest::with('status', 'suppliers', 'user')->where('purchasing_request_status_id', '2')->where('supplier_id', '=', $supplierId)->orderBy('created_at', 'DESC')->whereBetween('created_at', [date('Y-m-d', strtotime($start))." 00:00:00", date('Y-m-d', strtotime($end))." 23:59:59"])->get();
                }
            }
            $data = array('start' => $start, 'end' => $end, 'suppliers' => $suppliers, 'purchasing_requests' => $purchasing_requests);


            return view('admin.purchasingrequests.completed')->with($data);
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
                $paymentRequest = PurchasingRequest::select('purchasing_requests.created_at as date', 'purchasing_requests.id as pId', 'purchasing_requests.*', 'suppliers.name as cName', 'purchasing_requests_statuses.*')
                ->leftJoin('purchasing_requests_statuses', 'purchasing_requests.purchasing_request_status_id', '=', 'purchasing_requests_statuses.id')
                ->leftJoin('suppliers', 'purchasing_requests.supplier_id', '=', 'suppliers.id')
                ->whereNotNull('purchasing_requests.supplier_id')
                ->where('purchasing_requests.user_id', '=', $user->id)
                ->whereDate('purchasing_requests.created_at', '=', $searchDate)
                ->orderBy('expiry_Date', 'DESC');
            }

            else {
                $paymentRequest = PurchasingRequest::select('purchasing_requests.created_at as date', 'purchasing_requests.id as pId', 'purchasing_requests.*', 'suppliers.name as cName', 'purchasing_requests_statuses.*')
                ->leftJoin('purchasing_requests_statuses', 'purchasing_requests.purchasing_request_status_id', '=', 'purchasing_requests_statuses.id')
                ->leftJoin('suppliers', 'purchasing_requests.supplier_id', '=', 'suppliers.id')
                ->whereNotNull('purchasing_requests.supplier_id')
                ->whereDate('purchasing_requests.created_at', '=', $searchDate)
                ->orderBy('expiry_Date', 'DESC');
            }

            $listAllByDates = DB::select($paymentRequest->orderByRaw('DATE_FORMAT(date, "%y-%m-%d")')->toSql(), $paymentRequest->getBindings());
            $datePrmtr = date('d.m.Y', strtotime($searchDate));

            $data = array('listAllByDates' => $listAllByDates, 'tableTitle' => $datePrmtr . ' Tarihine Ait Ödeme Talepleri');
            return view('admin.purchasingrequests.all_paymentrequest')->with($data);
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }

    public function edit(Request $request, $id)
    {
            $purchasing_request = PurchasingRequest::where('id', '=', $id)->first();
            $suppliers = Suppliers::where('id','!=',$purchasing_request->supplier_id)->get();
            $purchasing_request_statuses = PurchasingRequestStatus::where('id','!=', $purchasing_request->purchasing_request_status_id)->get();
            $data = array('purchasing_request' => $purchasing_request, 'suppliers' => $suppliers, 'purchasing_request_statuses' => $purchasing_request_statuses);

            $page = $request->input('page');

            if($page == "files"){
                return view('admin.purchasingrequests.files')->with($data);
            }
            else {
                return view('admin.purchasingrequests.edit_purchasing_request')->with($data);
            }
    }

    public function update(Request $request, $id)
    {
        try {
            $user = auth()->user();

            //$temp['supplier_id'] = $request->input('supplierId');
            $temp['product_url'] = $request->input('productUrl');
            $temp['product_title'] = $request->input('productTitle');
            $temp['note'] = $request->input('note');

            if (PurchasingRequest::where('id', '=', $id)->update($temp)) {
                return redirect()->route('purchasingrequests.index')->with('message', 'Satın Alma Talebi Başarıyla Güncellendi!');
            }
            else {
                return back()->withInput($request->input());
            }
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }

    public function postPurchasingRequest(Request $request, $id)
    {
        try {
            $user = auth()->user();

            //$temp['post_time'] = Carbon::now()->toDateTimeString();
            $temp['purchasing_request_status_id'] = $request->input('purchasing_request_status_id');
            $temp['note'] = $request->input('note');

            if (PurchasingRequest::where('id', '=', $id)->update($temp)) {
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
        PurchasingRequest::find($id)->delete();
        return redirect()->route('purchasingrequests.index')->with('message', 'Ödeme Talebi Başarıyla Silindi!');
    }
}
