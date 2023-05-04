<?php

namespace App\Http\Controllers;

use App\Models\AnnualLeave;
use App\Models\AnnualLeaveType;
use App\Models\PersonnelCard;
use Illuminate\Http\Request;

class AnnualLeaveController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        try {
            $personnel_cards = PersonnelCard::all();
            $annual_leave_types = AnnualLeaveType::all();
            $annual_leaves = AnnualLeave::all();
            $data = array('personnel_cards' => $personnel_cards,'annual_leave_types' => $annual_leave_types,'annual_leaves' => $annual_leaves);
            return view('admin.annualleaves.annual_leave_list')->with($data);
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }

    public function store(Request $request){
        try {
            $newData = new AnnualLeave();
            $newData->personnel_id = $request->input('personnelTypeID');
            $newData->annual_leave_type_id  = $request->input('annualTypeID');
            $newData->start_date = $request->input('startDate');
            $newData->end_date = $request->input('endDate');
            $newData->note = $request->input('note');
            $newData->user_id = auth()->user()->id;
            $result = $newData->save();

            if ($result) {
                return redirect()->route('annualleaves.index')->with('message', 'Yıllık İzin Başarıyla Kaydedidi!');
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
        $annual_leave = AnnualLeave::where('id','=',$id)->first();
        $annual_leave_types = AnnualLeaveType::where('id','!=', $annual_leave->annual_leave_type_id)->get();
        $personnel_cards = PersonnelCard::where('id','!=', $annual_leave->personnel_id)->get();

        $data = array('annual_leave' => $annual_leave,'annual_leave_types' => $annual_leave_types,'personnel_cards' => $personnel_cards,);

        return view('admin.annualleaves.edit_annual_leave')->with($data);
    }

    public function update(Request $request, $id)
    {
        try {
            $user = auth()->user();

            $temp['personnel_id']      = $request->input('personnelTypeID');
            $temp['annual_leave_type_id']   = $request->input('annualTypeID');
            $temp['start_date']             = $request->input('startDate');
            $temp['end_date']               = $request->input('endDate');
            $temp['note']                   = $request->input('note');

            if (AnnualLeave::where('id', '=', $id)->update($temp)) {
                return redirect()->route('annualleaves.index')->with('message', 'Yıllık İzin Başarıyla Güncellendi!');
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
        AnnualLeave::find($id)->delete();
        return redirect()->route('annualleaves.index')->with('message', 'Yıllık İzin Başarıyla Silindi!');
    }
}
