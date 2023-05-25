<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\ChequeStatus;
use Illuminate\Http\Request;

class chequestatusapiController extends Controller
{
    public function index()
    {
        try {
            $cheque_statuses = ChequeStatus::all();
            $data = array('cheque_statuses' => $cheque_statuses);
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
            $user = auth()->user();

            $newData = new ChequeStatus();
            $newData->name = $request->input('status_name');
            $newData->color = $request->input('status_color');
            $newData->note = $request->input('note');
            $newData->user_id = $user->id;

            if ($newData->save()) {
                return response()->json([
                    'code' => 200,
                    'data' => 'Cheque Status Recorded Successfully !',
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
            $cheque_statuses = ChequeStatus::where('id', '=', $id)->first();
            return response()->json([
                'code' => 200,
                'data' => $cheque_statuses,
            ]);
        } catch (\Throwable $th) {
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

            if (ChequeStatus::where('id', '=', $id)->update($temp)) {
                return response()->json([
                    'code' => 200,
                    'data', 'Çek Durumu Başarıyla Güncellendi!',
                ]);
            } else {
                return response()->json([
                    'code' => 402,
                    'data', 'Operation failed',
                ]);
            }
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function destroy($id)
    {

        if (ChequeStatus::where('id', $id)->count() > 0) {
            if (ChequeStatus::find($id)->delete()) {
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