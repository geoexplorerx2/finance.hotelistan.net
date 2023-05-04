<?php

namespace App\Http\Controllers;

use App\Models\Companies;
use App\Models\PaymentRequest;
use App\Models\Suppliers;
use App\Models\PurchasingRequest;
use Carbon\Carbon;
use Auth;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        $user = auth()->user();

        $currentMonth = date('m');
        $data = array();

        if ($user->hasRole('Super Admin')){

            $requestedPaymentRequests = PaymentRequest::whereDate('expiry_date', Carbon::today())
                ->where('payment_requests.payment_request_status_id', '=', '1')
                ->get();

            $completedPaymentRequests = PaymentRequest::whereDate('expiry_date', Carbon::today())
                ->where('payment_requests.payment_request_status_id', '=', '2')
                ->get();

            $companyCount = Companies::count();
            $paymentRequestCount = PaymentRequest::count();
            $lastPaymentRequests = PaymentRequest::latest()->take(5)->get();
            $payments_requests = PaymentRequest::whereDate('created_at', Carbon::today())->get();

            $super_admin_dashboard = array('companyCount' => $companyCount, 'paymentRequestCount' => $paymentRequestCount, 'payments_requests' => $payments_requests, 'lastPaymentRequests' => $lastPaymentRequests, 'requestedPaymentRequests' => $requestedPaymentRequests, 'completedPaymentRequests' => $completedPaymentRequests);
            return view('home')->with($super_admin_dashboard);
        }

        if ($user->hasRole('Human Resources Admin')){

            $requestedPaymentRequests = PaymentRequest::whereDate('expiry_date', Carbon::today())
                ->where('payment_requests.payment_request_status_id', '=', '1')
                ->get();

            $completedPaymentRequests = PaymentRequest::whereDate('expiry_date', Carbon::today())
                ->where('payment_requests.payment_request_status_id', '=', '2')
                ->get();

            $companyCount = Companies::count();
            $paymentRequestCount = PaymentRequest::count();
            $lastPaymentRequests = PaymentRequest::latest()->take(5)->get();
            $payments_requests = PaymentRequest::whereDate('created_at', Carbon::today())->get();

            $super_admin_dashboard = array('companyCount' => $companyCount, 'paymentRequestCount' => $paymentRequestCount, 'payments_requests' => $payments_requests, 'lastPaymentRequests' => $lastPaymentRequests, 'requestedPaymentRequests' => $requestedPaymentRequests, 'completedPaymentRequests' => $completedPaymentRequests);
            return view('home')->with($super_admin_dashboard);
        }

        if ($user->hasRole('Ceo')){
            $requestedPaymentRequests = PaymentRequest::whereDate('expiry_date', Carbon::today())
            ->where('payment_requests.payment_request_status_id', '=', '1')
            ->get();

            $completedPaymentRequests = PaymentRequest::whereDate('expiry_date', Carbon::today())
                ->where('payment_requests.payment_request_status_id', '=', '2')
                ->get();

            $companyCount = Companies::count();
            $paymentRequestCount = PaymentRequest::count();
            $lastPaymentRequests = PaymentRequest::latest()->take(5)->get();
            $payments_requests = PaymentRequest::whereDate('created_at', Carbon::today())->get();

            $ceo_dashboard = array('companyCount' => $companyCount, 'paymentRequestCount' => $paymentRequestCount, 'payments_requests' => $payments_requests, 'lastPaymentRequests' => $lastPaymentRequests, 'requestedPaymentRequests' => $requestedPaymentRequests, 'completedPaymentRequests' => $completedPaymentRequests);
            return view('ceo.home')->with($ceo_dashboard);
        }

        else if ($user->hasRole('Finance Admin') || $user->hasRole('Finance Person')){

            $requestedPaymentRequests = PaymentRequest::whereDate('expiry_date', Carbon::today())
                ->where('payment_requests.payment_request_status_id', '=', '1')
                ->get();

            $completedPaymentRequests = PaymentRequest::whereDate('expiry_date', Carbon::today())
                ->where('payment_requests.payment_request_status_id', '=', '2')
                ->get();

            $companyCount = Companies::count();
            $paymentRequestCount = PaymentRequest::count();
            $lastPaymentRequests = PaymentRequest::latest()->take(5)->get();
            $payments_requests = PaymentRequest::whereDate('created_at', Carbon::today())->get();

            $super_admin_dashboard = array('companyCount' => $companyCount, 'paymentRequestCount' => $paymentRequestCount, 'payments_requests' => $payments_requests, 'lastPaymentRequests' => $lastPaymentRequests, 'requestedPaymentRequests' => $requestedPaymentRequests, 'completedPaymentRequests' => $completedPaymentRequests);
            return view('financeadmin.home')->with($super_admin_dashboard);
        }
        elseif ($user->hasRole('Purchasing Admin') || $user->hasRole('Purchasing Person')){

                $requestedPurchasingRequests = PurchasingRequest::whereDate('created_at', Carbon::today())
                    ->where('purchasing_requests.purchasing_request_status_id', '=', '1')
                    ->get();

                $completedPurchasingRequests = PurchasingRequest::whereDate('created_at', Carbon::today())
                    ->where('purchasing_requests.purchasing_request_status_id', '=', '2')
                    ->get();

                $supplierCount = Suppliers::count();
                $purchasingRequestCount = PurchasingRequest::count();
                $lastPurchasingtRequests = PurchasingRequest::latest()->take(5)->get();
                $purchasing_requests = PurchasingRequest::whereDate('created_at', Carbon::today())->get();

                $super_admin_dashboard = array('supplierCount' => $supplierCount, 'purchasingRequestCount' => $purchasingRequestCount, 'purchasing_requests' => $purchasing_requests, 'lastPurchasingtRequests' => $lastPurchasingtRequests, 'requestedPurchasingRequests' => $requestedPurchasingRequests, 'completedPurchasingRequests' => $completedPurchasingRequests);
                return view('purchasingadmin.home')->with($super_admin_dashboard);
            }

        else {
            return "";
        }
    }
}
