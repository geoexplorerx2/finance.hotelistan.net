<?php

namespace App\Http\Controllers;

use App\Models\ChequeStatus;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ChequeStatusController extends Controller
{
    public function index()
    {
        try {
            $cheque_statuses = ChequeStatus::all();
            $data = array('cheque_statuses' => $cheque_statuses);
            return view('admin.chequestatus.cheque_status_list')->with($data);
        }
        catch (\Throwable $th) {
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
                return redirect()->route('chequestatus.index')->with('message', 'Çek Durumu Başarıyla Eklendi!');
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
            $cheque_statuses = ChequeStatus::where('id','=',$id)->first();
            return view('admin.chequestatus.edit_cheques_status', ['cheque_statuses' => $cheque_statuses]);
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

            if (ChequeStatus::where('id', '=', $id)->update($temp)) {
                return redirect()->route('chequestatus.index')->with('message', 'Çek Durumu Başarıyla Güncellendi!');
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
            ChequeStatus::find($id)->delete();
            return redirect('definitions/chequestatus')->with('message', 'Çek Durumu Başarıyla Silindi!');
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }
}
