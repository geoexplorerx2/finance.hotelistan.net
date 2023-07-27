<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\PaymentRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\MessageBag;
use App\Models\PaymentRequestStatus;
use App\Models\PaymentRequestCategory;
use App\Models\Companies;
use App\Models\PaymentType;
use App\Models\User;
use Carbon\Carbon;

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
        $result->getCollection()->transform(function ($item) {
            $item['payment_request_status_name'] = PaymentRequestStatus::find((json_decode(json_encode($item), true))["payment_request_status_id"])->name;
            $item['payment_request_category_name'] = PaymentRequestCategory::find((json_decode(json_encode($item), true))["payment_request_category_id"])->name;
            $item['paid_company_name'] = Companies::find((json_decode(json_encode($item), true))["paid_company_id"])->name;
            $item['pay_company_name'] = Companies::find((json_decode(json_encode($item), true))["pay_company_id"])->name;
            $item['payment_type_name'] = PaymentType::find((json_decode(json_encode($item), true))["payment_type_id"])->name;
            $item['user_name'] = User::find((json_decode(json_encode($item), true))["user_id"])->name;
            $item['answered_user_name'] = User::find((json_decode(json_encode($item), true))["answered_user_id"]) != null ? User::find((json_decode(json_encode($item), true))["answered_user_id"])->name : '';
            return $item;
        });
        // return (json_decode(json_encode($result), true))["current_page"];
        $data = collect([
            "current_page" => (json_decode(json_encode($result), true))["current_page"],
            "status" => true,
            'data' => (json_decode(json_encode($result), true))["data"]
        ]);
        return $data;
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
            if (
                PaymentRequest::where('expiry_date', $request->input('expiryDate'))
                ->where('payment_amount', $request->input('paymentAmount'))
                ->where('payment_amount_currency', $request->input('paymentCurrency'))
                ->where('payment_request_status_id', "1")
                ->where('payment_request_category_id', $request->input('categoryId'))
                ->where('pay_company_id', $request->input('payCompanyId'))
                ->where('paid_company_id', $request->input('paidCompanyId'))
                ->where('document_no', $request->input('documentNo'))
                ->where('document_date', $request->input('documentDate'))
                ->where('payment_type_id', $request->input('paymentTypeId'))
                ->where('invoice_date', $request->input('invoiceDate'))
                ->count() == 0
            ) {
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
            } else {
                return response()->json([
                    "status" => false,
                    "message" => "Bu kayıt mevcut, lütfen başka data girin"
                ]);
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

    public function answer(Request $request, $id)
    {
        $validate = Validator::make(
            $request->all(),
            [
                'payment_request_status_id' => 'required|exists:payment_requests_statuses,id',
                'answer_note' => 'required'
            ]
        );
        if ($validate->fails()) {
            return $validate->errors();
        }
        /** @var PaymentRequest */
        $paymentRequest = PaymentRequest::findOrFail($id);
        $user = Auth::user();
        $update = $request->only(['payment_request_status_id', 'answer_note']);
        $update['answered_user_id'] = $user->id;
        $update['post_time'] = Carbon::now()->toDateTimeString();
        if ($paymentRequest->update($update)) {
            return response()->json([
                "status" => true,
                "message" => "Ödeme Talebi başarıyla cevaplandı."
            ]);
        } else {
            return response()->json([
                "status" => true,
                "message" => "Ödeme Talebi başarıyla cevaplanırken bir hata meydana geldi."
            ], 500);
        }
    }
    public function edit(Request $request, $id)
    {
        if (PaymentRequest::where('id', $id)->count() == 0) {
            return response()->json([
                "status" => false,
                "message" => "Not Found"
            ]);
        } else {
            // find me
            $data = PaymentRequest::where('id', $id)->get();
            $data->map(function ($item) {
                $item["payment_request_status_name"] = (PaymentRequestStatus::find($item->payment_request_status_id))->name ?? null;
                $item["payment_request_category_name"] = (PaymentRequestCategory::find($item->payment_request_category_id))->name ?? null;
                $item['paid_company_name'] = Companies::find((json_decode(json_encode($item), true))["paid_company_id"])->name ?? null;
                $item['pay_company_name'] = Companies::find((json_decode(json_encode($item), true))["pay_company_id"])->name ?? null;
                $item['payment_type_name'] = PaymentType::find((json_decode(json_encode($item), true))["payment_type_id"])->name ?? null;
                $item['user_name'] = User::find((json_decode(json_encode($item), true))["user_id"])->name ?? null;
                $item['answered_user_name'] = User::find((json_decode(json_encode($item), true))["answered_user_id"]) != null ? User::find((json_decode(json_encode($item), true))["answered_user_id"])->name : '';
                return $item;
            });
            return collect([
                "status" => true,
                "data" => $data,

            ]);
        }
    }
}
