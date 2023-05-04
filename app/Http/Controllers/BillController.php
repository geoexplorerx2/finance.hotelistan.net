<?php

namespace App\Http\Controllers;

use App\Models\Bills;
use App\Models\Companies;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class BillController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        try {
            $bills = Bills::all();
            $companies= Companies::all();
            $data = array('bills' => $bills,'companies' => $companies);
            return view('admin.bills.bill_list')->with($data);
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }

    public function store(Request $request){
        try {
            $newData = new Bills();
            $newData->bank_name = $request->input('bankName');
            $newData->expiry_date = $request->input('expiryDate');
            $newData->issue_date = $request->input('issueDate');
            $newData->amount = $request->input('amount');
            $newData->company_id = $request->input('company_id');
            $newData->note = $request->input('note');
            $newData->user_id = auth()->user()->id;
            $result = $newData->save();

            if ($result) {
                return redirect()->route('bills.index')->with('message', 'Senet Başarıyla Kaydedildi!');
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
            $bill = Bills::where('id','=',$id)->first();
            $companies = Companies::all();
            return view('admin.bills.edit_bill', ['bill' => $bill,'companies' => $companies]);
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }

    public function update(Request $request, $id)
    {
        try {
            $user = auth()->user();

            $temp['bank_name'] = $request->input('bankName');
            $temp['expiry_date'] = $request->input('expiryDate');
            $temp['issue_date'] = $request->input('issueDate');
            $temp['amount'] = $request->input('amount');
            $temp['company_id'] = $request->input('company_id');
            $temp['note'] = $request->input('note');


            if (Bills::where('id', '=', $id)->update($temp)) {
                return redirect()->route('bills.index')->with('message', 'Senet Başarıyla Güncellendi!');
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
            Bills::find($id)->delete();
            return redirect()->route('bills.index')->with('message', 'Senet Başarıyla Silindi!');
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }
}
