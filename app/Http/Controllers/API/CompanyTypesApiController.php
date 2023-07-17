<?php

namespace App\Http\Controllers\API;

use App\Models\CompanyType;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

class CompanyTypesApiController extends Controller
{
    public function index()
    {
        try {
            $company_types = CompanyType::all();
            $data = array('company_types' => $company_types);
            return response()->json([
                'status' => true,
                'company_types' => (json_decode(json_encode($data), true))["company_types"],
            ]);
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function store(Request $request)
    {
        try {
            $newData = new CompanyType();
            $newData->name = $request->input('name');
            $newData->note = $request->input('note');
            $newData->user_id = auth()->user()->id;
            $result = $newData->save();

            if ($result) {
                return response()->json([
                    'status' => true,
                    'data' => 'Firma Türü Başarıyla Kaydedidi!',
                ]);
            } else {
                return back()->withInput($request->input());
            }
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function edit($id)
    {
        try {
            $company_type = CompanyType::where('id', '=', $id)->first();

            return response()->json([
                'status' => true,
                'data' => $company_type,
            ]);
        } catch (\Throwable $th) {
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
                return response()->json([
                    'status' => true,
                    'data' => 'Firma Türü Başarıyla Güncellendi!',
                ]);
            } else {
                return response()->json([
                    'status' => false,
                    'data' => 'Operation Failed',
                ]);
            }
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function destroy($id)
    {

        if (CompanyType::where('id', $id)->count() > 0) {
            if (CompanyType::find($id)->delete()) {
                return response()->json([
                    'status' => true,
                    'message' => 'record deleted successfully!',
                ]);
            } else {
                return response()->json([
                    'status' => false,
                    'message' => 'Operation Failes!',
                ]);
            }
        } else {
            return response()->json([
                'status' => false,
                'message' => 'There is no record for this ID!',
            ]);
        }
    }
}
