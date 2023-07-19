<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\PaymentRequestStatus;
use Illuminate\Support\Facades\Validator;
use App\Models\User;

class PaymentRequestStatusController extends Controller
{
    public function show()
    {

        return collect([
            "status" => true,
            "payment_request_status" => PaymentRequestStatus::all()->map(function ($item) {
                $item->user_name = User::find($item->user_id)->name ?? null;
                return $item;
            }),
        ]);
    }
    public function store(Request $request)
    {
        $response = null;
        $rules = [
            'status_name' => 'required|string|max:255',
            'status_color' => 'required|string|max:255',
            'note' => 'required|string|max:255',
        ];
        $data = [
            'status_name' => $request->get('status_name'),
            'status_color' => $request->get('status_color'),
            'note' => $request->get('note'),
        ];

        $validator = Validator::make($data, $rules);

        if ($validator->fails()) {
            $response =  $validator->errors();
        } else {
            try {
                $user = auth()->user();
                $newData = new PaymentRequestStatus();
                $newData->name = $request->input('status_name');
                $newData->color = $request->input('status_color');
                $newData->note = $request->input('note');
                $newData->user_id = $user->id;

                if ($newData->save()) {
                    $response =  response()->json([
                        'status' => true,
                        'message' => 'Ödeme Talebi Durumu Başarıyla Eklendi!'
                    ]);
                } else {
                    $response = response(false, 500);
                }
            } catch (\Throwable $th) {
                throw $th;
            }
        }
        return $response;
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
                return response()->json([
                    "status" => true,
                    'message' => 'Ödeme Talebi Durumu Başarıyla Güncellendi!'
                ]);
            } else {
                return back()->withInput($request->input());
            }
        } catch (\Throwable $th) {
            throw $th;
        }
    }
    public function destroy($id)
    {
        try {
            PaymentRequestStatus::find($id)->delete();
            return response()->json([
                "status" => true,
                'message' => 'Ödeme Talebi Durumu Başarıyla Silindi!'
            ]);
        } catch (\Throwable $th) {
            throw $th;
        }
    }
}
