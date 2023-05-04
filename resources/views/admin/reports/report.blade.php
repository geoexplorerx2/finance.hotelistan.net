@extends('layouts.app')

@section('content')

@include('layouts.navbar')

<div class="container-fluid">
    <div class="row">
        <div class="col-lg-4">
            <a href="{{ url('/definitions/reports') }}">
                <div class="info-box mt-3 {{ request()->is('definitions/reports') ? 'info-box bg-primary' : 'info-box' }}" id="todayBox">
                    <span class="info-box-icon bg-primary"><i class="fa fa-calendar"></i></span>
                    <div class="info-box-content"><span class="info-box-text {{ request()->is('definitions/reports') ? 'text-white' : '' }}">All Day</span></div>
                </div>
            </a>
        </div>
        <div class="col-lg-4">
            <a href="{{ url('/definitions/reports?W=1') }}">
                <div class="info-box mt-3 {{ request()->is('definitions/reports?W=1') ? 'info-box bg-primary text-white' : 'info-box' }}" id="todayBox">
                    <span class="info-box-icon bg-primary"><i class="fa fa-calendar-plus-o"></i></span>
                    <div class="info-box-content"><span class="info-box-text {{ request()->is('definitions/reports?W=1') ? 'text-white' : '' }}">Current Week</span></div>
                </div>
            </a>
        </div>
        <div class="col-lg-4">
            <a href="{{ url('/definitions/reports?M=1') }}">
                <div class="info-box mt-3 {{ request()->is('definitions/reports?M=1') ? 'info-box bg-primary text-white' : 'info-box' }}" id="todayBox">
                    <span class="info-box-icon bg-primary"><i class="fa fa-calendar-check-o"></i></span>
                    <div class="info-box-content"><span class="info-box-text {{ request()->is('definitions/reports?M=1') ? 'text-white' : '' }}">Current Month</span></div>
                </div>
            </a>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 table-responsive">
            <nav aria-label="breadcrumb" class="mt-3">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item home-page"><a href="{{ url('/home') }}">Arayüz</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Genel Özet</li>
                </ol>
            </nav>
            <div class="card p-4 mt-3">
                <div class="content d-flex flex-column flex-column-fluid" id="kt_content">
                    <div class="subheader py-2 py-lg-4 subheader-transparent" id="kt_subheader">
                        <div class="container-fluid d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
                            <div class="d-flex align-items-center flex-wrap mr-2">
                                <h3 class="text-dark font-weight-bold mt-2 mb-2 mr-5">Genel Özet</h3>
                            </div>
                        </div>
                    </div>
                    <div class="card-body dt-responsive table-responsive">
                        <table  id="newTable">
                            <thead>
                                <tr>
                                    <th>Kullanıcı</th>
                                    <th>Ödeme Talep Sayısı</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>Kullanıcı</th>
                                    <th>Ödeme Talep Sayısı</th>
                                </tr>
                            </tfoot>
                            @foreach($data as $user)
                            <tr>
                                <td>{{ $user->name }}</td>
                                <td>{{ $user->aCount }}</td>
                            </tr>
                            @endforeach
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection
