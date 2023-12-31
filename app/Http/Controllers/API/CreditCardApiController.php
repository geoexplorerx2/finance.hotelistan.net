<?php

namespace App\Http\Controllers\API;

use App\Models\CreditCards;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;


class CreditCardApiController extends Controller
{
    public function index()
    {
        try {
            $creditcards = CreditCards::all();
            $data = array('creditcards' => $creditcards);
            return response()->json([
                'status' => true,
                'creditcards' => (json_decode(json_encode($data), true))["creditcards"],
            ]);
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function store(Request $request)
    {
        try {
            $newData                = new CreditCards();
            $newData->name          = $request->input('creditCardName');
            $newData->number        = $request->input('creditCardNumber');
            $newData->expiry_date   = $request->input('expiry_date');
            $newData->cvv           = $request->input('cvv');
            $newData->currency      = $request->input('creditCardCurrency');
            $newData->note      = $request->input('note');
            $newData->user_id       = auth()->user()->id;
            $result                 = $newData->save();

            if ($result) {
                return response()->json([
                    'status' => true,
                    'data' => 'Kredi Kart Başarıyla Kaydedildi!',
                ]);
            } else {
                return response()->json([
                    'status' => false,
                    'data' => 'Operation Failed',
                ]);
            }
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function edit($id)
    {
        try {
            $creditcard = CreditCards::where('id', '=', $id)->first();
            return response()->json(['creditcard' => $creditcard]);
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function update(Request $request, $id)
    {
        try {
            $user = auth()->user();

            $temp['name'] = $request->input('creditCardName');
            $temp['number'] = $request->input('creditCardNumber');
            $temp['expiry_date'] = $request->input('expiry_date');
            $temp['cvv'] = $request->input('cvv');
            $temp['currency'] = $request->input('creditCardCurrency');
            $temp['note'] = $request->input('note');


            if (CreditCards::where('id', '=', $id)->update($temp)) {
                return response()->json([
                    'status' => true,
                    'data' => 'Kredi Kart Başarıyla Güncellendi!',
                ]);
            } else {
                return response()->json([
                    'status' => false,
                    'data' => 'Operation Failed!',
                ]);
            }
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function destroy($id)
    {
        if (CreditCards::where('id', $id)->count() > 0) {
            if (CreditCards::find($id)->delete()) {
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
