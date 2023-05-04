<?php

namespace App\Http\Controllers;

use App\Models\Liability;
use App\Models\PersonnelCard;
use Illuminate\Http\Request;

class LiabilityController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        try {
            $personnel_cards = PersonnelCard::all();
            $liabilities = Liability::all();
            $data = array('personnel_cards' => $personnel_cards,'liabilities' => $liabilities);
            return view('admin.liabilities.liability_list')->with($data);
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }

    public function store(Request $request){
        try {
            $newData = new Liability();
            $newData->personnel_card_id = $request->input('personnelID');
            $newData->product_model     = $request->input('productModel');
            $newData->signature_date    = $request->input('startDate');
            $newData->note              = $request->input('note');
            $newData->user_id           = auth()->user()->id;
            $result = $newData->save();

            if ($result) {
                return redirect()->route('liabilities.index')->with('message', 'Zimmet Başarıyla Kaydedidi!');
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
        $liability = Liability::where('id','=',$id)->first();
        $personnel_cards = PersonnelCard::where('id','!=', $liability->personnel_card_id)->get();

        $data = array('liability' => $liability, 'personnel_cards' => $personnel_cards,);

        return view('admin.liabilities.edit_liability')->with($data);
    }

    public function update(Request $request, $id)
    {
        try {
            $user = auth()->user();

            $temp['personnel_card_id']      = $request->input('personnelID');
            $temp['product_model']          = $request->input('productModel');
            $temp['signature_date']         = $request->input('startDate');
            $temp['note']                   = $request->input('note');

            if (Liability::where('id', '=', $id)->update($temp)) {
                return redirect()->route('liabilities.index')->with('message', 'Zimmet Başarıyla Güncellendi!');
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
        Liability::find($id)->delete();
        return redirect()->route('liabilities.index')->with('message', 'Zimmet Başarıyla Silindi!');
    }
}
