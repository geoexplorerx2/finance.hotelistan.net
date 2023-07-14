<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\CompaniesController;
use App\Http\Controllers\API\paymenttypesapiController;
use App\Http\Controllers\API\paymentrequestcategoryapiController;
use App\Http\Controllers\API\ChequeStatusApiController;
use App\Http\Controllers\API\ChequeApiController;
use App\Http\Controllers\API\CompanyTypesApi;
use App\Http\Controllers\API\creditcardapiController;
use App\Http\Controllers\API\CurrencyController;
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
Route::POST('/forget-password', 'App\Http\Controllers\Auth\ForgotPasswordController@forgetPassword');
Route::POST('/reset-password', 'App\Http\Controllers\Auth\ResetPasswordController@passwordReset');

Route::group(['middleware' => ['auth:sanctum']], function () {
    Route::GET('/logout', 'App\Http\Controllers\API\AuthController@logout');
    //Profile Update
    Route::POST('/profile', 'App\Http\Controllers\API\AuthController@profile');

    Route::get('/user', function (Request $request) {
        return $request->user();
    });
    //Companies
    Route::GET('/companies/show', [CompaniesController::class, 'show']);
    Route::POST('/companies/store', [CompaniesController::class, 'store']);
    Route::POST('/companies/update/{id}', [CompaniesController::class, 'update']);
    Route::GET('/companies/destroy/{id}', [CompaniesController::class, 'destroy']);
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
    Route::GET('/chequestatus', [ChequeStatusApiController::class, 'index']);
    Route::GET('/chequestatus/edit/{id}', [ChequeStatusApiController::class, 'edit']);
    Route::GET('/chequestatus/destroy/{id}', [ChequeStatusApiController::class, 'destroy']);
    Route::POST('/chequestatus/store', [ChequeStatusApiController::class, 'store']);
    Route::POST('/chequestatus/update/{id}', [ChequeStatusApiController::class, 'update']);
    //Cheque
    Route::GET('/cheques', [ChequeApiController::class, 'index']);
    Route::GET('/cheques/edit/{id}', [ChequeApiController::class, 'edit']);
    Route::GET('/cheques/destroy/{id}', [ChequeApiController::class, 'destroy']);
    Route::POST('/cheques/update/{id}', [ChequeApiController::class, 'update']);
    Route::POST('/cheques/store', [ChequeApiController::class, 'store']);
    //Departments
    Route::GET('/companytypes', [CompanyTypesApi::class, 'index']);
    Route::GET('/companytypes/destroy/{id}', [CompanyTypesApi::class, 'destroy']);
    Route::GET('/companytypes/edit/{id}', [CompanyTypesApi::class, 'edit']);
    Route::POST('/companytypes/store', [CompanyTypesApi::class, 'store']);
    Route::POST('/companytypes/update/{id}', [CompanyTypesApi::class, 'update']);
    //Credit Cards
    Route::GET('/creditcards', [creditcardapiController::class, 'index']);
    Route::GET('/creditcards/edit/{id}', [creditcardapiController::class, 'edit']);
    Route::GET('/creditcards/destroy/{id}', [creditcardapiController::class, 'destroy']);
    Route::POST('/creditcards/store', [creditcardapiController::class, 'store']);
    Route::POST('/creditcards/update/{id}', [creditcardapiController::class, 'update']);

    //Dashboard
    Route::GET('/dashboard/counts', 'App\Http\Controllers\API\DashboardController@counts');
    Route::GET('/dashboard/users-report', 'App\Http\Controllers\API\DashboardController@usersReport');
    Route::GET('/dashboard/companies-report', 'App\Http\Controllers\API\DashboardController@companiesReport');

    // Payment Request
    Route::GET('/payment-request/{filter?}', 'App\Http\Controllers\API\PaymentRequestController@index');
    Route::POST('/payment-request/store', 'App\Http\Controllers\API\PaymentRequestController@store');
    Route::PUT('/payment-request/update/{id}', 'App\Http\Controllers\API\PaymentRequestController@update');
    Route::GET('/payment-request/delete/{id}', 'App\Http\Controllers\API\PaymentRequestController@destroy');

    // Payment Request Files
    Route::GET('/payment-request/files/show', 'App\Http\Controllers\API\PaymentRequestFilesController@index');
    Route::POST('/payment-request/files/store', 'App\Http\Controllers\API\PaymentRequestFilesController@store');
    Route::GET('/payment-request/files/delete/{id}', 'App\Http\Controllers\API\PaymentRequestFilesController@destroy');

    // Currency List
    Route::get('/currencylist', [CurrencyController::class, 'show']);
});
Route::GET('/alert', function () {
    return response()->json([
        'code' => 402,
        'data' => 'unauthorized',
    ]);
});
