@extends('layouts.app')

@section('content')

@include('layouts.navbar')

<div class="container-fluid">
    <div class="row">
        @include("layouts.head_box")
    </div>
    <div class="row">
        <div class="col-md-12 table-responsive">
            <div class="card mt-3">
                <div class="card-body">
                    <form action="" method="GET">
                        <div class="row pb-3">
                            <div class="col-lg-4">
                                <label for="startDate">Başlangıç Tarihi</label>
                                <input type="text" class="form-control datepicker" id="startDate" name="startDate" placeholder="Başlangıç Tarihi" value="{{ $start }}" autocomplete="off" required>
                            </div>
                            <div class="col-lg-4">
                                <label for="endDate">Bitiş Tarihi</label>
                                <input type="text" class="form-control datepicker" id="endDate" name="endDate" placeholder="Bitiş Tarihi" autocomplete="off" value="{{ $end }}" required>
                            </div>
                            <div class="col-lg-4">
                                <label for="endDate">Firma</label>
                                <select name="companyId" class="form-control" id="companyId">
                                    <option></option>
                                    @foreach($companies as $company)
                                    <option value="{{ $company->id }}">{{ $company->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-lg-12">
                                <button class="btn btn-success mt-3 float-right" type="submit">Filtrele <i class="fa fa-check"></i></button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="card p-4 mt-3">
                <div class="card-title">
                    <div class="row">
                        <div class="col-md-6">
                            <h3>Ödenen Ödeme Talepleri</h3>
                        </div>
                        <div class="col-md-6">
                            @can('ödeme talebi oluştur')
                            <a href="{{ route('paymentrequests.create') }}" class="btn btn-primary float-right"><i class="fa fa-plus" aria-hidden="true"></i> Yeni Talep Oluştur</a>
                            @endcan
                        </div>
                    </div>
                </div>
                <div class="dt-responsive table-responsive">
                    <table id="newTable" class="display" style="width:100%">
                        <thead>
                            <tr>
                                <th>id</th>
                                <th>Durum</th>
                                <th>Kategori</th>
                                <th>Ödeyen Firma Adı</th>
                                <th>Ödenen Firma Adı</th>
                                <th>Vade</th>
                                <th>Tutar</th>
                                <th>Belge No</th>
                                <th>Belge Tarihi</th>
                                <th>Fatura Tarihi</th>
                                <th>Açıklama</th>
                                <th>Oluşturan</th>
                                <th>İşlem</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th style="display: table-column;">İşlem</th>
                                <th>id</th>
                                <th>Durum</th>
                                <th>Kategori</th>
                                <th>Ödeyen Firma Adı</th>
                                <th>Ödenen Firma Adı</th>
                                <th>Vade</th>
                                <th>Tutar</th>
                                <th>Belge No</th>
                                <th>Belge Tarihi</th>
                                <th>Fatura Tarihi</th>
                                <th>Açıklama</th>
                                <th>Oluşturan</th>
                            </tr>
                        </tfoot>
                        <tbody>
                            @foreach ( $payment_requests as $payment_request )
                                <tr role="row" class="odd">
                                    <td class="">
                                        <a href="/paymentrequests/edit/{{$payment_request->id}}" class="badge badge-danger">Cevapla <i class="fa fa-chevron-right icon-sm white" aria-hidden="true"></i></a>
                                    </td>
                                    <td>{{date('ymd', strtotime($payment_request->created_at)) . $payment_request->id}}</td>
                                    <td style="background-color: {{$payment_request->status->color}};color:white">{{$payment_request->status->name}}</td>
                                    <td style="background-color: {{$payment_request->category->color}};color:white">{{$payment_request->category->name}}</td>
                                    <td>{{ $payment_request->payCompanies->name }}</td>
                                    <td>{{ $payment_request->paidCompanies->name }}</td>
                                    <td>{{date('d-m-Y', strtotime($payment_request->expiry_date))}}</td>
                                    <td>{{number_format($payment_request->payment_amount, 2)}} {{$payment_request->payment_amount_currency}}</td>
                                    <td>{{$payment_request->document_no}}</td>
                                    <td>{{date('d-m-Y', strtotime($payment_request->document_date))}}</td>
                                    <td>{{date('d-m-Y', strtotime($payment_request->invoice_date))}}</td>
                                    <td>{{$payment_request->note}}</td>
                                    <td>{{$payment_request->user->name}}</td>
                                </tr>
                            @endforeach

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection
