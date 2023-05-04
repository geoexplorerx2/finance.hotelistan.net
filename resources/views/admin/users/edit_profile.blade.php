@extends('layouts.app')

@section('content')

@include('layouts.navbar')

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card p-4 mt-3">
                <div class="card-title">
                    <h2>Kullanıcıyı Güncelle</h2>
                </div>
                <form action="{{ route('users.update', ['id' => $user->id]) }}" method="POST">
                    @csrf
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="userName">Kullanıcı adı</label>
                                <input type="text" class="form-control" id="userName" name="userName" placeholder="Enter Username" value="{{ $user->name }}" required>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="userEmail">E-posta</label>
                                <input type="text" class="form-control" id="userEmail" name="userEmail" placeholder="Email" value="{{ $user->email }}" required>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="userPassword">Şifre</label>
                                <input type="password" class="form-control" id="userPassword" name="userPassword" placeholder="Change Password" value="">
                            </div>
                        </div>
                        <div class="d-none">
                            <label for="roles">Kullanıcı Rolleri</label>
                            {!! Form::select('roles[]', $roles,$userRole, array('class' => 'form-control','multiple')) !!}
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary mt-5 float-right">Güncelle <i class="fa fa-check" aria-hidden="true"></i></button>
                </form>
            </div>
        </div>
    </div>
</div>

@endsection
