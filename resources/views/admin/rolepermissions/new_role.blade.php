@extends('layouts.app')

@section('content')

@include('layouts.navbar')


<div class="content-wrapper">
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <button onclick="previousPage();" class="btn btn-primary mt-3"><i class="fa fa-angle-left" aria-hidden="true"></i> Önceki Sayfa</button>

                    <nav aria-label="breadcrumb" class="mt-3">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item home-page"><a href="{{ route('home') }}">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Roller</li>
                        </ol>
                    </nav>
                    <div class="card card-success">
                        <div class="card-header">
                            <div class="card-title">
                                <div class="row">
                                    <div class="col-md-6">
                                        <h2>Roller</h2>
                                    </div>
                                </div>
                            </div>
                            <h3 class="card-title">Rol Bilgileri</h3>
                        </div>
                        <form role="form" method="POST" action="{{ route('roles.store') }}">
                            {{ csrf_field() }}
                            <div class="card-body">
                                <div class="form-group">
                                    <label for="name">Rol Adı</label>
                                    <input type="text" class="form-control" id="name" name="name"
                                           placeholder="Örnek: Yönetici" autofocus required>
                                </div>

                                <div class="form-group">
                                    <label for="roleName">İzinler</label>
                                  <div class="row">
                                        @foreach($permissions as $value)
                                        <div class="col-lg-2">
                                        <label  class="form-group">{{ Form::checkbox('permission[]', $value->id, false, array('id' => 'name','class' => 'name'.$value->id)) }}
                                        {{ $value->name }}</label>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                            <div class="card-footer">
                                <button type="submit" class="btn btn-block bg-gradient-success btn-lg"><i
                                        class="far fa-save"></i> KAYDET
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
</div>
</div>
</section>
</div>
</div>




@endsection
