<?php

namespace App\Http\Controllers\API;

use App\Models\PaymentRequestCategory;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

class paymentrequestcategoryapiController extends Controller
{
    public function index()
    {
        try {
            $payment_request_categories = PaymentRequestCategory::all();
            $data = array('payment_request_categories' => $payment_request_categories);
            return response()->json([
                'status' => true,
                'data' => $data,
            ]);
        } catch (\Throwable $th) {
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
                return response()->json([
                    'status' => true,
                    'message' => 'Ödeme Talebi Durumu Başarıyla Eklendi!',
                ]);
            } else {
                return response()->json([
                    'status' => false,
                    'message' => 'operation failed',
                ]);
            }
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function edit($id)
    {
        try {
            $payment_request_categories = PaymentRequestCategory::where('id', '=', $id)->first();
            return response()->json([
                'status' => true,
                'data' => $payment_request_categories,
            ]);
        } catch (\Throwable $th) {
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
                return response()->json([
                    'status' => true,
                    'message' => 'Ödeme Talebi Durumu Başarıyla Güncellendi!',
                ]);
            } else {
                return response()->json([
                    'status' => false,
                    'message' => 'Operation failed',
                ]);
            }
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function destroy($id)
    {

        if (PaymentRequestCategory::where('id', $id)->count() > 0) {
            if (PaymentRequestCategory::find($id)->delete()) {
                return response()->json([
                    'status' => true,
                    'message' => 'record deleted successfully!',
                ]);
            } else {
                return response()->json([
                    'status' => false,
                    'message' => 'Operation Failes!',
                ]);
            }
        } else {
            return response()->json([
                'status' => false,
                'message' => 'There is no record for this ID!',
            ]);
        }
    }
}
