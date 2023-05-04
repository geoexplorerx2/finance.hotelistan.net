<?php

namespace App\Http\Controllers;

use App\Models\PaymentRequestFile;
use App\Models\Service;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PaymentRequestFilesController extends Controller
{
    public function index()
    {
        $files = PaymentRequestFile::all();

        return view('files.index', compact('files'))
            ->with('i', (request()->input('page', 1) - 1) * 5);
    }

    public function create()
    {
        return view('files.create');
    }

    public function store(Request $request)
    {
        $image = $request->file('file');
        $FileName = $image->hashName();
        $image->move(public_path('files'), $FileName);

        $imageUpload = new PaymentRequestFile();
        $imageUpload->path = $FileName;
        $imageUpload->payment_request_id = $request->input('paymentRequestId');
        $imageUpload->save();
        return response()->json(['success' => $FileName]);
    }

    public function show(PaymentRequestFile $fileUpload)
    {
        //
    }

    public function edit(PaymentRequestFile $fileUpload)
    {
        //
    }

    public function update(Request $request, PaymentRequestFile $fileUpload)
    {
        //
    }

    public function destroy($id)
    {

        $fileUpload = PaymentRequestFile::find($id);

        $fileUpload->delete();

        return redirect()->back()
            ->with('success', 'File deleted successfully');
    }
}

