<?php

namespace App\Http\Controllers;

use App\Models\Cheques;
use App\Models\Companies;
use App\Models\ChequeStatus;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ChequeController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        try {
            $cheques = Cheques::all();
            $companies= Companies::all();
            $chequestatuses= ChequeStatus::all();
            $data = array('cheques' => $cheques,'companies' => $companies,'chequestatuses' => $chequestatuses);
            return view('admin.cheques.cheque_list')->with($data);
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }

    public function store(Request $request){
        try {
            $newData = new Cheques();
            $newData->bank_name = $request->input('bankName');
            $newData->expiry_date = $request->input('expiryDate');
            $newData->issue_date = $request->input('issueDate');
            $newData->cheque_no = $request->input('chequeNo');
            $newData->amount = $request->input('amount');
            $newData->currency = $request->input('chequeCurrency');
            $newData->cheques_statuses_id = $request->input('cheques_statuses_id');
            $newData->company_id = $request->input('company_id');
            $newData->note = $request->input('note');
            $newData->user_id = auth()->user()->id;
            $result = $newData->save();

            if ($result) {
                return redirect()->route('cheques.index')->with('message', 'Çek Başarıyla Kaydedildi!');
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
            $cheque = Cheques::where('id','=',$id)->first();
            $companies = Companies::all();
            $chequestatuses= ChequeStatus::all();
            return view('admin.cheques.edit_cheque', ['cheque' => $cheque,'companies' => $companies,'chequestatuses' => $chequestatuses]);
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
            $temp['cheque_no'] = $request->input('chequeNo');
            $temp['amount'] = $request->input('amount');
            $temp['currency'] = $request->input('chequeCurrency');
            $temp['cheques_statuses_id'] = $request->input('cheques_statuses_id');
            $temp['company_id'] = $request->input('company_id');
            $temp['note'] = $request->input('note');


            if (Cheques::where('id', '=', $id)->update($temp)) {
                return redirect()->route('cheques.index')->with('message', 'Çek Başarıyla Güncellendi!');
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
            Cheques::find($id)->delete();
            return redirect()->route('cheques.index')->with('message', 'Çek Başarıyla Silindi!');
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }


    public function chequecalendar()
    {
        try {
            $user = auth()->user();

            if($user->hasRole('Super Admin')){
                $calendarCount = Cheques::select('cheques.expiry_date as date', 'cheques.currency as currency', 'companies.id as cId', 'companies.name', 'cheques.amount', 'cheques.currency', DB::raw('count(name) as countR'), DB::raw('SUM(amount) as amount'))
                ->leftJoin('companies', 'cheques.company_id', '=', 'companies.id')
                ->whereNotNull('cheques.company_id')
                ->whereIn('cheques.cheques_statuses_id', array(1, 2))
                // ->whereMonth('treatment_plans.created_date', Carbon::now()->month)
                ->groupBy(['date', 'currency', 'cId']);
            }
            if($user->hasRole('Ceo')){
                $calendarCount = Cheques::select('cheques.expiry_date as date', 'cheques.currency as currency', 'companies.id as cId', 'companies.name', 'cheques.amount', 'cheques.currency', DB::raw('count(name) as countR'), DB::raw('SUM(amount) as amount'))
                ->leftJoin('companies', 'cheques.company_id', '=', 'companies.id')
                ->whereNotNull('cheques.company_id')
                ->whereIn('cheques.cheques_statuses_id', array(1, 2))
                // ->whereMonth('treatment_plans.created_date', Carbon::now()->month)
                ->groupBy(['date', 'currency', 'cId']);
            }
            if($user->hasRole('Finance Admin')) {
                $calendarCount = Cheques::select('cheques.expiry_date as date', 'cheques.currency as currency', 'companies.id as cId', 'companies.name', 'cheques.amount', 'cheques.currency', DB::raw('count(name) as countR'), DB::raw('SUM(amount) as amount'))
                ->leftJoin('companies', 'cheques.company_id', '=', 'companies.id')
                ->whereNotNull('cheques.company_id')
                ->whereIn('cheques.cheques_statuses_id', array(1, 2))
                ->where('cheques.user_id', '=', $user->id)
                // ->whereMonth('treatment_plans.created_date', Carbon::now()->month)
                ->groupBy(['date', 'currency', 'cId']);
            }

            $listCountByMonth = DB::select($calendarCount->groupBy(DB::raw('cId'))->toSql(),
            $calendarCount->getBindings());

            $data = array('listCountByMonth' => $listCountByMonth);
            return view('cheque_calendar')->with($data);
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }

    public function allChequeByDate(Request $request)
    {
        try {
            $user = auth()->user();
            $searchDate = $request->input('s');

            if($user->hasRole('Super Admin')){
                $cheques = Cheques::select('cheques.expiry_date as date', 'cheques.id as pId', 'cheques.*', 'companies.name as cName', 'cheques_statuses.*')
                ->leftJoin('cheques_statuses', 'cheques.cheques_statuses_id', '=', 'cheques_statuses.id')
                ->leftJoin('companies', 'cheques.company_id', '=', 'companies.id')
                ->whereNotNull('cheques.company_id')
                ->whereDate('cheques.expiry_date', '=', $searchDate)
                ->orderBy('expiry_Date', 'DESC');
            }

            else {
                $cheques = Cheques::select('cheques.expiry_date as date', 'cheques.id as pId', 'cheques.*', 'companies.name as cName', 'cheques_statuses.*')
                ->leftJoin('cheques_statuses', 'cheques.cheques_statuses_id', '=', 'cheques_statuses.id')
                ->leftJoin('companies', 'cheques.company_id', '=', 'companies.id')
                ->whereNotNull('cheques.company_id')
                ->where('cheques.user_id', '=', $user->id)
                ->whereDate('cheques.expiry_date', '=', $searchDate)
                ->orderBy('expiry_Date', 'DESC');
            }

            $listAllByDates = DB::select($cheques->orderByRaw('DATE_FORMAT(date, "%y-%m-%d")')->toSql(), $cheques->getBindings());
            $datePrmtr = date('d.m.Y', strtotime($searchDate));
            $companies= Companies::all();
            $chequestatuses= ChequeStatus::all();

            $data = array('listAllByDates' => $listAllByDates,'chequestatuses' => $chequestatuses, 'companies' => $companies, 'tableTitle' => $datePrmtr . 'Tarihine Ait Çekleri');
            return view('admin.cheques.all_cheques')->with($data);
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }
}
