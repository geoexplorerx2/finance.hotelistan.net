<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Companies;
use App\Models\PaymentType;


class paymenttypesapiController extends Controller
{


    public function index()
    {
        try {
            $payment_types = PaymentType::all();
            $data = array('payment_types' => $payment_types);
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
            $newData = new PaymentType();
            $newData->name = $request->input('name');
            $newData->note = $request->input('note');
            $newData->user_id = auth()->user()->id;
            $result = $newData->save();

            if ($result) {
                return response()->json([
                    'status' => true,
                    'message' => 'Ödeme Türü Başarıyla Kaydedidi!',
                ]);
            } else {
                return response()->json([
                    'status' => false,
                    'message' => 'Opration Failed',
                ]);
            }
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function edit($id)
    {
        try {
            $payment_type = PaymentType::where('id', '=', $id)->first();

            return response()->json([
                'status' => true,
                'data' => $payment_type,
            ]);
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function update(Request $request, $id)
    {
        try {
            $user = auth()->user();

            $temp['name'] = $request->input('name');
            $temp['note'] = $request->input('note');

            if (PaymentType::where('id', '=', $id)->update($temp)) {
                return response()->json([
                    'message' => 'Ödeme Türü Başarıyla Güncellendi!',
                ]);
            } else {
                return response()->json([
                    'message' => 'Operation Failed',
                ]);
            }
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function destroy($id)
    {

        if (PaymentType::where('id', $id)->count() > 0) {
            if (PaymentType::find($id)->delete()) {
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
