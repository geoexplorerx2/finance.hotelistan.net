<?php

namespace App\Http\Controllers;

use App\Models\PersonnelPhoto;
use App\Models\Service;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PersonnelCardPhotosController extends Controller
{
    public function index()
    {
        $files = PersonnelPhoto::all();

        return view('files.index', compact('files'))
            ->with('i', (request()->input('page', 1) - 1) * 5);
    }

    public function create()
    {
        return view('files.create');
    }

    public function store(Request $request)
    {
        $user = auth()->user();

        $image = $request->file('file');
        $FileName = $image->hashName();
        $image->move(public_path('photos'), $FileName);

        $imageUpload = new PersonnelPhoto();
        $imageUpload->name = $FileName;
        $imageUpload->path = $FileName;
        $imageUpload->user_id = $user->id;
        $imageUpload->personnel_card_id = $request->input('personnelCardId');
        $imageUpload->save();
        return response()->json(['success' => $FileName]);
    }
    public function newstore(Request $request)
    {
        $user = auth()->user();

        $image = $request->file('file');
        $FileName = $image->hashName();
        $image->move(public_path('photos'), $FileName);

        $imageUpload = new PersonnelPhoto();
        $imageUpload->name = $FileName;
        $imageUpload->path = $FileName;
        $imageUpload->user_id = $user->id;
        $imageUpload->personnel_card_id = $request->input('personnelCardId');
        $imageUpload->save();
        $id=$request->input('personnelCardId');
        return redirect('/humanresource/personnelcard/edit/'.$id)->with('message', 'Fotoğraf Başarıyla Güncellendi!');
    }

    public function show(PersonnelPhoto $fileUpload)
    {
        //
    }

    public function edit(PersonnelPhoto $fileUpload)
    {
        //
    }

    public function update(Request $request)
    {
        try {
            $id=$request->input('id');
            unlink(public_path('/photos/'.$request->input('name')));
            $image = $request->file('file');
            $FileName = $image->hashName();
            $image->move(public_path('photos'), $FileName);
            $temp['name'] = $FileName;
            $temp['path'] = $FileName;

            if (PersonnelPhoto::where('personnel_card_id', '=', $id)->update($temp)) {
                return redirect('/humanresource/personnelcard/edit/'.$id)->with('message', 'Fotoğraf Başarıyla Güncellendi!');
            }
            else {
                return back()->withInput($request->input());
            }
        }
        catch (\Throwable $th) {
            throw $th;
        }
    }
    public function destroy($id)
    {

        $fileUpload = PersonnelPhoto::find($id);

        $fileUpload->delete();

        return redirect()->back()
            ->with('success', 'File deleted successfully');
    }
}

