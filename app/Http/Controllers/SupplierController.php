<?php

namespace App\Http\Controllers;

use App\Models\Suppliers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SupplierController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        try {
            $suppliers = Suppliers::all();
            $data = array('suppliers' => $suppliers);
            return view('admin.suppliers.supplier_list')->with($data);
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }

    public function store(Request $request){
        try {
            $newData = new Suppliers();
            $newData->name = $request->input('name');
            $newData->person_name = $request->input('personName');
            $newData->phone_number = $request->input('phoneNumber');
            $newData->iban = $request->input('iban');
            $newData->tax = $request->input('tax');
            $newData->note = $request->input('note');
            $newData->user_id = auth()->user()->id;
            $result = $newData->save();

            if ($result) {
                return redirect()->route('suppliers.index')->with('message', 'Tedarikçi Başarıyla Kaydedildi!');
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
            $supplier = Suppliers::where('id','=',$id)->first();

            return view('admin.suppliers.edit_supplier', ['supplier' => $supplier]);
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
            $temp['person_name'] = $request->input('personName');
            $temp['phone_number'] = $request->input('phoneNumber');
            $temp['iban'] = $request->input('iban');
            $temp['tax'] = $request->input('tax');
            $temp['note'] = $request->input('note');

            if (Suppliers::where('id', '=', $id)->update($temp)) {
                return redirect()->route('suppliers.index')->with('message', 'Tedarikçi Başarıyla Güncellendi!');
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
            Suppliers::find($id)->delete();
            return redirect()->route('suppliers.index')->with('message', 'Tedarikçi Başarıyla Silindi!');
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }
}
