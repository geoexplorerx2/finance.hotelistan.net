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
    public function store(Request $request)
    {
        try {
            $user = auth()->user();
            $newData = new PaymentRequestStatus();
            $newData->name = $request->input('status_name');
            $newData->color = $request->input('status_color');
            $newData->note = $request->input('note');
            $newData->user_id = $user->id;

            if ($newData->save()) {
                return response()->json([
                    'status' => true,
                    'message'=>'Ödeme Talebi Durumu Başarıyla Eklendi!'
                ]);
            } else {
                return response(false, 500);
            }
        } catch (\Throwable $th) {
            throw $th;
        }
    }
}
