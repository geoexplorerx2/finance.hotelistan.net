<?php

namespace App\Http\Controllers;

use App\Models\PersonnelCard;
use App\Models\PersonnelFile;
use App\Models\PersonnelPhoto;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PersonnelCardController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        try {
            $personnel_cards = PersonnelCard::with('photos')->get();
            $personnel_photos = PersonnelPhoto::all();
            $data = array('personnel_cards' => $personnel_cards,'personnel_photos' => $personnel_photos);
            return view('admin.personnelcard.personnel_card_list')->with($data);
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }

    public function store(Request $request)
    {
        try {
            $user = auth()->user();
            $newData = new PersonnelCard();
            $newData->name_surname = $request->input('nameSurname');
            $newData->birth_date = $request->input('birthDate');
            $newData->phone = $request->input('phone');
            $newData->email = $request->input('email');
            $newData->department = $request->input('department');
            $newData->title = $request->input('title');
            $newData->start_date = $request->input('start_date');
            $newData->education = $request->input('education');
            $newData->bank_name = $request->input('bankName');
            $newData->bank_iban = $request->input('bankIban');
            $newData->salary = $request->input('salary');
            $newData->note = $request->input('note');
            $newData->user_id = $user->id;

            if ($newData->save()) {
                return response($newData->id, 200);
            }
            else {
                return response(false, 500);
            }
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }

    public function edit($id)
    {
        try {
            $personnel_card = PersonnelCard::where('id','=',$id)->first();
            $personnel_photo = PersonnelPhoto::where('personnel_card_id','=',$id)->first();

            return view('admin.personnelcard.edit_personnel_card', ['personnel_card' => $personnel_card,'personnel_photo' => $personnel_photo]);

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
            $temp['birth_date'] = $request->input('birthDate');
            $temp['phone'] = $request->input('phone');
            $temp['email'] = $request->input('email');
            $temp['department'] = $request->input('department');
            $temp['title'] = $request->input('title');
            $temp['start_date'] = $request->input('start_date');
            $temp['education'] = $request->input('education');
            $temp['bank_name'] = $request->input('bankName');
            $temp['bank_iban'] = $request->input('bankIban');
            $temp['salary'] = $request->input('salary');
            $temp['note'] = $request->input('note');

            if (PersonnelCard::where('id', '=', $id)->update($temp)) {
                return redirect()->route('personnelcard.index')->with('message', 'Personel Başarıyla Güncellendi!');
            }
            else {
                return back()->withInput($request->input());
            }
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }
    public function create()
    {
        try {
            return view('admin.personnelcard.create_personnel_card');
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }
    public function destroy($id){
        try {
            $name = PersonnelPhoto::where('personnel_card_id', '=', $id)->first();
            unlink(public_path('/photos/'.$name->name));

            PersonnelCard::find($id)->delete();
            PersonnelPhoto::where('personnel_card_id', '=', $id)->delete();
            return redirect()->route('personnelcard.index')->with('message', 'Personel Başarıyla Silindi!');
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }
}
