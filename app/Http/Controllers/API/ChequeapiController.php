<?php

namespace App\Http\Controllers\API;

use App\Models\Cheques;
use App\Models\Companies;
use App\Models\ChequeStatus;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class ChequeapiController extends Controller
{

    public function index()
    {
        try {
            $cheques = Cheques::all();
            $companies = Companies::all();
            $chequestatuses = ChequeStatus::all();
            $data = array('cheques' => $cheques, 'companies' => $companies, 'chequestatuses' => $chequestatuses);
            return response()->json([
                'code' => 200,
                'data' => $data,
            ]);
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function store(Request $request)
    {
        try {
            $newData = new Cheques();
            $newData->bank_name = $request->input('bankName');
            $newData->expiry_date = $request->input('expiryDate');
            $newData->issue_date = $request->input('issueDate');
            $newData->cheque_no = $request->input('chequeNo');
            $newData->amount = $request->input('amount');
            $newData->currency = $request->input('chequeCurrency');
            $newData->cheques_statuses_id = $request->input('cheques_statuses_id');
            $newData->company_id = $request->input('company_id');
            $newData->note = $request->input('note');
            $newData->user_id = auth()->user()->id;
            $result = $newData->save();

            if ($result) {
                return response()->json([
                    'code' => 200,
                    'data' => 'Çek Başarıyla Kaydedildi!',
                ]);
            } else {
                return response()->json([
                    'code' => 402,
                    'data' => 'Operation Failed!',
                ]);
            }
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function edit($id)
    {
        try {
            $cheque = Cheques::where('id', '=', $id)->first();
            $companies = Companies::all();
            $chequestatuses = ChequeStatus::all();
            return response()->json([
                'code' => true, 'cheque' => $cheque, 'companies' => $companies, 'chequestatuses' => $chequestatuses
            ]);
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function update(Request $request, $id)
    {
        try {
            $user = auth()->user();

            $temp['bank_name'] = $request->input('bankName');
            $temp['expiry_date'] = $request->input('expiryDate');
            $temp['issue_date'] = $request->input('issueDate');
            $temp['cheque_no'] = $request->input('chequeNo');
            $temp['amount'] = $request->input('amount');
            $temp['currency'] = $request->input('chequeCurrency');
            $temp['cheques_statuses_id'] = $request->input('cheques_statuses_id');
            $temp['company_id'] = $request->input('company_id');
            $temp['note'] = $request->input('note');


            if (Cheques::where('id', '=', $id)->update($temp)) {
                return response()->json([
                    'code' => 200,
                    'data' => 'Çek Başarıyla Güncellendi!',
                ]);
            } else {
                return response()->json([
                    'code' => 402,
                    'data' => 'Operation Failed!',
                ]);
            }
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function destroy($id)
    {
        if (Cheques::where('id', $id)->count() > 0) {
            if (Cheques::find($id)->delete()) {
                return response()->json([
                    'code' => 200,
                    'message' => 'record deleted successfully!',
                ]);
            } else {
                return response()->json([
                    'code' => 400,
                    'message' => 'Operation Failes!',
                ]);
            }
        } else {
            return response()->json([
                'code' => 400,
                'message' => 'There is no record for this ID!',
            ]);
        }
    }
}
