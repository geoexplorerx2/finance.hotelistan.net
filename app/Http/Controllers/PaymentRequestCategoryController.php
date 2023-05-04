<?php

namespace App\Http\Controllers;

use App\Models\PaymentRequestCategory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PaymentRequestCategoryController extends Controller
{
    public function index()
    {
        try {
            $payment_request_categories = PaymentRequestCategory::all();
            $data = array('payment_request_categories' => $payment_request_categories);
            return view('admin.paymentrequestcategory.payment_request_category_list')->with($data);
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }

    public function store(Request $request)
    {
        try {
            $user = auth()->user();

            $newData = new PaymentRequestCategory();
            $newData->name = $request->input('category_name');
            $newData->color = $request->input('category_color');
            $newData->note = $request->input('note');
            $newData->user_id = $user->id;

            if ($newData->save()) {
                return redirect()->route('paymentrequestcategory.index')->with('message', 'Ödeme Talebi Durumu Başarıyla Eklendi!');
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
            $payment_request_categories = PaymentRequestCategory::where('id','=',$id)->first();
            return view('admin.paymentrequestcategory.edit_payments_category', ['payment_request_categories' => $payment_request_categories]);
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }

    public function update(Request $request, $id)
    {
        try {
            $user = auth()->user();

            $temp['name'] = $request->input('category_name');
            $temp['color'] = $request->input('category_color');
            $temp['note'] = $request->input('note');
            $temp['user_id'] = $user->id;

            if (PaymentRequestCategory::where('id', '=', $id)->update($temp)) {
                return redirect()->route('paymentrequestcategory.index')->with('message', 'Ödeme Talebi Durumu Başarıyla Güncellendi!');
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
            PaymentRequestCategory::find($id)->delete();
            return redirect('definitions/paymentrequestcategory')->with('message', 'Ödeme Talebi Durumu Başarıyla Silindi!');
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }
}
