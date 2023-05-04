<?php

namespace App\Http\Controllers;

use App\Models\CompanyType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CompanyTypeController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        try {
            $company_types = CompanyType::all();
            $data = array('company_types' => $company_types);
            return view('admin.companytypes.company_type_list')->with($data);
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }

    public function store(Request $request){
        try {
            $newData = new CompanyType();
            $newData->name = $request->input('name');
            $newData->note = $request->input('note');
            $newData->user_id = auth()->user()->id;
            $result = $newData->save();

            if ($result) {
                return redirect()->route('companytypes.index')->with('message', 'Firma Türü Başarıyla Kaydedidi!');
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
            $company_type = CompanyType::where('id','=',$id)->first();

            return view('admin.companytypes.edit_company_type', ['company_type' => $company_type]);
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

            if (CompanyType::where('id', '=', $id)->update($temp)) {
                return redirect('/definitions/companytypes')->with('message', 'Firma Türü Başarıyla Güncellendi!');
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
            CompanyType::find($id)->delete();
            return redirect()->route('companytypes.index')->with('message', 'Firma Türü Başarıyla Silindi!');
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }
}
