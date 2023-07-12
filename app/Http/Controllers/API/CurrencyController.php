<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;


class CurrencyController extends Controller
{
    public function show()
    {
        return response()->json([
            "currencylist" => [
                'euro' => 'EUR',
                'dollar' => 'USD',
                'lira' => 'TRY',
            ]
        ]);
    }
}
