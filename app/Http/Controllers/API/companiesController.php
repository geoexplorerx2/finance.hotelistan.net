<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Companies;

class companiesController extends Controller
{
    public function store(Request $request)
    {

        if (
            Companies::where('bank_iban', $request->input('bankIban'))
            ->where('bank_iban', $request->input('bankIban'))
            ->where('phone_number', $request->input('phoneNumber'))
            ->count() < 1
        ) {
            try {
                $newData = new Companies();
                $newData->name = $request->input('name');
                $newData->bank_name = $request->input('bankName');
                $newData->bank_iban = $request->input('bankIban');
                $newData->person_name = $request->input('personName');
                $newData->phone_number = $request->input('phoneNumber');
                $newData->payment_type_id = $request->input('paymentTypeID');
                $newData->expiry_date = $request->input('ExpiryDate');
                $newData->note = $request->input('note');
                $newData->user_id = auth()->user()->id;
                $result = $newData->save();

                if ($result) {
                    return response()->json([
                        "code" => 200,
                        'message' => 'Firma Başarıyla Kaydedidi!'
                    ]);
                } else {
                    return response()->json([
                        "code" => 403,
                        'message' => 'Operation Failed',
                    ]);
                }
            } catch (\Throwable $th) {
                throw $th;
            }
        } else {
            return response()->json([
                "code" => 403,
                'message' => 'These phonenumbers and IBAN numbers Already recorded'
            ]);
        }
    }
}
