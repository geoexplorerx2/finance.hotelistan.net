@extends('layouts.app')

@section('content')

@include('layouts.navbar')

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <button class="btn btn-primary mt-3" onclick="previousPage();"><i class="fa fa-chevron-left"></i> Önceki Sayfa</button>
            <div class="card p-3 mt-3">
                <div class="card-title">
                    <p class="text-white tp-status" style="background-color: {{ $payment_request->status->color }};padding: 15px; border-radius: 10px;">Ödeme Talebi Durumu: <strong>{{ $payment_request->status->name }}</strong></p>
                    <nav class="nav nav-borders">
                        <a class="nav-link active ms-0" href="{{ route('paymentrequests.edit', ['id' => $payment_request->id]) }}"><i class="fa fa-user" style="margin-right:5px;"></i> Ödeme Talep Bilgileri</a>
                        <a class="nav-link ms-0" href="{{route('paymentrequests.edit', ['id' => $payment_request->id,'page'=>'files']) }}"><i class="fa fa-file" style="margin-right:5px;"></i> Belgeler</a>
                    </nav>
                </div>
                <div class="row">
                    <div class="col-xl-3">
                        <div class="card mb-4 mb-xl-0">
                            <div class="card-header">Firma Bilgileri</div>
                            <div class="card-body text-center">
                                <img class="img-account-profile rounded-circle mb-2" src="{{ asset('assets/img/user.png') }}" alt="">
                                <div class="small font-italic text-muted patient-name mb-4">{{ $payment_request->paidCompanies->company_name }}</div>
                                <hr>
                                <div class="row pb-2 pt-2">
                                    <div class="col-12 col-lg-6">
                                        <h4 class="mb-0 text-left"><b>{{ $payment_request->user->name }}</b></h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-9">
                        <div class="card">
                            <div class="card-body">
                                <form action="{{ route('paymentrequests.update',['id'=>$payment_request->id]) }}" method="POST">
                                    @csrf
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label for="expiryDate">Vade</label>
                                                    <input type="text" class="form-control" id="expiryDate" name="expiryDate" placeholder="Vade" value="{{ $payment_request->expiry_date }}">
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <label for="paymentAmount">Tutar</label>
                                                    <input type="text" class="form-control" id="paymentAmount" name="paymentAmount" placeholder="Tutar" value="{{ $payment_request->payment_amount }}">
                                                </div>
                                            </div>
                                            <div class="col-lg-2">
                                                <div class="form-group">
                                                    <label for="paymentCurrency">Para Birimi</label>
                                                    <select class="form-control" id="paymentCurrency" name="paymentCurrency">
                                                        <option value="{{ $payment_request->payment_amount_currency }}" selected>{{ $payment_request->payment_amount_currency }}</option>
                                                        <option value="EUR">EUR</option>
                                                        <option value="USD">USD</option>
                                                        <option value="GBP">GBP</option>
                                                        <option value="TL">TL</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label for="payCompanyId">Ödeyen Firma</label>
                                                    <select class="form-control" id="payCompanyId" name="payCompanyId" required>
                                                        <option value="{{ $payment_request->pay_company_id }}" selected>{{ $payment_request->payCompanies->name }}</option>
                                                        @foreach ($pay_companies as $pay_company)
                                                            <option value="{{ $pay_company->id }}">{{ $pay_company->name }}</option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label for="paidCompanyId">Ödenen Firma</label>
                                                    <select class="form-control" id="paidCompanyId" name="paidCompanyId" required>
                                                        <option value="{{ $payment_request->paid_company_id }}" selected>{{ $payment_request->paidCompanies->name }}</option>
                                                        @foreach ($paid_companies as $paid_company)
                                                            <option value="{{ $paid_company->id }}">{{ $paid_company->name }}</option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label for="invoiceDate">Fatura Tarihi</label>
                                                    <input type="text" class="form-control" id="invoiceDate" name="invoiceDate" placeholder="Fatura Tarihi" value="{{ $payment_request->invoice_date }}">
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label for="documentDate">Belge Tarihi</label>
                                                    <input type="text" class="form-control" id="documentDate" name="documentDate" placeholder="Belge Tarihi" value="{{ $payment_request->document_date }}">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label for="paymentTypeId">Ödeme Türleri</label>
                                                    <select class="form-control" id="paymentTypeId" name="paymentTypeId" required>
                                                        <option value="{{ $payment_request->payment_type_id }}" selected>{{ $payment_request->paymentType->name }}</option>
                                                        @foreach ($payment_types as $payment_type)
                                                            <option value="{{ $payment_type->id }}">{{ $payment_type->name }}</option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label for="categoryId">Ödeme Kategorisi</label>
                                                    <br>
                                                    <select class="form-control" id="categoryId" name="categoryId" required>
                                                        <option value="{{ $payment_request->payment_request_category_id }}" selected>{{ $payment_request->category->name }}</option>
                                                        @foreach ($payment_request_categories as $payment_request_category)
                                                            <option value="{{ $payment_request_category->id }}">{{ $payment_request_category->name }}</option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label for="documentNo">Belge No</label>
                                                    <input type="text" class="form-control" id="documentNo" name="documentNo" placeholder="Belge No" value="{{ $payment_request->document_no }}">
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label for="note">Açıklama</label>
                                                    <textarea class="form-control" id="note" name="note" placeholder="Açıklama" rows="3" cols="50">{{ $payment_request->note }}</textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <button type="button" class="btn btn-success mt-5 float-right" id="updatePaymentRequestModalBtn" data-toggle="modal" data-target="#postModal">@if($payment_request->payment_request_status_id == 1) Cevapla @elseif($payment_request->payment_request_status_id == 2) Güncelle @endif <i class="fa fa-check"></i></button>
                                        <button type="submit" class="btn btn-primary mt-5 float-right mr-2">Güncelle</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="postModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ödeme Talebini Cevapla</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container">
                    <div class="row">
                        <input type="hidden" id="payment_request_id" value="{{ $payment_request->id }}">
                        <div class="col-lg-12">
                            <label for="paymentRequestStatusId" style="width: 100%;">Ödeme Durumu</label>
                            <select class="form-control" id="paymentRequestStatusId">
                                <option value="{{ $payment_request->payment_request_status_id }}" selected>{{ $payment_request->status->name }}</option>
                                @if ($payment_request->payment_request_status_id != "")
                                    @foreach($payment_request_statuses as $payment_request_status)
                                        @if($payment_request_status->payment_request_status_id == $payment_request_status->id)
                                            <option value="{{ $payment_request_status->id}}" selected>{{ $payment_request_status->name }}</option>
                                        @endif
                                    @endforeach
                                @endif
                                @foreach($payment_request_statuses as $payment_request_status)
                                    <option value="{{ $payment_request_status->id }}">{{ $payment_request_status->name }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-lg-12 mt-3">
                            <label for="note">Not</label>
                            <textarea class="form-control" id="note" placeholder="Not">{{ $payment_request->answer_note }}</textarea>
                        </div>
                        <div class="col-lg-12 mt-3">
                            <button class="btn btn-success float-right" id="postRequest">Cevapla <i class="fa fa-arrow-right"></i></button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Kapat</button>
            </div>
        </div>
    </div>
</div>

@endsection
