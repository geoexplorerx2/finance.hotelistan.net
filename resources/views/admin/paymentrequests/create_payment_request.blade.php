@extends('layouts.app')

@section('content')

@include('layouts.navbar')

<div class="container-fluid">
   <div class="card card-custom">
        <div class="card-body p-0">
            <div class="wizard wizard-2" id="kt_wizard" data-wizard-state="step-first" data-wizard-clickable="false">
                <div class="wizard-nav border-right py-8 px-8 py-lg-20 px-lg-10">
                    <div class="wizard-steps">
                        <div class="wizard-step" data-wizard-type="step" data-wizard-state="current">
                            <div class="wizard-wrapper">
                                <div class="wizard-icon">
                                    <span class="svg-icon svg-icon-2x">
                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                <rect x="0" y="0" width="24" height="24"/>
                                                <path d="M12.2674799,18.2323597 L12.0084872,5.45852451 C12.0004303,5.06114792 12.1504154,4.6768183 12.4255037,4.38993949 L15.0030167,1.70195304 L17.5910752,4.40093695 C17.8599071,4.6812911 18.0095067,5.05499603 18.0083938,5.44341307 L17.9718262,18.2062508 C17.9694575,19.0329966 17.2985816,19.701953 16.4718324,19.701953 L13.7671717,19.701953 C12.9505952,19.701953 12.2840328,19.0487684 12.2674799,18.2323597 Z" fill="#000000" fill-rule="nonzero" transform="translate(14.701953, 10.701953) rotate(-135.000000) translate(-14.701953, -10.701953) "/>
                                                <path d="M12.9,2 C13.4522847,2 13.9,2.44771525 13.9,3 C13.9,3.55228475 13.4522847,4 12.9,4 L6,4 C4.8954305,4 4,4.8954305 4,6 L4,18 C4,19.1045695 4.8954305,20 6,20 L18,20 C19.1045695,20 20,19.1045695 20,18 L20,13 C20,12.4477153 20.4477153,12 21,12 C21.5522847,12 22,12.4477153 22,13 L22,18 C22,20.209139 20.209139,22 18,22 L6,22 C3.790861,22 2,20.209139 2,18 L2,6 C2,3.790861 3.790861,2 6,2 L12.9,2 Z" fill="#000000" fill-rule="nonzero" opacity="0.3"/>
                                            </g>
                                        </svg>
                                    </span>
                                </div>
                                <div class="wizard-label">
                                    <h3 class="wizard-title">Yeni Talep Oluştur</h3>
                                    <div class="wizard-desc">Talep Detaylarınızı Belirleyin</div>
                                </div>
                            </div>
                        </div>
                        <div class="wizard-step" data-wizard-type="step">
                            <div class="wizard-wrapper">
                                <div class="wizard-icon">
                                    <span class="svg-icon svg-icon-2x">
                                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                <rect x="0" y="0" width="24" height="24" />
                                                <path d="M9,10 L9,19 L10.1525987,19.3841996 C11.3761964,19.7920655 12.6575468,20 13.9473319,20 L17.5405883,20 C18.9706314,20 20.2018758,18.990621 20.4823303,17.5883484 L21.231529,13.8423552 C21.5564648,12.217676 20.5028146,10.6372006 18.8781353,10.3122648 C18.6189212,10.260422 18.353992,10.2430672 18.0902299,10.2606513 L14.5,10.5 L14.8641964,6.49383981 C14.9326895,5.74041495 14.3774427,5.07411874 13.6240179,5.00562558 C13.5827848,5.00187712 13.5414031,5 13.5,5 L13.5,5 C12.5694044,5 11.7070439,5.48826024 11.2282564,6.28623939 L9,10 Z" fill="#000000" />
                                                <rect fill="#000000" opacity="0.3" x="2" y="9" width="5" height="11" rx="1" />
                                            </g>
                                        </svg>
                                    </span>
                                </div>
                                <div class="wizard-label">
                                    <h3 class="wizard-title"> Talep Özeti</h3>
                                    <div class="wizard-desc">İncele ve Gönder</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="wizard-body py-8 px-8 py-lg-20 px-lg-10">
                    <div class="row">
                        <div class="offset-xxl-2 col-xxl-8">
                                <div class="pb-5" data-wizard-type="step-content" data-wizard-state="current" id="step1">
                                    <h4 class="mb-10 font-weight-bold text-dark">Talebinizin Ayrıntılarını Girin</h4>
                                    <div class="row mt-3">
                                        <div class="col-lg-6">
                                           <div class="form-group">
                                              <label for="expiryDate">Vade</label>
                                              <input type="text" name="expiryDate" class="form-control" id="expiryDate" placeholder="Vade">
                                           </div>
                                        </div>
                                        <div class="col-lg-3">
                                           <div class="form-group">
                                              <label for="paymentAmount">Tutar</label>
                                              <input type="text" name="paymentAmount" class="form-control" id="paymentAmount" placeholder="Tutar">
                                           </div>
                                        </div>
                                        <div class="col-lg-3">
                                           <div class="form-group">
                                              <label for="paymentCurrency">Para Birimi</label>
                                              <select name="paymentCurrency" class="form-control" id="paymentCurrency">
                                                 <option></option>
                                                 <option value="EUR">Euro</option>
                                                 <option value="USD">Dolar</option>
                                                 <option value="GBP">Pound</option>
                                                 <option value="TL">Lira</option>
                                              </select>
                                           </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label for="payCompanyId">Ödeyen Firma</label>
                                                <select name="payCompanyId" class="form-control" id="payCompanyId">
                                                    <option></option>
                                                    @foreach ($companies as $company)
                                                    <option value="{{ $company->id }}">{{ $company->name }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label for="paidCompanyId">Ödenen Firma</label>
                                                <select name="paidCompanyId" class="form-control" id="paidCompanyId">
                                                    <option></option>
                                                    @foreach ($companies as $company)
                                                    <option value="{{ $company->id }}">{{ $company->name }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label for="paymentTypeId">Ödeme Türü</label>
                                                <select name="paymentTypeId" class="form-control" id="paymentTypeId">
                                                    <option></option>
                                                    @foreach ($payment_types as $payment_type)
                                                    <option value="{{ $payment_type->id }}">{{ $payment_type->name }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>

                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label for="categoryId">Ödeme Kategorisi</label>
                                                <select name="categoryId" class="form-control" id="categoryId">
                                                    <option></option>
                                                    @foreach ($categories as $category)
                                                    <option value="{{ $category->id }}">{{ $category->name }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                     </div>
                                     <div class="row">
                                        <div class="col-lg-6">
                                           <div class="form-group">
                                              <label for="documentDate">Belge Tarihi</label>
                                              <input type="text" name="documentDate" class="form-control" id="documentDate" placeholder="Belge Tarihi">
                                           </div>
                                        </div>
                                        <div class="col-lg-6">
                                           <div class="form-group">
                                              <label for="invoiceDate">Fatura Tarihi</label>
                                              <input type="text" name="invoiceDate" class="form-control" id="invoiceDate" placeholder="Fatura Tarihi">
                                           </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6">
                                           <div class="form-group">
                                              <label for="documentNo">Belge No</label>
                                              <input type="text" name="documentNo" class="form-control" id="documentNo" placeholder="Belge No">
                                           </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                               <label for="note">Açıklama</label>
                                               <textarea class="form-control" name="note" id="note" placeholder="Açıklama" rows="3" cols="50"></textarea>
                                            </div>
                                         </div>
                                    </div>
                                <hr>
                                <div class="row mt-3">
                                    <div class="col-lg-12 col-md-12 col-xs-12">
                                    <h4 class="pb-3">Belge Dosyaları</h4>
                                    <form method="post" action="{{ url('files/store') }}" enctype="multipart/form-data" class="dropzone" id="dropzone">
                                        @csrf
                                        <input type="hidden" name="paymentRequestId" id="prId">
                                        <div class="dz-message needsclick">
                                            <h4>Dosyaları buraya sürükleyip bırakın veya yüklemek için tıklayın.</h4>
                                            <i class="fas fa-box-open fa-5x pull-r"></i>
                                            <br>
                                        </div>
                                    </form>
                                    </div>
                                </div>

                                </div>
                                <div class="pb-5" data-wizard-type="step-content"  id="step2">
                                    <h4 class="mb-10 font-weight-bold text-dark">Ödeme Talebi Özeti:</h4>
                                    <h6 class="font-weight-bolder mb-3">Vade</h6>
                                    <div class="text-dark-50 line-height-lg">
                                        <div class="expiry-date"></div>
                                    </div>
                                    <div class="separator separator-dashed my-5"></div>
                                    <h6 class="font-weight-bolder mb-3">Tutar</h6>
                                    <div class="text-dark-50 line-height-lg">
                                        <div class="payment-amount"></div>
                                    </div>
                                    <div class="separator separator-dashed my-5"></div>
                                    <h6 class="font-weight-bolder mb-3">Ödeyen Firma:</h6>
                                    <div class="text-dark-50 line-height-lg">
                                        <div class="pay-company-name"></div>
                                    </div>
                                    <div class="separator separator-dashed my-5"></div>
                                    <h6 class="font-weight-bolder mb-3">Ödenen Firma:</h6>
                                    <div class="text-dark-50 line-height-lg">
                                        <div class="paid-company-name"></div>
                                    </div>
                                    <div class="separator separator-dashed my-5"></div>
                                    <h6 class="font-weight-bolder mb-3">Belge No:</h6>
                                    <div class="text-dark-50 line-height-lg">
                                        <div class="document-no"></div>
                                    </div>
                                    <div class="separator separator-dashed my-5"></div>
                                    <h6 class="font-weight-bolder mb-3">Belge Tarihi:</h6>
                                    <div class="text-dark-50 line-height-lg">
                                        <div class="document-date"></div>
                                    </div>
                                    <div class="separator separator-dashed my-5"></div>
                                    <h6 class="font-weight-bolder mb-3">Fatura Tarihi:</h6>
                                    <div class="text-dark-50 line-height-lg">
                                        <div class="invoice-date"></div>
                                    </div>
                                    <div class="separator separator-dashed my-5"></div>
                                    <h6 class="font-weight-bolder mb-3">Ödeme Kategorisi:</h6>
                                    <div class="text-dark-50 line-height-lg">
                                        <div class="category-name"></div>
                                    </div>
                                    <div class="separator separator-dashed my-5"></div>
                                    <h6 class="font-weight-bolder mb-3">Açıklama:</h6>
                                    <div class="text-dark-50 line-height-lg">
                                        <div class="description"></div>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-between border-top mt-5 pt-10">
                                    <div class="mr-2">
                                        <button type="button" class="btn btn-light-primary font-weight-bolder text-uppercase px-9 py-4" data-wizard-type="action-prev">Önceki</button>
                                    </div>
                                    <div>
                                        <button type="button" id="completePaymentRequest" class="btn btn-success font-weight-bolder text-uppercase px-9 py-4" data-wizard-type="action-submit">Tamamla</button>
                                        <button type="button" id="savePaymentRequestBtn" class="btn btn-primary font-weight-bolder text-uppercase px-9 py-4" data-wizard-type="action-next">İleri <i class="fa fa-arrow-right"></i></button>
                                    </div>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection
