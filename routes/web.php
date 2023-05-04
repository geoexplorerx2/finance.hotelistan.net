<?php

use Illuminate\Support\Facades\Route;

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: *');
header('Access-Control-Allow-Headers: *');

Route::get('/', function () {
return view('auth.login');
});

Auth::routes(['register' => false]);

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
Route::get('/clear-cache', function() {
$exitCode = Artisan::call('cache:clear');
$exitCode = Artisan::call('config:cache');
return 'DONE';
});

Route::group(['middleware' => ['auth']], function(){

Route::get('logout', '\App\Http\Controllers\Auth\LoginController@logout');
// Route::GET('getCurrencies', 'CurrencyController@getCurrencies');

//Calendar Operations
Route::GET('paymentcalendar', 'PaymentRequestController@paymentcalendar')->middleware(['middleware' => 'permission:takvimi göster'])->name('paymentcalendar.index');
Route::GET('bydate', 'PaymentRequestController@allTreatmentPlanByDate')->middleware(['middleware' => 'permission:takvimi göster'])->name('bydate.index');
Route::GET('paymentsbydate', 'PaymentRequestController@allPaymentRequestByDate')->middleware(['middleware' => 'permission:takvimi göster'])->name('paymentsbydate.index');
Route::GET('operationbydate/edit/{id}', 'PaymentRequestController@editOperationDates')->middleware(['middleware' => 'permission:ödeme talebini düzenle'])->name('operationbydate.edit.index');

//Users Operations
Route::GET('definitions/users', 'UserController@index')->middleware(['middleware' => 'permission:kullanıcıları göster'])->name('users.index');
Route::GET('definitions/users/create', 'UserController@create')->middleware(['middleware' => 'permission:kullanıcı oluştur'])->name('users.create');
Route::POST('definitions/users/store', 'UserController@store')->middleware(['middleware' => 'permission:kullanıcı oluştur'])->name('users.store');
Route::GET('definitions/users/edit/{id}', 'UserController@edit')->middleware(['middleware' => 'permission:kullanıcıları düzenle'])->name('users.edit');
Route::POST('definitions/users/update/{id}', 'UserController@update')->middleware(['middleware' => 'permission:kullanıcıları düzenle'])->name('users.update');
Route::GET('definitions/users/delete/{id}', 'UserController@destroy')->middleware(['middleware' => 'permission:kullanıcıları sil'])->name('users.delete');;

Route::GET('profile/edit/{id}', 'UserController@userProfile')->middleware(['middleware' => 'permission:kullanıcıları düzenle'])->name('profile.edit');

//Roles and Permissions
Route::GET('roles', 'RolePermissionController@index')->middleware(['middleware' => 'permission:rolleri göster'])->name('roles.index');
Route::GET('roles/create', 'RolePermissionController@create')->middleware(['middleware' => 'permission:roller oluşturmak'])->name('roles.create');
Route::POST('roles/store', 'RolePermissionController@store')->middleware(['middleware' => 'permission:roller oluşturmak'])->name('roles.store');
Route::GET('roles/edit/{id}', 'RolePermissionController@edit')->middleware(['middleware' => 'permission:roller oluşturmak'])->name('roles.edit');
Route::POST('roles/update/{id}', 'RolePermissionController@update')->middleware(['middleware' => 'permission:roller oluşturmak'])->name('roles.update');
Route::GET('roles/delete/{id}', 'RolePermissionController@destroy')->middleware(['middleware' => 'permission:rolleri sil'])->name('roles.delete');
Route::GET('roles/clone/{id}', 'RolePermissionController@cloneRole')->middleware(['middleware' => 'permission:roller oluşturmak'])->name('roles.clone');
//Roles and Permissions end

//Reports
Route::GET('definitions/reports', 'ReportController@index')->middleware(['middleware' => 'permission:raporları göster'])->name('reports.index');
Route::GET('companiesReport', 'ReportController@companiesReport')->middleware(['middleware' => 'permission:raporları göster']);
Route::GET('usersReport', 'ReportController@usersReport')->middleware(['middleware' => 'permission:raporları göster']);
Route::GET('suppliersReport', 'ReportController@suppliersReport')->middleware(['middleware' => 'permission:raporları göster']);
Route::GET('purchasingUsersReport', 'ReportController@purchasingUsersReport')->middleware(['middleware' => 'permission:raporları göster']);
//Reports end

//Companies
Route::GET('definitions/companies', 'CompanyController@index')->middleware(['middleware' => 'permission:şirketleri göster'])->name('companies.index');
Route::POST('definitions/companies/store', 'CompanyController@store')->middleware(['middleware' => 'permission:şirketler oluşturmak'])->name('companies.store');
Route::GET('definitions/companies/edit/{id}', 'CompanyController@edit')->middleware(['middleware' => 'permission:şirketleri düzenle'])->name('companies.edit');
Route::POST('definitions/companies/update/{id}', 'CompanyController@update')->middleware(['middleware' => 'permission:şirketleri düzenle'])->name('companies.update');
Route::GET('definitions/companies/destroy/{id}', 'CompanyController@destroy')->middleware(['middleware' => 'permission:şirketleri sil'])->name('companies.destroy');
//Companies end

//Suppliers
Route::GET('definitions/suppliers', 'SupplierController@index')->middleware(['middleware' => 'permission:şirketleri göster'])->name('suppliers.index');
Route::POST('definitions/suppliers/store', 'SupplierController@store')->middleware(['middleware' => 'permission:şirketler oluşturmak'])->name('suppliers.store');
Route::GET('definitions/suppliers/edit/{id}', 'SupplierController@edit')->middleware(['middleware' => 'permission:şirketleri düzenle'])->name('suppliers.edit');
Route::POST('definitions/suppliers/update/{id}', 'SupplierController@update')->middleware(['middleware' => 'permission:şirketleri düzenle'])->name('suppliers.update');
Route::GET('definitions/suppliers/destroy/{id}', 'SupplierController@destroy')->middleware(['middleware' => 'permission:şirketleri sil'])->name('suppliers.destroy');
//Suppliers end

//Employees
Route::GET('definitions/employees', 'EmployeeController@index')->middleware(['middleware' => 'permission:personelleri goster'])->name('employees.index');
Route::POST('definitions/employees/store', 'EmployeeController@store')->middleware(['middleware' => 'permission:personelleri olustur'])->name('employees.store');
Route::GET('definitions/employees/edit/{id}', 'EmployeeController@edit')->middleware(['middleware' => 'permission:personelleri duzenle'])->name('employees.edit');
Route::POST('definitions/employees/update/{id}', 'EmployeeController@update')->middleware(['middleware' => 'permission:personelleri duzenle'])->name('employees.update');
Route::GET('definitions/employees/destroy/{id}', 'EmployeeController@destroy')->middleware(['middleware' => 'permission:personelleri sil'])->name('employees.destroy');
//Employees end

//Cheque
Route::GET('chequecalendar', 'ChequeController@chequecalendar')->middleware(['middleware' => 'permission:cek takvimi goster'])->name('chequecalendar.index');
Route::GET('definitions/cheques', 'ChequeController@index')->middleware(['middleware' => 'permission:cekleri goster'])->name('cheques.index');
Route::POST('definitions/cheques/store', 'ChequeController@store')->middleware(['middleware' => 'permission:cek olustur'])->name('cheques.store');
Route::GET('definitions/cheques/edit/{id}', 'ChequeController@edit')->middleware(['middleware' => 'permission:cekleri duzenle'])->name('cheques.edit');
Route::POST('definitions/cheques/update/{id}', 'ChequeController@update')->middleware(['middleware' => 'permission:cekleri duzenle'])->name('cheques.update');
Route::GET('definitions/cheques/destroy/{id}', 'ChequeController@destroy')->middleware(['middleware' => 'permission:cekleri sil'])->name('cheques.destroy');
Route::GET('chequesbydate', 'ChequeController@allChequeByDate')->middleware(['middleware' => 'permission:cek takvimi goster'])->name('chequesbydate.index');
//Cheque end

//Bills
Route::GET('definitions/bills', 'BillController@index')->middleware(['middleware' => 'permission:senetleri goster'])->name('bills.index');
Route::POST('definitions/bills/store', 'BillController@store')->middleware(['middleware' => 'permission:senetleri olustur'])->name('bills.store');
Route::GET('definitions/bills/edit/{id}', 'BillController@edit')->middleware(['middleware' => 'permission:senetleri duzenle'])->name('bills.edit');
Route::POST('definitions/bills/update/{id}', 'BillController@update')->middleware(['middleware' => 'permission:senetleri duzenle'])->name('bills.update');
Route::GET('definitions/bills/destroy/{id}', 'BillController@destroy')->middleware(['middleware' => 'permission:senetleri sil'])->name('bills.destroy');
//Bills end

//Credit Cards
Route::GET('definitions/creditcards', 'CreditCardController@index')->middleware(['middleware' => 'permission:kredi kartlari goster'])->name('creditcards.index');
Route::POST('definitions/creditcards/store', 'CreditCardController@store')->middleware(['middleware' => 'permission:kredi kartlari olustur'])->name('creditcards.store');
Route::GET('definitions/creditcards/edit/{id}', 'CreditCardController@edit')->middleware(['middleware' => 'permission:kredi kartlari duzenle'])->name('creditcards.edit');
Route::POST('definitions/creditcards/update/{id}', 'CreditCardController@update')->middleware(['middleware' => 'permission:kredi kartlari duzenle'])->name('creditcards.update');
Route::GET('definitions/creditcards/destroy/{id}', 'CreditCardController@destroy')->middleware(['middleware' => 'permission:kredi kartlari sil'])->name('creditcards.destroy');
//Credit Cards end

//Payment Request
Route::GET('paymentrequests', 'PaymentRequestController@index')->middleware(['middleware' => 'permission:ödeme talebini göster'])->name('paymentrequests.index');
Route::POST('paymentrequests/store', 'PaymentRequestController@store')->middleware(['middleware' => 'permission:ödeme talebi oluştur'])->name('paymentrequests.store');
Route::GET('paymentrequests/create', 'PaymentRequestController@create')->middleware(['middleware' => 'permission:ödeme talebi oluştur'])->name('paymentrequests.create');
Route::GET('paymentrequests/requested', 'PaymentRequestController@requested')->middleware(['middleware' => 'permission:istenen ödeme talebini göster'])->name('paymentrequests.requested');
Route::GET('paymentrequests/waiting', 'PaymentRequestController@waiting')->middleware(['middleware' => 'permission:bekleyen ödeme talebini göster'])->name('paymentrequests.waiting');
Route::GET('paymentrequests/completed', 'PaymentRequestController@completed')->middleware(['middleware' => 'permission:tamamlanan ödeme talebini göster'])->name('paymentrequests.completed');
Route::POST('paymentrequests/postPaymentRequest/{id}', 'PaymentRequestController@postPaymentRequest')->middleware(['middleware' => 'permission:ödeme isteği sonrası'])->name('paymentrequests.postPaymentRequest');
Route::GET('paymentrequests/edit/{id}', 'PaymentRequestController@edit')->middleware(['middleware' => 'permission:ödeme talebini düzenle'])->name('paymentrequests.edit');
Route::POST('paymentrequests/update/{id}', 'PaymentRequestController@update')->middleware(['middleware' => 'permission:ödeme talebini düzenle'])->name('paymentrequests.update');
Route::GET('paymentrequests/destroy/{id}', 'PaymentRequestController@destroy')->middleware(['middleware' => 'permission:ödeme isteğini sil'])->name('paymentrequests.destroy');
//Payment Request

//Purchasing Request
Route::GET('purchasingrequests', 'PurchasingRequestController@index')->middleware(['middleware' => 'permission:satin alma talebini göster'])->name('purchasingrequests.index');
Route::POST('purchasingrequests/store', 'PurchasingRequestController@store')->middleware(['middleware' => 'permission:satin alma talebini olustur'])->name('purchasing.store');
Route::GET('purchasingrequests/create', 'PurchasingRequestController@create')->middleware(['middleware' => 'permission:satin alma talebini olustur'])->name('purchasingrequests.create');
Route::GET('purchasingrequests/requested', 'PurchasingRequestController@requested')->middleware(['middleware' => 'permission:cevaplanmayan talebini göster'])->name('purchasingrequests.requested');
Route::GET('purchasingrequests/waiting', 'PurchasingRequestController@waiting')->middleware(['middleware' => 'permission:onaya goderilen talebini göster'])->name('purchasingrequests.waiting');
Route::GET('purchasingrequests/completed', 'PurchasingRequestController@completed')->middleware(['middleware' => 'permission:tamamlan talebini göster'])->name('purchasingrequests.completed');
Route::POST('purchasingrequests/postPurchasingRequest/{id}', 'PurchasingRequestController@postPurchasingRequest')->middleware(['middleware' => 'permission:ödeme isteği sonrası'])->name('paymentrequests.postPurchasingRequest');
Route::GET('purchasingrequests/edit/{id}', 'PurchasingRequestController@edit')->middleware(['middleware' => 'permission:satin alma talebini duzenle'])->name('purchasingrequests.edit');
Route::POST('purchasingrequests/update/{id}', 'PurchasingRequestController@update')->middleware(['middleware' => 'permission:satin alma talebini duzenle'])->name('purchasingrequests.update');
Route::GET('purchasingrequests/destroy/{id}', 'PurchasingRequestController@destroy')->middleware(['middleware' => 'permission:satin alma talebini sil'])->name('purchasingrequests.destroy');
//Purchasing Request


//Payment Request Status
Route::GET('definitions/paymentrequeststatus', 'PaymentRequestStatusController@index')->middleware(['middleware' => 'permission:ödeme talebi durumunu göster'])->name('paymentrequeststatus.index');
Route::POST('definitions/paymentrequeststatus/store', 'PaymentRequestStatusController@store')->middleware(['middleware' => 'permission:ödeme talebi durumu oluştur'])->name('paymentrequeststatus.store');
Route::GET('definitions/paymentrequeststatus/edit/{id}', 'PaymentRequestStatusController@edit')->middleware(['middleware' => 'permission:ödeme talebi durumunu düzenle'])->name('paymentrequeststatus.edit');
Route::POST('definitions/paymentrequeststatus/update/{id}', 'PaymentRequestStatusController@update')->middleware(['middleware' => 'permission:ödeme talebi durumunu düzenle'])->name('paymentrequeststatus.update');
Route::GET('definitions/paymentrequeststatus/destroy/{id}', 'PaymentRequestStatusController@destroy')->middleware(['middleware' => 'permission:ödeme isteği durumunu sil'])->name('paymentrequeststatus.destroy');
//Payment Request Status

//Cheque Status
Route::GET('definitions/chequestatus', 'ChequeStatusController@index')->middleware(['middleware' => 'permission:cek durumu goster'])->name('chequestatus.index');
Route::POST('definitions/chequestatus/store', 'ChequeStatusController@store')->middleware(['middleware' => 'permission:cek durumu ekle'])->name('chequestatus.store');
Route::GET('definitions/chequestatus/edit/{id}', 'ChequeStatusController@edit')->middleware(['middleware' => 'permission:cek durumu duzenle'])->name('chequestatus.edit');
Route::POST('definitions/chequestatus/update/{id}', 'ChequeStatusController@update')->middleware(['middleware' => 'permission:cek durumu duzenle'])->name('chequestatus.update');
Route::GET('definitions/chequestatus/destroy/{id}', 'ChequeStatusController@destroy')->middleware(['middleware' => 'permission:cek durumu sil'])->name('chequestatus.destroy');
//Cheque Status

//Payment Request Category
Route::GET('definitions/paymentrequestcategory', 'PaymentRequestCategoryController@index')->middleware(['middleware' => 'permission:odeme kategorileri goster'])->name('paymentrequestcategory.index');
Route::POST('definitions/paymentrequestcategory/store', 'PaymentRequestCategoryController@store')->middleware(['middleware' => 'permission:odeme kategorileri olustur'])->name('paymentrequestcategory.store');
Route::GET('definitions/paymentrequestcategory/edit/{id}', 'PaymentRequestCategoryController@edit')->middleware(['middleware' => 'permission:odeme kategorileri duzenle'])->name('paymentrequestcategory.edit');
Route::POST('definitions/paymentrequestcategory/update/{id}', 'PaymentRequestCategoryController@update')->middleware(['middleware' => 'permission:odeme kategorileri duzenle'])->name('paymentrequestcategory.update');
Route::GET('definitions/paymentrequestcategory/destroy/{id}', 'PaymentRequestCategoryController@destroy')->middleware(['middleware' => 'permission:odeme kategorileri sil'])->name('paymentrequestcategory.destroy');
//Payment Request Category


//Payment Types
Route::GET('definitions/paymenttypes', 'PaymentTypeController@index')->middleware(['middleware' => 'permission:ödeme türlerini göster'])->name('paymenttypes.index');
Route::POST('definitions/paymenttypes/store', 'PaymentTypeController@store')->middleware(['middleware' => 'permission:ödeme türleri oluştur'])->name('paymenttypes.store');
Route::GET('definitions/paymenttypes/edit/{id}', 'PaymentTypeController@edit')->middleware(['middleware' => 'permission:ödeme türlerini düzenle'])->name('paymenttypes.edit');
Route::POST('definitions/paymenttypes/update/{id}', 'PaymentTypeController@update')->middleware(['middleware' => 'permission:ödeme türlerini düzenle'])->name('paymenttypes.update');
Route::GET('definitions/paymenttypes/destroy/{id}', 'PaymentTypeController@destroy')->middleware(['middleware' => 'permission:ödeme türlerini sil'])->name('paymenttypes.destroy');
//Payment Types


//Personnel Card
Route::GET('humanresource/personnelcard', 'PersonnelCardController@index')->middleware(['middleware' => 'permission:personel ozluk karti goster'])->name('personnelcard.index');
Route::GET('humanresource/create', 'PersonnelCardController@create')->middleware(['middleware' => 'permission:personel ozluk karti olustur'])->name('personnelcard.create');
Route::POST('humanresource/personnelcard/store', 'PersonnelCardController@store')->middleware(['middleware' => 'permission:personel ozluk karti olustur'])->name('personnelcard.store');
Route::GET('humanresource/personnelcard/edit/{id}', 'PersonnelCardController@edit')->middleware(['middleware' => 'permission:personel ozluk karti duzenle'])->name('personnelcard.edit');
Route::POST('humanresource/personnelcard/update/{id}', 'PersonnelCardController@update')->middleware(['middleware' => 'permission:personel ozluk karti duzenle'])->name('personnelcard.update');
Route::GET('humanresource/personnelcard/destroy/{id}', 'PersonnelCardController@destroy')->middleware(['middleware' => 'permission:personel ozluk karti sil'])->name('personnelcard.destroy');
Route::POST('personnelcard/photos/store', 'PersonnelCardPhotosController@store');
Route::POST('personnelcard/photos/newstore', 'PersonnelCardPhotosController@newstore');
Route::POST('personnelcard/photos/update', 'PersonnelCardPhotosController@update')->name('personnelphoto.update');
Route::POST('personnelcard/photos/destroy/{id}', 'PersonnelCardPhotosController@destroy');
//Personnel Card end

//Annual Leave
Route::GET('humanresource/annualleave', 'AnnualLeaveController@index')->middleware(['middleware' => 'permission:yillik izin takip goster'])->name('annualleaves.index');
Route::POST('humanresource/annualleave/store', 'AnnualLeaveController@store')->middleware(['middleware' => 'permission:yillik izin takip olustur'])->name('annualleaves.store');
Route::GET('humanresource/annualleave/edit/{id}', 'AnnualLeaveController@edit')->middleware(['middleware' => 'permission:yillik izin takip duzenle'])->name('annualleaves.edit');
Route::POST('humanresource/annualleave/update/{id}', 'AnnualLeaveController@update')->middleware(['middleware' => 'permission:yillik izin takip duzenle'])->name('annualleaves.update');
Route::GET('humanresource/annualleave/destroy/{id}', 'AnnualLeaveController@destroy')->middleware(['middleware' => 'permission:yillik izin takip sil'])->name('annualleaves.destroy');
//Annual Leave end

//Annual Leave Types
Route::GET('definitions/annualleavetypes', 'AnnualLeaveTypeController@index')->middleware(['middleware' => 'permission:yillik izin turlerini goster'])->name('annualleavetypes.index');
Route::POST('definitions/annualleavetypes/store', 'AnnualLeaveTypeController@store')->middleware(['middleware' => 'permission:yillik izin turlerini olustur'])->name('annualleavetypes.store');
Route::GET('definitions/annualleavetypes/edit/{id}', 'AnnualLeaveTypeController@edit')->middleware(['middleware' => 'permission:yillik izin turlerini duzenle'])->name('annualleavetypes.edit');
Route::POST('definitions/annualleavetypes/update/{id}', 'AnnualLeaveTypeController@update')->middleware(['middleware' => 'permission:yillik izin turlerini duzenle'])->name('annualleavetypes.update');
Route::GET('definitions/annualleavetypes/destroy/{id}', 'AnnualLeaveTypeController@destroy')->middleware(['middleware' => 'permission:yillik izin turlerini sil'])->name('annualleavetypes.destroy');
//Annual Leave Types

//Departments
Route::GET('definitions/departments', 'DepartmentController@index')->middleware(['middleware' => 'permission:yillik izin turlerini goster'])->name('departments.index');
Route::POST('definitions/departments/store', 'DepartmentController@store')->middleware(['middleware' => 'permission:yillik izin turlerini olustur'])->name('departments.store');
Route::GET('definitions/departments/edit/{id}', 'DepartmentController@edit')->middleware(['middleware' => 'permission:yillik izin turlerini duzenle'])->name('departments.edit');
Route::POST('definitions/departments/update/{id}', 'DepartmentController@update')->middleware(['middleware' => 'permission:yillik izin turlerini duzenle'])->name('departments.update');
Route::GET('definitions/departments/destroy/{id}', 'DepartmentController@destroy')->middleware(['middleware' => 'permission:yillik izin turlerini sil'])->name('departments.destroy');
//Departments

//Departments
Route::GET('definitions/companytypes', 'CompanyTypeController@index')->middleware(['middleware' => 'permission:yillik izin turlerini goster'])->name('companytypes.index');
Route::POST('definitions/companytypes/store', 'CompanyTypeController@store')->middleware(['middleware' => 'permission:yillik izin turlerini olustur'])->name('companytypes.store');
Route::GET('definitions/companytypes/edit/{id}', 'CompanyTypeController@edit')->middleware(['middleware' => 'permission:yillik izin turlerini duzenle'])->name('companytypes.edit');
Route::POST('definitions/companytypes/update/{id}', 'CompanyTypeController@update')->middleware(['middleware' => 'permission:yillik izin turlerini duzenle'])->name('companytypes.update');
Route::GET('definitions/companytypes/destroy/{id}', 'CompanyTypeController@destroy')->middleware(['middleware' => 'permission:yillik izin turlerini sil'])->name('companytypes.destroy');
//Departments

//Trial Period
Route::GET('humanresource/trialperiod', 'TrialPeriodController@index')->middleware(['middleware' => 'permission:deneme sureleri goster'])->name('trialperiods.index');
Route::POST('humanresource/trialperiod/store', 'TrialPeriodController@store')->middleware(['middleware' => 'permission:deneme sureleri olustur'])->name('trialperiods.store');
Route::GET('humanresource/trialperiod/edit/{id}', 'TrialPeriodController@edit')->middleware(['middleware' => 'permission:deneme sureleri duzenle'])->name('trialperiods.edit');
Route::POST('humanresource/trialperiod/update/{id}', 'TrialPeriodController@update')->middleware(['middleware' => 'permission:deneme sureleri duzenle'])->name('trialperiods.update');
Route::GET('humanresource/trialperiod/destroy/{id}', 'TrialPeriodController@destroy')->middleware(['middleware' => 'permission:deneme sureleri sil'])->name('trialperiods.destroy');
//Trial Period end

//Check Registration
Route::GET('humanresource/checkregistration', 'CheckRegistrationController@index')->middleware(['middleware' => 'permission:puantaj kayit goster'])->name('checkregistrations.index');
Route::POST('humanresource/checkregistration/store', 'CheckRegistrationController@store')->middleware(['middleware' => 'permission:puantaj kayit olustur'])->name('checkregistrations.store');
Route::GET('humanresource/checkregistration/edit/{id}', 'CheckRegistrationController@edit')->middleware(['middleware' => 'permission:puantaj kayit duzenle'])->name('checkregistrations.edit');
Route::POST('humanresource/checkregistration/update/{id}', 'CheckRegistrationController@update')->middleware(['middleware' => 'permission:puantaj kayit duzenle'])->name('checkregistrations.update');
Route::GET('humanresource/checkregistration/destroy/{id}', 'CheckRegistrationController@destroy')->middleware(['middleware' => 'permission:puantaj kayit sil'])->name('checkregistrations.destroy');
//Check Registration end

//Liability
Route::GET('humanresource/liability', 'LiabilityController@index')->middleware(['middleware' => 'permission:zimmet goster'])->name('liabilities.index');
Route::POST('humanresource/liability/store', 'LiabilityController@store')->middleware(['middleware' => 'permission:zimmet olustur'])->name('liabilities.store');
Route::GET('humanresource/liability/edit/{id}', 'LiabilityController@edit')->middleware(['middleware' => 'permission:zimmet duzenle'])->name('liabilities.edit');
Route::POST('humanresource/liability/update/{id}', 'LiabilityController@update')->middleware(['middleware' => 'permission:zimmet düzenle'])->name('liabilities.update');
Route::GET('humanresource/liability/destroy/{id}', 'LiabilityController@destroy')->middleware(['middleware' => 'permission:zimmet sil'])->name('liabilities.destroy');
//Liability end

//Reports
Route::GET('reports/payments', 'ReportController@paymentReport')->middleware(['middleware' => 'permission:raporları göster'])->name('report.payment');
//Reports

Route::POST('files/store', 'PaymentRequestFilesController@store');
Route::GET('files/destroy/{id}', 'PaymentRequestFilesController@destroy');
});
