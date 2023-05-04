@extends('layouts.app')

@section('content')

@include('layouts.navbar')

<div class="container-fluid">
    <div class="row">
        @if(auth()->user()->hasRole('Sales Person'))
        @else
        <div class="col-lg-6">
            <a href="{{ url('/doctor/requested') }}">
                <div class="info-box mt-3 {{ request()->is('doctor/requested') ? 'info-box bg-danger' : 'info-box' }}">
                    <span class="info-box-icon bg-danger"><i class="fa fa-clock-o"></i></span>
                    <div class="info-box-content"><span class="info-box-text {{ request()->is('doctor/requested') ? 'text-white' : '' }}">Cevaplanmayan Tüm Tedavi Planları</span></div>
                </div>
            </a>
        </div>
        @endif
        <div class="col-lg-6">
            <a href="{{ url('/doctor/completed') }}">
                <div class="info-box mt-3 {{ request()->is('doctor/completed') ? 'info-box bg-success text-white' : 'info-box' }}">
                    <span class="info-box-icon bg-success"><i class="fa fa-check"></i></span>
                    <div class="info-box-content"><span class="info-box-text {{ request()->is('doctor/completed') ? 'text-white' : '' }}">Cevaplanan Tüm Tedavi Planları</span></div>
                </div>
            </a>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 table-responsive">
            <div class="card p-4 mt-3">
                <div class="card-title">
                    <h2>Cevaplanmayan Tüm Tedavi Planları </h2>
                    <hr>
                </div>
                <div class="dt-responsive table-responsive">
                    {!! $html->table() !!}
               </div>
            </div>
        </div>
    </div>
</div>


@endsection
@section('footer')
{!! $html->scripts() !!}

@endsection