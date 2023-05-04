<?php

namespace App\Http\Controllers;

use App\Models\Companies;
use App\Models\PaymentType;
use Illuminate\Http\Request;

class CompanyController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        try {
            $payment_types = PaymentType::all();
            $companies = Companies::all();
            $data = array('companies' => $companies,'payment_types' => $payment_types);
            return view('admin.companies.company_list')->with($data);
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }

    public function store(Request $request){
        try {
            $newData = new Companies();
            $newData->name = $request->input('name');
            $newData->bank_name = $request->input('bankName');
            $newData->bank_iban = $request->input('bankIban');
            $newData->person_name = $request->input('personName');
            $newData->phone_number = $request->input('phoneNumber');
            $newData->payment_type_id = $request->input('paymentTypeID');
            $newData->expiry_date = $request->input('ExpiryDate');
            $newData->note = $request->input('note');
            $newData->user_id = auth()->user()->id;
            $result = $newData->save();

            if ($result) {
                return redirect()->route('companies.index')->with('message', 'Firma Başarıyla Kaydedidi!');
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
        $company = Companies::where('id','=',$id)->first();
        $payment_types = PaymentType::all();

        $data = array('company' => $company,'payment_types' => $payment_types);

        return view('admin.companies.edit_company')->with($data);
    }

    public function update(Request $request, $id)
    {
        try {
            $user = auth()->user();

            $temp['name'] = $request->input('name');
            $temp['bank_name'] = $request->input('bankName');
            $temp['bank_iban'] = $request->input('bankIban');
            $temp['person_name'] = $request->input('personName');
            $temp['phone_number'] = $request->input('phoneNumber');
            $temp['payment_type_id'] = $request->input('paymentTypeID');
            $temp['expiry_date'] = $request->input('ExpiryDate');
            $temp['note'] = $request->input('note');

            if (Companies::where('id', '=', $id)->update($temp)) {
                return redirect()->route('companies.index')->with('message', 'Firma Başarıyla Güncellendi!');
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
        Companies::find($id)->delete();
        return redirect()->route('companies.index')->with('message', 'Firma Başarıyla Silindi!');
    }
}
