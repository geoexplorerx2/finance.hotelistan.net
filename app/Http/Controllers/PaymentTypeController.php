<?php

namespace App\Http\Controllers;

use App\Models\PaymentType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PaymentTypeController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        try {
            $payment_types = PaymentType::all();
            $data = array('payment_types' => $payment_types);
            return view('admin.payment_types.payment_type_list')->with($data);
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }

    public function store(Request $request){
        try {
            $newData = new PaymentType();
            $newData->name = $request->input('name');
            $newData->note = $request->input('note');
            $newData->user_id = auth()->user()->id;
            $result = $newData->save();

            if ($result) {
                return redirect()->route('paymenttypes.index')->with('message', 'Ödeme Türü Başarıyla Kaydedidi!');
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
            $payment_type = PaymentType::where('id','=',$id)->first();

            return view('admin.payment_types.edit_payment_type', ['payment_type' => $payment_type]);
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

            if (PaymentType::where('id', '=', $id)->update($temp)) {
                return redirect('/definitions/paymenttypes')->with('message', 'Ödeme Türü Başarıyla Güncellendi!');
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
            PaymentType::find($id)->delete();
            return redirect()->route('paymenttypes.index')->with('message', 'Ödeme Türü Başarıyla Silindi!');
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }
}
