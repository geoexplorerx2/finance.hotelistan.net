<?php

namespace App\Http\Controllers;

use App\Models\CheckRegistration;
use App\Models\PersonnelCard;
use Illuminate\Http\Request;

class CheckRegistrationController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        try {
            $personnel_cards = PersonnelCard::all();
            $check_registrations = CheckRegistration::all();
            $data = array('personnel_cards' => $personnel_cards,'check_registrations' => $check_registrations);
            return view('admin.checkregistrations.check_registration_list')->with($data);
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }

    public function store(Request $request){
        try {
            $newData = new CheckRegistration();
            $newData->personnel_card_id = $request->input('personnelTypeID');
            $newData->start_hour = $request->input('startHour');
            $newData->end_hour = $request->input('endHour');
            $newData->check_date = $request->input('startDate');
            $newData->note = $request->input('note');
            $newData->user_id = auth()->user()->id;
            $result = $newData->save();

            if ($result) {
                return redirect()->route('checkregistrations.index')->with('message', 'Puantaj Kayıt Başarıyla Kaydedidi!');
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
        $check_registration = CheckRegistration::where('id','=',$id)->first();
        $personnel_cards = PersonnelCard::where('id','!=', $check_registration->personnel_card_id)->get();

        $data = array('check_registration' => $check_registration,'personnel_cards' => $personnel_cards,);

        return view('admin.checkregistrations.edit_check_registration')->with($data);
    }

    public function update(Request $request, $id)
    {
        try {
            $user = auth()->user();

            $temp['personnel_card_id']      = $request->input('personnelTypeID');
            $temp['start_hour']             = $request->input('startHour');
            $temp['end_hour']               = $request->input('endHour');
            $temp['check_date']               = $request->input('startDate');
            $temp['note']                   = $request->input('note');

            if (CheckRegistration::where('id', '=', $id)->update($temp)) {
                return redirect()->route('checkregistrations.index')->with('message', 'Puantaj Kayıt Başarıyla Güncellendi!');
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
        CheckRegistration::find($id)->delete();
        return redirect()->route('checkregistrations.index')->with('message', 'Puantaj Kayıt Başarıyla Silindi!');
    }
}
