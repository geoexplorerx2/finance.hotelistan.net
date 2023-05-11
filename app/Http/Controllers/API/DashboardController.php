<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Companies;
use App\Models\PaymentRequest;

class DashboardController extends Controller{
    public function counts(){
        return response()->json([
            "payment_request_count" => PaymentRequest::count(),
            "company_count" => Companies::count(),
        ]);
    }
}