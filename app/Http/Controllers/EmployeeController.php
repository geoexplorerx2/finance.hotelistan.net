<?php

namespace App\Http\Controllers;

use App\Models\Employees;
use App\Models\Companies;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class EmployeeController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        try {
            $employees = Employees::all();
            $companies= Companies::all();
            $data = array('employees' => $employees,'companies' => $companies);
            return view('admin.employees.employee_list')->with($data);
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }

    public function store(Request $request){
        try {
            $newData = new Employees();
            $newData->name_surname = $request->input('nameSurname');
            $newData->bank_name = $request->input('bankName');
            $newData->bank_iban = $request->input('bankIban');
            $newData->staff = $request->input('staff');
            $newData->company_id = $request->input('company_id');
            $newData->note = $request->input('note');
            $newData->user_id = auth()->user()->id;
            $result = $newData->save();

            if ($result) {
                return redirect()->route('employees.index')->with('message', 'Personel Başarıyla Kaydedildi!');
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
            $employee = Employees::where('id','=',$id)->first();
            $companies = Companies::all();
            return view('admin.employees.edit_employee', ['employee' => $employee,'companies' => $companies]);
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }

    public function update(Request $request, $id)
    {
        try {
            $user = auth()->user();

            $temp['name_surname'] = $request->input('nameSurname');
            $temp['bank_name'] = $request->input('bankName');
            $temp['bank_iban'] = $request->input('bankIban');
            $temp['staff'] = $request->input('staff');
            $temp['company_id'] = $request->input('company_id');
            $temp['note'] = $request->input('note');


            if (Employees::where('id', '=', $id)->update($temp)) {
                return redirect()->route('employees.index')->with('message', 'Personel Başarıyla Güncellendi!');
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
            Employees::find($id)->delete();
            return redirect()->route('employees.index')->with('message', 'Personel Başarıyla Silindi!');
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }
}
