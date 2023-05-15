<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Companies;
use App\Models\PaymentRequest;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class DashboardController extends Controller
{

    private function validateRequest(Request $request)
    {
        $validate = Validator::make(
            $request->all(),
            [
                'type' => 'in:daily,monthly,weekly,yearly'
            ]
        );
        if ($validate->fails()) {
            return $validate->errors();
        }
        return true;
    }

    private function filterQuery(Request $request, Builder $query, $filterTable = "payment_requests")
    {
        $type = $request->input("type") ?: "daily";
        switch ($type) {
            case 'daily':
                $query->where("$filterTable.created_at", ">=", date("Y-m-d 00:00:00"))
                    ->where("$filterTable.created_at", "<=", date("Y-m-d 23:59:59"));
                break;
            case 'weekly':
                $query->where("$filterTable.created_at", ">=", date("Y-m-d 00:00:00", strtotime("last monday")))
                    ->where("$filterTable.created_at", "<=", date("Y-m-d 23:59:59", strtotime("next sunday")));
                break;
            case 'monthly':
                $query->where("$filterTable.created_at", ">=", date("Y-m-d 00:00:00", strtotime("first day of this month")))
                    ->where("$filterTable.created_at", "<=", date("Y-m-d 23:59:59", strtotime("last day of this month")));
                break;
            case 'yearly':
                $query->where("$filterTable.created_at", ">=", date("Y-m-d 00:00:00", strtotime("first day of January this year")))
                    ->where("$filterTable.created_at", "<=", date("Y-m-d 23:59:59", strtotime("last day of December this year")));
        }
    }

    public function counts(Request $request)
    {
        if (($validate = $this->validateRequest($request)) !== true) {
            return $validate;
        }
        /** @var Builder */
        $paymentRequestQuery = PaymentRequest::query();
        $this->filterQuery($request, $paymentRequestQuery);
        /** @var Builder */
        $companyRequestQuery = Companies::query();
        $this->filterQuery($request, $companyRequestQuery, "companies");
        return response()->json([
            "payment_request_count" => $paymentRequestQuery->count(),
            "company_count" => $companyRequestQuery->count(),
        ]);
    }

    public function usersReport(Request $request)
    {
        try {
            if (($validate = $this->validateRequest($request)) !== true) {
                return $validate;
            }
            /** @var Builder */
            $query = PaymentRequest::select('users.name', DB::raw('user_id, count(*) as count'))
                ->leftJoin('users', 'payment_requests.user_id', '=', 'users.id')
                ->groupBy('user_id');
            $this->filterQuery($request, $query);
            $data = $query->get();

            return response()->json($data);
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function companiesReport(Request $request)
    {
        try {
            if (($validate = $this->validateRequest($request)) !== true) {
                return $validate;
            }
            $query = PaymentRequest::select('companies.name', DB::raw('paid_company_id, count(*) as count'))
                ->leftJoin('companies', 'payment_requests.paid_company_id', '=', 'companies.id')
                ->groupBy('paid_company_id');
            $this->filterQuery($request, $query);
            $data = $query->get();
            return response()->json($data);
        } catch (\Throwable $th) {
            throw $th;
        }
    }
}
