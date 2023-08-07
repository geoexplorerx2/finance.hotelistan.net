<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;


class CurrencyController extends Controller
{
    public function show()
    {

        return collect(["status" => true, 'currency_list' => [
            [
                'name' => 'Euro',
                'value' => 'EUR',
                'Symbol' => '€',
            ],
            [
                'name' => 'Dollar',
                'value' => 'USD',
                'Symbol' => '$',
            ],
            [
                'name' => 'Pound',
                'value' => 'GBP',
                'Symbol' => '£',
            ],
            [
                'name' => 'Lira',
                'value' => 'TRY',
                'Symbol' => '₺',
            ],
        ]]);
    }
}
