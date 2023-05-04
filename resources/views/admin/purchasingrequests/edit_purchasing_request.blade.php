@extends('layouts.app')

@section('content')

@include('layouts.navbar')

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <button class="btn btn-primary mt-3" onclick="previousPage();"><i class="fa fa-chevron-left"></i> Önceki Sayfa</button>
            <div class="card p-3 mt-3">
                <div class="card-title">
                    <p class="text-white tp-status" style="background-color: {{ $purchasing_request->status->color }};padding: 15px; border-radius: 10px;">Satın Alma Talebi Durumu: <strong>{{ $purchasing_request->status->name }}</strong></p>
                    <nav class="nav nav-borders">
                        <a class="nav-link active ms-0" href="{{ route('purchasingrequests.edit', ['id' => $purchasing_request->id]) }}"><i class="fa fa-user" style="margin-right:5px;"></i> Satın Alma Talep Bilgileri</a>
                        <a class="nav-link ms-0" href="{{route('purchasingrequests.edit', ['id' => $purchasing_request->id,'page'=>'files']) }}"><i class="fa fa-file" style="margin-right:5px;"></i> Belgeler</a>
                    </nav>
                </div>
                <div class="row">
                    <div class="col-xl-3">
                        <div class="card mb-4 mb-xl-0">
                            <div class="card-header">Firma Bilgileri</div>
                            <div class="card-body text-center">
                                <img class="img-account-profile rounded-circle mb-2" src="{{ asset('assets/img/user.png') }}" alt="">
                                <div class="small font-italic text-muted patient-name mb-4">{{ $purchasing_request->suppliers->supplier_name }}</div>
                                <hr>
                                <div class="row pb-2 pt-2">
                                    <div class="col-12 col-lg-6">
                                        <h4 class="mb-0 text-left"><b>{{ $purchasing_request->user->name }}</b></h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-9">
                        <div class="card">
                            <div class="card-body">
                                <form action="{{ route('purchasingrequests.update',['id'=>$purchasing_request->id]) }}" method="POST">
                                    @csrf
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label for="productTitle">Ürün Başlığı</label>
                                                    <input type="text" class="form-control" id="productTitle" name="productTitle" placeholder="Ürün Linki" value="{{ $purchasing_request->product_title }}">
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label for="productUrl">Ürün Linki</label>
                                                    <input type="text" class="form-control" id="productUrl" name="productUrl" placeholder="Ürün Linki" value="{{ $purchasing_request->product_url }}">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label for="note">Açıklama</label>
                                                    <textarea class="form-control" id="note" name="note" placeholder="Açıklama" rows="3" cols="50">{{ $purchasing_request->note }}</textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <button type="button" class="btn btn-success mt-5 float-right" id="updatePaymentRequestModalBtn" data-toggle="modal" data-target="#purchasingPostModal">@if($purchasing_request->purchasing_request_status_id == 1) Cevapla @elseif($purchasing_request->purchasing_request_status_id == 2) Güncelle @endif <i class="fa fa-check"></i></button>
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

<div class="modal fade" id="purchasingPostModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                        <input type="hidden" id="purchasing_request_id" value="{{ $purchasing_request->id }}">
                        <div class="col-lg-12">
                            <label for="purchasingRequestStatusId" style="width: 100%;">Satın Alma Durumu</label>
                            <select class="form-control" id="purchasingRequestStatusId">
                                <option value="{{ $purchasing_request->purchasing_request_status_id}}" selected>{{ $purchasing_request->status->name}}</option>
                                @foreach($purchasing_request_statuses as $purchasing_request_status)
                                    <option value="{{ $purchasing_request_status->id }}">{{ $purchasing_request_status->name }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-lg-12 mt-3">
                            <label for="note">Not</label>
                            <textarea class="form-control" id="note" placeholder="Not">{{ $purchasing_request->note }}</textarea>
                        </div>
                        <div class="col-lg-12 mt-3">
                            <button class="btn btn-success float-right" id="purchasingPostRequest">Cevapla <i class="fa fa-arrow-right"></i></button>
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
