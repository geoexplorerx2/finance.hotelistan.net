@extends('layouts.app')

@section('content')

@include('layouts.navbar')

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <button class="btn btn-primary mt-3" onclick="previousPage();"><i class="fa fa-chevron-left" aria-hidden="true"></i> Önceki Sayfa</button>
            <div class="card p-4 mt-3">
                <div class="card-title">
                    <h2>Ödeme Talebi Kategorisini Güncelle</h2>
                </div>
                <form action="{{ route('paymentrequestcategory.update', ['id' => $payment_request_categories->id]) }}" method="POST">
                    @csrf
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="category_name">Ödeme Talebi Kategorisi Adı</label>
                                <input type="text" class="form-control" id="category_name" name="category_name" placeholder="Ödeme Talebi Kategorisi Adı" value="{{ $payment_request_categories->name }}" required>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="category_color">Ödeme Talebi Kategorisi Rengi</label>
                                <input type="text" class="form-control" id="category_color" data-jscolor="{}" name="category_color" placeholder="Ödeme Talebi Kategorisi Rengi" value="{{ $payment_request_categories->color }}" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="note">Açıklama</label>
                                <textarea class="form-control" name="note" id="note" placeholder="Açıklama" rows="3" cols="50">{{ $payment_request_categories->note }}</textarea>
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
