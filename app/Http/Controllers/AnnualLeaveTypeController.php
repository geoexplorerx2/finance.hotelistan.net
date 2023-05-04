<?php

namespace App\Http\Controllers;

use App\Models\AnnualLeaveType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AnnualLeaveTypeController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        try {
            $annual_leave_types = AnnualLeaveType::all();
            $data = array('annual_leave_types' => $annual_leave_types);
            return view('admin.annual_leave_type.annual_leave_type_list')->with($data);
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }

    public function store(Request $request){
        try {
            $newData = new AnnualLeaveType();
            $newData->name = $request->input('name');
            $newData->note = $request->input('note');
            $newData->user_id = auth()->user()->id;
            $result = $newData->save();

            if ($result) {
                return redirect()->route('annualleavetypes.index')->with('message', 'Yıllık İzin Türü Başarıyla Kaydedidi!');
            }
            else {
                return back()->withInput($request->input());
            }
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }

    public function edit($id)
    {
        try {
            $annual_leave_type = AnnualLeaveType::where('id','=',$id)->first();

            return view('admin.annual_leave_type.edit_annual_leave_type', ['annual_leave_type' => $annual_leave_type]);
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }

    public function update(Request $request, $id)
    {
        try {
            $user = auth()->user();

            $temp['name'] = $request->input('name');
            $temp['note'] = $request->input('note');

            if (AnnualLeaveType::where('id', '=', $id)->update($temp)) {
                return redirect('/definitions/annualleavetypes')->with('message', 'Yıllık İzin Türü Başarıyla Güncellendi!');
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
            AnnualLeaveType::find($id)->delete();
            return redirect()->route('annualleavetypes.index')->with('message', 'Yıllık İzin Türü Başarıyla Silindi!');
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }
}
