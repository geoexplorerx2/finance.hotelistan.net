<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;


class CurrencyController extends Controller
{
    public function show()
    {
        $data = [
            'currency_list' => [
                [
                    'name' => 'Euro',
                    'value' => 'EUR',
                ],
                [
                    'name' => 'Dollar',
                    'value' => 'USD',
                ],
                [
                    'name' => 'Pound',
                    'value' => 'GBP',
                ],
                [
                    'name' => 'Lira',
                    'value' => 'TRY',
                ],
            ],
        ];

        return response()->json($data);
    }
}