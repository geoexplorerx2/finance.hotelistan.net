<?php

namespace App\Http\Controllers;

use App\Models\Companies;
use App\Models\PaymentRequest;
use App\Models\PurchasingRequest;
use App\Models\User;
use Auth;
use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ReportController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(Request $request)
    {
        try {
            $week = $request->input('W');
            $month = $request->input('M');

            $data = \DB::table("users")
                ->select("users.name", \DB::raw("(SELECT count(*) FROM payment_requests a WHERE a.user_id = users.id and a.deleted_at is null) as aCount"))
                ->join('model_has_roles', 'model_has_roles.model_id', '=', 'users.id')
                ->get();

            return view('admin.reports.report', array('data' => $data));
            // return json_encode($data);
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }

    public function companiesReport(Request $request)
    {
        try {

            $data = PaymentRequest::select('companies.name', DB::raw('paid_company_id, count(*) as count'))
            ->leftJoin('companies', 'payment_requests.paid_company_id', '=', 'companies.id')
            ->groupBy('paid_company_id')
            ->get();

            return json_encode($data);
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }

    public function usersReport(Request $request)
    {
        try {

            $data = PaymentRequest::select('users.name', DB::raw('user_id, count(*) as count'))
            ->leftJoin('users', 'payment_requests.user_id', '=', 'users.id')
            ->groupBy('user_id')
            ->get();

            return json_encode($data);
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }

    public function purchasingUsersReport(Request $request)
    {
        try {

            $data = PurchasingRequest::select('users.name', DB::raw('user_id, count(*) as count'))
            ->leftJoin('users', 'purchasing_requests.user_id', '=', 'users.id')
            ->groupBy('user_id')
            ->get();

            return json_encode($data);
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }
    public function suppliersReport(Request $request)
    {
        try {

            $data = PurchasingRequest::select('suppliers.name', DB::raw('supplier_id, count(*) as count'))
            ->leftJoin('suppliers', 'purchasing_requests.supplier_id', '=', 'suppliers.id')
            ->groupBy('supplier_id')
            ->get();

            return json_encode($data);
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }
    public function paymentReport(Request $request)
    {
        try {
            $user = auth()->user();

            $start = $request->input('startDate');
            $end = $request->input('endDate');
            $companyId = $request->input('companyId');

            $companies = Companies::all();

            $data = array('start' => $start, 'end' => $end, 'companyId' => $companyId, 'companies' => $companies);

            return view('admin.reports.payment_report')->with($data);
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }

}
