<?php
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\PaymentRequestFile;
use Illuminate\Http\Request;

class PaymentRequestFilesController extends Controller{

    public function index()
    {
        return response()->json(
            PaymentRequestFile::paginate(20)
        );
    }

    public function store(Request $request)
    {
        /** @var \Illuminate\Http\UploadedFile */
        $image = $request->file('file');
        $fileName = $image->hashName();
        $image->move(public_path('files'), $fileName);

        $imageUpload = new PaymentRequestFile();
        $imageUpload->path = $fileName;
        $imageUpload->payment_request_id = $request->input('paymentRequestId');
        $imageUpload->save();
        return response()->json([
            "success" => true,
            "message" => "Dosya başarıyla kaydedildi."
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