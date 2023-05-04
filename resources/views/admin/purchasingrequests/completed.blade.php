@extends('layouts.app')

@section('content')

@include('layouts.navbar')

<div class="container-fluid">
    <div class="row">
        @include("layouts.head_box_purchasing")
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
                                <button class="btn btn-success mt-7 float-right" type="submit">Filtrele <i class="fa fa-check"></i></button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="card p-3 mt-3">
                <div class="card-title">
                    <div class="row">
                        <div class="col-md-6">
                            <h3>Tamamlanan Satın Alma Talepleri</h3>
                        </div>
                        <div class="col-md-6">
                            @can('satin alma talebini olustur')
                            <a href="{{ route('purchasingrequests.create') }}" class="btn btn-primary float-right"><i class="fa fa-plus" aria-hidden="true"></i> Yeni Talep Oluştur</a>
                            @endcan
                        </div>
                    </div>
                    <div class="row mt-3">
                    </div>
                </div>
                <div class="dt-responsive table-responsive">
                    <div class="card-body">
                        <table id="newTable" class="display" style="width:100%">
                            <thead>
                                <tr>
                                    <th>İşlem</th>
                                    <th>id</th>
                                    <th>Durum</th>
                                    <th>Ürün Başlığı</th>
                                    <th>Ürün Linki</th>
                                    <th>Oluşturulma Tarihi</th>
                                    <th>Oluşturan</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th style="display: table-column;">İşlem</th>
                                    <th>id</th>
                                    <th>Durum</th>
                                    <th>Ürün Başlığı</th>
                                    <th>Ürün Linki</th>
                                    <th>Oluşturulma Tarihi</th>
                                    <th>Oluşturan</th>
                                </tr>
                            </tfoot>
                            <tbody>
                                @foreach ($purchasing_requests as $purchasing_request)
                                    <tr role="row" class="odd">
                                        <td class="">
                                            <a href="{{ route('purchasingrequests.edit',['id'=>$purchasing_request->id]) }}" class="badge badge-danger">Cevapla <i class="fa fa-chevron-right icon-sm white" aria-hidden="true"></i></a>
                                        </td>
                                        <td>{{date('ymd', strtotime($purchasing_request->created_at)) . $purchasing_request->id}}</td>
                                        <td style="background-color: {{$purchasing_request->status->color}};color:white">{{$purchasing_request->status->name}}</td>
                                        <td>{{ $purchasing_request->product_title }}</td>
                                        <td>{{ $purchasing_request->product_url }}</td>
                                        <td>{{ date('Y-m-d', strtotime($purchasing_request->created_at))}}</td>
                                        <td>{{ $purchasing_request->user->name }}</td>
                                    </tr>
                                @endforeach

                              </tbody>

                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection
