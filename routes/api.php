<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\CompaniesController;
use App\Http\Controllers\API\PaymentTypesApiController;
use App\Http\Controllers\API\PaymentRequestCategoryApiController;
use App\Http\Controllers\API\ChequeStatusApiController;
use App\Http\Controllers\API\ChequeApiController;
use App\Http\Controllers\API\CompanyTypesApiController;
use App\Http\Controllers\API\CreditCardApiController;
use App\Http\Controllers\API\CurrencyController;
use App\Http\Controllers\API\PaymentRequestStatusController;
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
Route::POST('/reset-password/verify-token', 'App\Http\Controllers\Auth\ResetPasswordController@verifyToken');

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
    Route::GET('/paymenttypes', [PaymentTypesApiController::class, 'index']);
    Route::GET('/paymenttypes/edit/{id}', [PaymentTypesApiController::class, 'edit']);
    Route::GET('/paymenttypes/destroy/{id}', [PaymentTypesApiController::class, 'destroy']);
    Route::POST('/paymenttypes/store', [PaymentTypesApiController::class, 'store']);
    Route::POST('/paymenttypes/update/{id}', [PaymentTypesApiController::class, 'update']);
    //Payment Request Category
    Route::GET('/paymentrequestcategory', [PaymentRequestCategoryApiController::class, 'index']);
    Route::GET('/paymentrequestcategory/edit/{id}', [PaymentRequestCategoryApiController::class, 'edit']);
    Route::GET('/paymentrequestcategory/destroy/{id}', [PaymentRequestCategoryApiController::class, 'destroy']);
    Route::POST('/paymentrequestcategory/store', [PaymentRequestCategoryApiController::class, 'store']);
    Route::POST('/paymentrequestcategory/update/{id}', [PaymentRequestCategoryApiController::class, 'update']);
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
    Route::GET('/companytypes', [CompanyTypesApiController::class, 'index']);
    Route::GET('/companytypes/destroy/{id}', [CompanyTypesApiController::class, 'destroy']);
    Route::GET('/companytypes/edit/{id}', [CompanyTypesApiController::class, 'edit']);
    Route::POST('/companytypes/store', [CompanyTypesApiController::class, 'store']);
    Route::POST('/companytypes/update/{id}', [CompanyTypesApiController::class, 'update']);
    //Credit Cards
    Route::GET('/creditcards', [CreditCardApiController::class, 'index']);
    Route::GET('/creditcards/edit/{id}', [CreditCardApiController::class, 'edit']);
    Route::GET('/creditcards/destroy/{id}', [CreditCardApiController::class, 'destroy']);
    Route::POST('/creditcards/store', [CreditCardApiController::class, 'store']);
    Route::POST('/creditcards/update/{id}', [CreditCardApiController::class, 'update']);

    //Dashboard
    Route::GET('/dashboard/counts', 'App\Http\Controllers\API\DashboardController@counts');
    Route::GET('/dashboard/users-report', 'App\Http\Controllers\API\DashboardController@usersReport');
    Route::GET('/dashboard/companies-report', 'App\Http\Controllers\API\DashboardController@companiesReport');

    // Payment Request
    Route::GET('/payment-request/{filter?}', 'App\Http\Controllers\API\PaymentRequestController@index');
    Route::POST('/payment-request/store', 'App\Http\Controllers\API\PaymentRequestController@store');
    Route::PUT('/payment-request/update/{id}', 'App\Http\Controllers\API\PaymentRequestController@update');
    Route::GET('/payment-request/delete/{id}', 'App\Http\Controllers\API\PaymentRequestController@destroy');
    Route::POST('/payment-request/answer/{id}', 'App\Http\Controllers\API\PaymentRequestController@answer');
    Route::GET('/payment-request/edit/{id}','App\Http\Controllers\API\PaymentRequestController@edit');

    // Payment Request Status
    Route::get('/payment_request_status/show', [PaymentRequestStatusController::class, 'show']);
    Route::POST('/payment_request_status/store', [PaymentRequestStatusController::class, 'store']);
    Route::POST('/payment_request_status/update/{id}', [PaymentRequestStatusController::class, 'update']);
    Route::POST('/payment_request_status/destroy/{id}', [PaymentRequestStatusController::class, 'destroy']);

    // Payment Request Files
    Route::GET('/payment-request/files/show', 'App\Http\Controllers\API\PaymentRequestFilesController@index');
    Route::GET('/payment-request/files/detail/{id}', 'App\Http\Controllers\API\PaymentRequestFilesController@detail');
    Route::POST('/payment-request/files/store', 'App\Http\Controllers\API\PaymentRequestFilesController@store');
    Route::POST('/payment-request/files/delete/{id}', 'App\Http\Controllers\API\PaymentRequestFilesController@destroy');

    // Currency List
    Route::get('/currencylist', [CurrencyController::class, 'show']);
});
Route::GET('/alert', function () {
    return response()->json([
        'code' => 402,
        'data' => 'unauthorized',
    ]);
});
