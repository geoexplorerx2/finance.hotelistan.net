<?php

namespace App\Http\Controllers;

use App\Models\CreditCards;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CreditCardController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        try {
            $creditcards = CreditCards::all();
            $data = array('creditcards' => $creditcards);
            return view('admin.creditcards.creditcard_list')->with($data);
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }

    public function store(Request $request){
        try {
            $newData                = new CreditCards();
            $newData->name          = $request->input('creditCardName');
            $newData->number        = $request->input('creditCardNumber');
            $newData->expiry_date   = $request->input('expiry_date');
            $newData->cvv           = $request->input('cvv');
            $newData->currency      = $request->input('creditCardCurrency');
            $newData->note      = $request->input('note');
            $newData->user_id       = auth()->user()->id;
            $result                 = $newData->save();

            if ($result) {
                return redirect()->route('creditcards.index')->with('message', 'Kredi Kart Başarıyla Kaydedildi!');
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
            $creditcard = CreditCards::where('id','=',$id)->first();
            return view('admin.creditcards.edit_creditcard', ['creditcard' => $creditcard]);
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }

    public function update(Request $request, $id)
    {
        try {
            $user = auth()->user();

            $temp['name'] = $request->input('creditCardName');
            $temp['number'] = $request->input('creditCardNumber');
            $temp['expiry_date'] = $request->input('expiry_date');
            $temp['cvv'] = $request->input('cvv');
            $temp['currency'] = $request->input('creditCardCurrency');
            $temp['note'] = $request->input('note');


            if (CreditCards::where('id', '=', $id)->update($temp)) {
                return redirect()->route('creditcards.index')->with('message', 'Kredi Kart Başarıyla Güncellendi!');
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
            CreditCards::find($id)->delete();
            return redirect()->route('creditcards.index')->with('message', 'Kredi Kart Başarıyla Silindi!');
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }
}
