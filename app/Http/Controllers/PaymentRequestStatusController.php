<?php

namespace App\Http\Controllers;

use App\Models\PaymentRequestStatus;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PaymentRequestStatusController extends Controller
{
    public function index()
    {
        try {
            $payment_request_statuses = PaymentRequestStatus::all();
            $data = array('payment_request_statuses' => $payment_request_statuses);
            return view('admin.paymentrequeststatus.payment_request_status_list')->with($data);
        }
        catch (\Throwable $th) {
            throw $th;
        }
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
                return redirect()->route('paymentrequeststatus.index')->with('message', 'Ödeme Talebi Durumu Başarıyla Eklendi!');
            }
            else {
                return response(false, 500);
            }
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }

    public function edit($id)
    {
        try {
            $payment_request_statuses = PaymentRequestStatus::where('id','=',$id)->first();
            return view('admin.paymentrequeststatus.edit_payments_status', ['payment_request_statuses' => $payment_request_statuses]);
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }

    public function update(Request $request, $id)
    {
        try {
            $user = auth()->user();

            $temp['name'] = $request->input('status_name');
            $temp['color'] = $request->input('status_color');
            $temp['note'] = $request->input('note');
            $temp['user_id'] = $user->id;

            if (PaymentRequestStatus::where('id', '=', $id)->update($temp)) {
                return redirect()->route('paymentrequeststatus.index')->with('message', 'Ödeme Talebi Durumu Başarıyla Güncellendi!');
            }
            else {
                return back()->withInput($request->input());
            }
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }

    public function destroy($id){
        try {
            PaymentRequestStatus::find($id)->delete();
            return redirect('definitions/paymentrequeststatus')->with('message', 'Ödeme Talebi Durumu Başarıyla Silindi!');
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }
}
