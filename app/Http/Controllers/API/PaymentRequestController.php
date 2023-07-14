<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\PaymentRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\MessageBag;
use App\Models\PaymentRequestStatus;
use App\Models\PaymentRequestCategory;
use App\Models\Companies;
use App\Models\PaymentType;
use App\Models\User;
use Illuminate\Support\Carbon;
use Illuminate\Validation\Rules\Unique;

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
        $paid_company_id = $request->get("companyid");
        $start_date = $request->get("start_date");
        $end_date = $request->get("end_date");
        $result = null;
        $temp = array();

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
        if (!empty($paid_company_id) && !empty($start_date) && !empty($end_date)) {
            $result = PaymentRequest::whereBetween('expiry_date', [$start_date, $end_date])->where('paid_company_id', $paid_company_id)->paginate(20);
        }
        if (!empty($paid_company_id) && !empty($start_date) && empty($end_date)) {
            $result = PaymentRequest::where('expiry_date', '>=', $start_date)->where('paid_company_id', $paid_company_id)->paginate(20);
        }
        if (!empty($paid_company_id) && empty($start_date) && !empty($end_date)) {
            $result = PaymentRequest::where('expiry_date', '<=', $end_date)->where('paid_company_id', $paid_company_id)->paginate(20);
        }
        if (!empty($paid_company_id) && empty($start_date) && empty($end_date)) {
            $result = PaymentRequest::where('paid_company_id', $paid_company_id)->paginate(20);
        }
        if (empty($paid_company_id) && !empty($start_date) && !empty($end_date)) {
            $result = PaymentRequest::whereBetween('expiry_date', [$start_date, $end_date])->paginate(20);
        }
        if (empty($paid_company_id) && empty($start_date) && !empty($end_date)) {
            $result = PaymentRequest::where('expiry_date', '<=', $end_date)->paginate(20);
        }
        if (empty($paid_company_id) && !empty($start_date) && empty($end_date)) {
            $result = PaymentRequest::where('expiry_date', '>=', $start_date)->paginate(20);
        }
        if (empty($paid_company_id) && empty($start_date) && empty($end_date)) {
            $result = PaymentRequest::paginate(20);
        }
        foreach ((json_decode(json_encode($result), true))['data'] as $item) {
            // PaymentRequestStatus::find((json_decode(json_encode($item), true))["payment_request_status_id"])->name
            // PaymentRequestCategory::find((json_decode(json_encode($item), true))["payment_request_category_id"])->name
            // Companies::find((json_decode(json_encode($item), true))["paid_company_id"])->name
            // PaymentType::find((json_decode(json_encode($item), true))["payment_type_id"])->name
            // User::find((json_decode(json_encode($item), true))["user_id"])->name
            // array_push($temp, );
        }
        return response()->json($result);
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
