<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\companiesController;
use App\Http\Controllers\API\paymenttypesapiController;
use App\Http\Controllers\API\paymentrequestcategoryapiController;
use App\Http\Controllers\API\chequestatusapiController;
use App\Http\Controllers\API\ChequeapiController;
use App\Http\Controllers\API\companytypesapi;
use App\Http\Controllers\API\creditcardapiController;
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
Route::POST('/paymenttypes/update/{id}', [paymenttypesapiController::class, 'update']);
//Payment Request Category
Route::GET('/paymentrequestcategory', [paymentrequestcategoryapiController::class, 'index']);
Route::GET('/paymentrequestcategory/edit/{id}', [paymentrequestcategoryapiController::class, 'edit']);
Route::GET('/paymentrequestcategory/destroy/{id}', [paymentrequestcategoryapiController::class, 'destroy']);
Route::POST('/paymentrequestcategory/store', [paymentrequestcategoryapiController::class, 'store']);
Route::POST('/paymentrequestcategory/update/{id}', [paymentrequestcategoryapiController::class, 'update']);
//Cheque Status
Route::GET('/chequestatus', [chequestatusapiController::class, 'index']);
Route::GET('/chequestatus/edit/{id}', [chequestatusapiController::class, 'edit']);
Route::GET('/chequestatus/destroy/{id}', [chequestatusapiController::class, 'destroy']);
Route::POST('/chequestatus/store', [chequestatusapiController::class, 'store']);
Route::POST('/chequestatus/update/{id}', [chequestatusapiController::class, 'update']);
//Cheque
Route::GET('/cheques', [ChequeapiController::class, 'index']);
Route::GET('/cheques/edit/{id}', [ChequeapiController::class, 'edit']);
Route::GET('/cheques/destroy/{id}', [ChequeapiController::class, 'destroy']);
Route::POST('/cheques/update/{id}', [ChequeapiController::class, 'update']);
Route::POST('/cheques/store', [ChequeapiController::class, 'store']);
//Departments
Route::GET('/companytypes', [companytypesapi::class, 'index']);
Route::GET('/companytypes/destroy/{id}', [companytypesapi::class, 'destroy']);
Route::GET('/companytypes/edit/{id}', [companytypesapi::class, 'edit']);
Route::POST('/companytypes/store', [companytypesapi::class, 'store']);
Route::POST('/companytypes/update/{id}', [companytypesapi::class, 'update']);
//Credit Cards
Route::GET('/creditcards', [creditcardapiController::class, 'index']);
Route::GET('/creditcards/edit/{id}', [creditcardapiController::class, 'edit']);
Route::GET('/creditcards/destroy/{id}', [creditcardapiController::class, 'destroy']);
Route::POST('/creditcards/store', [creditcardapiController::class, 'store']);
Route::POST('/creditcards/update/{id}', [creditcardapiController::class, 'update']);
// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });
Route::group(['middleware' => ['auth:sanctum']], function () {
    Route::GET('/getToken', function () {
        dd('welcome');
    });
});
