@extends('layouts.app')

@section('content')

@include('layouts.navbar')

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <button class="btn btn-primary mt-3" onclick="previousPage();"><i class="fa fa-chevron-left" aria-hidden="true"></i> Önceki Sayfa</button>
            <div class="card p-7 mt-3">
                <div class="card-title">
                    <h2>Ödeme Talebi Durumunu Güncelle</h2>
                </div>
                <form action="{{ route('paymentrequeststatus.update', ['id' => $payment_request_statuses->id]) }}" method="POST">
                    @csrf
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="status_name">Ödeme Talebi Durumu Adı</label>
                                <input type="text" class="form-control" id="status_name" name="status_name" placeholder="Ödeme Talebi Durumu Adı" value="{{ $payment_request_statuses->name }}" required>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="status_color">Ödeme Talebi Durumu Rengi</label>
                                <input type="text" class="form-control" id="status_color" data-jscolor="{}" name="status_color" placeholder="Ödeme Talebi Durumu Rengi" value="{{ $payment_request_statuses->color }}" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="note">Açıklama</label>
                                <textarea class="form-control" name="note" id="note" placeholder="Açıklama" rows="3" cols="50">{{ $payment_request_statuses->note }}</textarea>
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary mt-5 float-right">Güncelle <i class="fa fa-check" aria-hidden="true"></i></button>
                </form>
            </div>
        </div>
    </div>
</div>

@endsection
