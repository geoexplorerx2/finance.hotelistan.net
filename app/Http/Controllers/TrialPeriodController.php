<?php

namespace App\Http\Controllers;

use App\Models\TrialPeriods;
use App\Models\PersonnelCard;
use Illuminate\Http\Request;

class TrialPeriodController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        try {
            $personnel_cards = PersonnelCard::all();
            $trial_periods = TrialPeriods::all();
            $data = array('personnel_cards' => $personnel_cards,'trial_periods' => $trial_periods);
            return view('admin.trialperiods.trial_period_list')->with($data);
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }

    public function store(Request $request){
        try {
            $newData = new TrialPeriods();
            $newData->personnel_card_id = $request->input('personnelTypeID');
            $newData->start_date = $request->input('startDate');
            $newData->end_date = $request->input('endDate');
            $newData->note = $request->input('note');
            $newData->user_id = auth()->user()->id;
            $result = $newData->save();

            if ($result) {
                return redirect()->route('trialperiods.index')->with('message', 'Deneme Süreleri Başarıyla Kaydedidi!');
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
        $trial_period = TrialPeriods::where('id','=',$id)->first();
        $personnel_cards = PersonnelCard::where('id','!=', $trial_period->personnel_card_id)->get();

        $data = array('trial_period' => $trial_period,'personnel_cards' => $personnel_cards,);

        return view('admin.trialperiods.edit_trial_period')->with($data);
    }

    public function update(Request $request, $id)
    {
        try {
            $user = auth()->user();

            $temp['personnel_card_id']      = $request->input('personnelTypeID');
            $temp['start_date']             = $request->input('startDate');
            $temp['end_date']               = $request->input('endDate');
            $temp['note']                   = $request->input('note');

            if (TrialPeriods::where('id', '=', $id)->update($temp)) {
                return redirect()->route('trialperiods.index')->with('message', 'Deneme Süreleri Başarıyla Güncellendi!');
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
        TrialPeriods::find($id)->delete();
        return redirect()->route('trialperiods.index')->with('message', 'Deneme Süreleri Başarıyla Silindi!');
    }
}
