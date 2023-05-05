<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\companiesController;
use App\Http\Controllers\API\AuthController;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::POST('/login', [AuthController::class, 'login']);
Route::POST('/companies/store', [companiesController::class, 'store']);
Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
