@extends('layouts.app')

@section('content')

@include('layouts.navbar')

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <button class="btn btn-primary mt-3" onclick="previousPage();"><i class="fa fa-chevron-left"></i> Önceki Sayfa</button>
            <div class="card p-4 mt-3">
                <div class="card-title">
                    <p class="text-white tp-status" style="background-color: {{ $payment_request->status->color }};padding: 15px; border-radius: 10px;">Ödeme Talebi Durumu: <strong>{{ $payment_request->status->name }}</strong></p>
                    <nav class="nav nav-borders">
                        <a class="nav-link ms-0" href="{{route('paymentrequests.edit', ['id' => $payment_request->id]) }}"><i class="fa fa-user" style="margin-right:5px;"></i> Ödeme Talep Bilgileri</a>
                        <a class="nav-link active ms-0" href="{{route('paymentrequests.edit', ['id' => $payment_request->id,'page'=>'files']) }}"><i class="fa fa-file" style="margin-right:5px;"></i> Belgeler</a>
                    </nav>
                </div>
                <div class="row">
                    <div class="col-xl-3">
                        <div class="card mb-4 mb-xl-0">
                            <div class="card-header">Belgeler</div>
                            <div class="card-body text-center">
                                <img class="img-account-profile rounded-circle mb-2" src="{{ asset('assets/img/user.png') }}" alt="">
                                <div class="small font-italic text-muted patient-name mb-4">{{ $payment_request->companies->name }}</div>
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
                            <div class="card-header">
                                <p>Belgeler</p>
                                <button class="btn btn-primary float-right add-photo-btn" data-toggle="modal" data-target=""><i class="fa fa-plus"></i> Yeni Belge Yükle</button>
                            </div>
                            <div class="card-body">
                                <div class="col-lg-12">
                                    @foreach($payment_request->files as $data)
                                        <a href="{{ url('/files/'.$data->path) }}">
                                            <embed src="{{ asset('/files/'.$data->path) }}">
                                        </a>
                                    @endforeach
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
