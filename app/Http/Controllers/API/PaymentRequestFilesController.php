<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\PaymentRequestFile;
use Illuminate\Http\Request;
use App\Models\User;

class PaymentRequestFilesController extends Controller
{

    public function index(Request $request)
    {
        $User = PaymentRequestFile::all();
        $User->map(function ($item) {
            $User = User::find(intval($item->user_id));
            $item->user_name = $User->name ?? null;
            $item->path = 'https://'.$_SERVER['HTTP_HOST'].'/files/'.$item->path ?? null;
            return $item;
        });

        return response()->json(
            [
                "status" => true,
                'files_list' => $User,
            ]
        );
    }

    public function detail($id){
        $User = PaymentRequestFile::where('payment_request_id','=',$id)->get();
        $User->map(function ($item) {
            $User = User::find(intval($item->user_id));
            $item->user_name = $User->name ?? null;
            $item->path = 'https://'.$_SERVER['HTTP_HOST'].'/files/'.$item->path ?? null;
            return $item;
        });

        return response()->json(
            [
                "status" => true,
                'file_detail' => $User,
            ]
        );
    }

    public function store(Request $request)
{
    $files = $request->file('files');

    $successCount = 0;
    $errorCount = 0;

    foreach ($files as $file) {
        if ($file->isValid()) {
            $fileName = $file->hashName();
            $file->move(public_path('files'), $fileName);

            $imageUpload = new PaymentRequestFile();
            $imageUpload->path = $fileName;
            $imageUpload->payment_request_id = $request->input('paymentRequestId');
            $imageUpload->save();

            $successCount++;
        } else {
            $errorCount++;
        }
    }

    return response()->json([
        "success" => true,
        "message" => "Dosyalar başarıyla kaydedildi.",
    ]);
}


    public function destroy($id)
    {

        $fileUpload = PaymentRequestFile::find($id);

        $fileUpload->delete();

        return response()->json(
            [
                'success' => true,
                'message' => "Dosya silindi"
            ]
        );
    }
}
