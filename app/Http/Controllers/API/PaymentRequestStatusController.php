<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\PaymentRequestStatus;
use App\Models\User;

class PaymentRequestStatusController extends Controller
{
    public function show()
    {
        return PaymentRequestStatus::all()->map(function ($item) {
            $item->user_name = User::find($item->user_id)->name ?? null;
            return $item;
        });
    }
}
