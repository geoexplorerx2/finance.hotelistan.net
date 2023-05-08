<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\companiesController;
use App\Http\Controllers\API\paymenttypesapiController;
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
//Companies
Route::GET('/companies/show', [companiesController::class, 'show']);
Route::POST('/companies/store', [companiesController::class, 'store']);
Route::POST('/companies/update', [companiesController::class, 'update']);
Route::GET('/companies/destroy/{id}', [companiesController::class, 'destroy']);
//Payment Types
Route::GET('/paymenttypes', [paymenttypesapiController::class, 'index']);
Route::GET('/paymenttypes/edit/{id}', [paymenttypesapiController::class, 'edit']);
Route::GET('/paymenttypes/destroy/{id}', [paymenttypesapiController::class, 'destroy']);
Route::POST('/paymenttypes/store', [paymenttypesapiController::class, 'store']);
Route::POST('/paymenttypes/update/{id}', 'PaymentTypeController@update');
Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
