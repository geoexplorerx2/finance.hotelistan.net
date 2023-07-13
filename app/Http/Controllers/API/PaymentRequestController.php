<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\PaymentRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\MessageBag;
use Illuminate\Support\Carbon;

class PaymentRequestController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(Request $request, $filter = null)
    {
        /** @var \Illuminate\Database\Eloquent\Builder */
        $query = PaymentRequest::query();
        $query->orderBy('id', 'desc');
        $collect = PaymentRequest::all();
        $result = array();
        $response = array();
        $Temp = array();
        foreach ($collect as $item) {
            if ($item->expiry_date != null) {
                array_push($result, $item);
            }
        }
        if ($filter) {
            $validate = Validator::make([
                "filter" => $filter
            ], [
                "filter" => "in:requested,waiting,completed,later"
            ]);
            if ($validate->fails()) {
                return $validate->errors();
            }
            switch ($filter) {
                case "requested":
                    $query->where('payment_request_status_id', 1);
                    break;
                case "waiting":
                    $query->where('payment_request_status_id', 4);
                    break;
                case "completed":
                    $query->where('payment_request_status_id', 2);
                    break;
                case "later":
                    $query->where('payment_request_status_id', 3);
                    break;
            }
        }
        $paginateData = (json_decode(json_encode($query->paginate(20)), true))['data'];
        if ($request->get("companyid") != null && $request->get("start_date") == null && $request->get("end_date") == null) {
            foreach (PaymentRequest::where('paid_company_id', $request->get("companyid"))->get() as $item) {
                foreach ($paginateData as $subitem) {
                    if ($item->paid_company_id == $subitem['paid_company_id']) {
                        array_push($response, $item);
                    }
                }
            }
            return response()->json([
                "response" => $response,
            ]);
        }
        if ($request->get("companyid") != null && $request->get("start_date") != null && $request->get("end_date") == null) {
            $startDate = Carbon::parse($request->get("start_date"));
            foreach ($result as $item) {
                $date = Carbon::parse($item->expiry_date);
                if (($date->gt($startDate) || ($date->eq($startDate))) && $request->get("companyid") == $item->paid_company_id) {
                    array_push($Temp, $item);
                }
            }
            foreach ($Temp as $item) {
                foreach ($paginateData as $subitem) {
                    if ($item->paid_company_id == $subitem['paid_company_id']) {
                        array_push($response, $item);
                    }
                }
            }
            return response()->json([
                "response" => $response,
            ]);
        }
        if ($request->get("companyid") != null && $request->get("start_date") != null && $request->get("end_date") != null) {
            $startDate = Carbon::parse($request->get("start_date"));
            $endDate = Carbon::parse($request->get("end_date"));
            foreach ($result as $item) {
                $date = Carbon::parse($item->expiry_date);
                if ($date->between($startDate, $endDate) && $request->get("companyid") == $item->paid_company_id) {
                    array_push($Temp, $item);
                }
            }
            foreach ($Temp as $item) {
                foreach ($paginateData as $subitem) {
                    if ($item->paid_company_id == $subitem['paid_company_id']) {
                        array_push($response, $item);
                    }
                }
            }
            return response()->json([
                "response" => $response,
            ]);
        }
        if ($request->get("companyid") == null && $request->get("start_date") != null && $request->get("end_date") != null) {
            $startDate = Carbon::parse($request->get("start_date"));
            $endDate = Carbon::parse($request->get("end_date"));
            foreach ($result as $item) {
                $date = Carbon::parse($item->expiry_date);
                if ($date->between($startDate, $endDate)) {
                    array_push($Temp, $item);
                }
            }
            foreach ($Temp as $item) {
                foreach ($paginateData as $subitem) {
                    if ($item->paid_company_id == $subitem['paid_company_id']) {
                        array_push($response, $item);
                    }
                }
            }
            return response()->json([
                "response" => $response,
            ]);
        }
        if ($request->get("companyid") == null && $request->get("start_date") == null && $request->get("end_date") != null) {
            $startDate = Carbon::parse($request->get("start_date"));
            $endDate = Carbon::parse($request->get("end_date"));
            foreach ($result as $item) {
                $date = Carbon::parse($item->expiry_date);
                if ($date->lt($endDate) || $date->eq($endDate)) {
                    array_push($Temp, $item);
                }
            }
            foreach ($Temp as $item) {
                foreach ($paginateData as $subitem) {
                    if ($item->paid_company_id == $subitem['paid_company_id']) {
                        array_push($response, $item);
                    }
                }
            }
            return response()->json([
                "response" => $response,
            ]);
        }
        if ($request->get("companyid") == null && $request->get("start_date") != null && $request->get("end_date") == null) {
            $startDate = Carbon::parse($request->get("start_date"));
            $endDate = Carbon::parse($request->get("end_date"));
            foreach ($result as $item) {
                $date = Carbon::parse($item->expiry_date);
                if ($date->gt($startDate) || $date->eq($startDate)) {
                    array_push($Temp, $item);
                }
            }
            foreach ($Temp as $item) {
                foreach ($paginateData as $subitem) {
                    if ($item->paid_company_id == $subitem['paid_company_id']) {
                        array_push($response, $item);
                    }
                }
            }
            return response()->json([
                "response" => $response,
            ]);
        }
        if ($request->get("companyid") == null && $request->get("start_date") == null && $request->get("end_date") == null) {
            foreach (PaymentRequest::all() as $item) {
                foreach ($paginateData as $subitem) {
                    if ($item->paid_company_id == $subitem['paid_company_id']) {
                        array_push($response, $item);
                    }
                }
            }
            return response()->json([
                "response" => $response,
            ]);
        }
    }

    private function setRequestValues(PaymentRequest $paymentRequest, Request $request)
    {
        $validate = Validator::make(
            $request->all(),
            [
                'payCompanyId' => 'exists:companies,id',
                'paidCompanyId' => 'different:payCompanyId|exists:companies,id'
            ]
        );
        if ($validate->fails()) {
            return $validate->errors();
        }
        $paymentRequest->expiry_date = $request->input('expiryDate');
        $paymentRequest->payment_amount = $request->input('paymentAmount');
        $paymentRequest->payment_amount_currency = $request->input('paymentCurrency');
        $paymentRequest->pay_company_id = $request->input('payCompanyId');
        $paymentRequest->paid_company_id = $request->input('paidCompanyId');
        $paymentRequest->payment_request_category_id = $request->input('categoryId');
        $paymentRequest->payment_type_id = $request->input('paymentTypeId');
        $paymentRequest->document_no = $request->input('documentNo');
        $paymentRequest->document_date = $request->input('documentDate');
        $paymentRequest->invoice_date = $request->input('invoiceDate');
        $paymentRequest->payment_request_status_id = "1";
        $paymentRequest->note = $request->input('note');
        $paymentRequest->user_id = Auth::user()->id;
        return true;
    }

    public function store(Request $request)
    {
        try {
            $newData = new PaymentRequest();
            $valid = $this->setRequestValues($newData, $request);
            if ($valid instanceof MessageBag) {
                return response()->json([
                    'status' => false,
                    'message' => 'validation error',
                    'errors' =>  $valid
                ], 401);
            }
            if ($newData->save()) {
                return response()->json([
                    "status" => true,
                    "request_id" => $newData->id,
                    "message" => "Ödeme Talebi başarıyla oluşturuldu."
                ]);
            } else {
                return response()->json([
                    "status" => false,
                    "message" => "Ödeme Talebi oluşturulurken bilinmeyen bir hata meydana geldi."
                ], 401);
            }
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function update(Request $request, $id)
    {
        try {
            /** @var PaymentRequest */
            $paymentRequest = PaymentRequest::findOrFail($id);
            $valid = $this->setRequestValues($paymentRequest, $request);
            if ($valid instanceof MessageBag) {
                response()->json([
                    'status' => false,
                    'message' => 'validation error',
                    'errors' =>  $valid
                ], 401);
            }

            if ($paymentRequest->save()) {
                return response()->json([
                    "status" => true,
                    "request_id" => $paymentRequest->id,
                    "message" => "Ödeme Talebi başarıyla güncellendi."
                ]);
            } else {
                return response()->json([
                    "status" => true,
                    "request_id" => $paymentRequest->id,
                    "message" => "Ödeme Talebi güncellenirken bilinmeyen bir hata meydana geldi."
                ]);
            }
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function destroy($id)
    {
        PaymentRequest::find($id)->delete();
        return response()->json([
            "status" => true,
            "message" => "Ödeme Talebi başarıyla silindi."
        ]);
    }
}
