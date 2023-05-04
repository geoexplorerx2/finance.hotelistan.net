@extends('layouts.app')

@section('content')
@include('layouts.navbar')
<div class="d-flex flex-column-fluid">
    <div class="container-fluid">
    <div class="card card-custom">
            <div class="card-body p-0">
                <button class="btn btn-warning mt-3 mr-5" onclick="previousPage();"><i class="fa fa-chevron-left"></i> Önceki Sayfa</button>
                <div class="subheader py-2 py-lg-4 subheader-transparent">
                    <div class="container-fluid d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
                        <div class="d-flex align-items-center flex-wrap">
                            <h3 class="text-dark font-weight-bold mt-2 mb-2 mr-5">Personel Özlük Kartı Güncellemesi</h3>
                        </div>
                    </div>
                </div>
                <div class="wizard wizard-4" data-wizard-state="step-first" data-wizard-clickable="true">
                    <div class="card card-custom card-shadowless rounded-top-0">
                        <div class="card-body p-0">
                            <div class="row justify-content-center py-8 px-8 py-lg-5 px-lg-10">
                                <div class="col-xl-12 col-xxl-10">
                                        <div class="row justify-content-center">
                                            <div class="col-xl-9">
                                                <div class="my-5 step" data-wizard-type="step-content" data-wizard-state="current" id="step1">
                                                    <h5 class="text-dark font-weight-bold mb-10">Personel Bilgileri:</h5>
                                                    <div class="form-group row">
                                                        <label class="col-xl-3 col-lg-3 col-form-label text-left">Fotoğraf</label>
                                                        <div class="col-lg-3 col-xl-4" id="img-relative">
                                                            @if ($personnel_photo != '')
                                                                <form action="{{ route('personnelphoto.update') }}" method="POST" enctype="multipart/form-data" id="picUploadForm" target="uploadTarget">
                                                                    @csrf
                                                                    <a class="image-popup-vertical-fit" href="{{ url('/photos/'.$personnel_photo->path) }}">
                                                                        <img src="{{ url('/photos/'.$personnel_photo->path) }}" alt="{{ $personnel_card->name_surname }}" style=" max-width: 150px;">
                                                                    </a>
                                                                    <input type="hidden" name="name" value="{{$personnel_photo->name}}">
                                                                    <input type="hidden" name="id" value="{{$personnel_card->id}}">
                                                                    <input type="file" name="file" id="file">
                                                                    <button type="submit" class="btn btn-primary mt-5 mr-2">update</button>
                                                                </form>

                                                                @else
                                                                <form action="{{ url('personnelcard/photos/newstore') }}" method="POST" enctype="multipart/form-data">
                                                                    @csrf
                                                                    <a class="image-popup-vertical-fit" href="/photos/blank.png">
                                                                        <img src="/photos/blank.png" alt="{{ $personnel_card->name_surname }}" style=" max-width: 150px;">
                                                                    </a>
                                                                    <input type="hidden" name="personnelCardId" value="{{$personnel_card->id}}">
                                                                    <input type="file" class="mt-3" name="file" id="file">
                                                                    <button type="submit" class="btn btn-warning mt-5 mr-2">Fotoğrafı Yükle</button>
                                                                </form>
                                                            @endif
                                                        </div>
                                                    </div>

                                                    <form action="{{ route('personnelcard.update',['id'=>$personnel_card->id]) }}" method="POST">
                                                        @csrf
                                                        <div class="form-group row">
                                                            <label class="col-xl-3 col-lg-3 col-form-label">Ad Soyad</label>
                                                            <div class="col-lg-9 col-xl-9">
                                                                <input class="form-control form-control-solid form-control-lg" name="nameSurname" id="nameSurname" type="text" placeholder="Ad Soyad" value="{{ $personnel_card->name_surname }}" />
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-xl-3 col-lg-3 col-form-label">Departman</label>
                                                            <div class="col-lg-9 col-xl-9">
                                                                <input class="form-control form-control-solid form-control-lg" name="department" id="department" type="text" placeholder="Departman" value="{{ $personnel_card->department }}"/>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-xl-3 col-lg-3 col-form-label">Görev</label>
                                                            <div class="col-lg-9 col-xl-9">
                                                                <input class="form-control form-control-solid form-control-lg" name="title" id="title" type="text" placeholder="Görev" value="{{ $personnel_card->title }}"/>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-xl-3 col-lg-3 col-form-label">Telefon Numarası</label>
                                                            <div class="col-lg-9 col-xl-9">
                                                                <div class="input-group input-group-solid input-group-lg">
                                                                    <div class="input-group-prepend">
                                                                        <span class="input-group-text">
                                                                            <i class="la la-phone"></i>
                                                                        </span>
                                                                    </div>
                                                                    <input type="text" class="form-control form-control-solid form-control-lg" name="phone" id="phone" placeholder="Telefon Numarası" value="{{ $personnel_card->phone }}"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-xl-3 col-lg-3 col-form-label">E-mail</label>
                                                            <div class="col-lg-9 col-xl-9">
                                                                <div class="input-group input-group-solid input-group-lg">
                                                                    <div class="input-group-prepend">
                                                                        <span class="input-group-text">
                                                                            <i class="la la-at"></i>
                                                                        </span>
                                                                    </div>
                                                                    <input type="text" class="form-control form-control-solid form-control-lg" name="email" id="email" placeholder="E-mail" value="{{ $personnel_card->email}}"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-xl-3 col-lg-3 col-form-label">Doğum Tarihi</label>
                                                            <div class="col-lg-9 col-xl-9">
                                                                <div class="input-group input-group-solid input-group-lg">
                                                                    <input type="text" class="form-control form-control-solid form-control-lg" name="birthDate" id="birthDate" placeholder="Doğum Tarihi" value="{{ $personnel_card->birth_date }}"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-xl-3 col-lg-3 col-form-label">Başlangıç Tarihi</label>
                                                            <div class="col-lg-9 col-xl-9">
                                                                <div class="input-group input-group-solid input-group-lg">
                                                                    <input type="text" class="form-control form-control-solid form-control-lg" name="start_date" id="start_date" placeholder="Başlangıç Tarihi"  value="{{ $personnel_card->start_date}}"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-xl-3 col-lg-3 col-form-label">Eğitim</label>
                                                            <div class="col-lg-9 col-xl-9">
                                                                <div class="input-group input-group-solid input-group-lg">
                                                                    <input type="text" class="form-control form-control-solid form-control-lg" name="education" id="education" placeholder="Eğitim" value="{{ $personnel_card->education }}"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-xl-3 col-lg-3 col-form-label">Banka Adı</label>
                                                            <div class="col-lg-9 col-xl-9">
                                                                <div class="input-group input-group-solid input-group-lg">
                                                                    <input type="text" class="form-control form-control-solid form-control-lg" name="bankName" id="bankName" placeholder="Banka Adı" value="{{ $personnel_card->bank_name }}"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-xl-3 col-lg-3 col-form-label">Banka İbanı</label>
                                                            <div class="col-lg-9 col-xl-9">
                                                                <div class="input-group input-group-solid input-group-lg">
                                                                    <input type="text" class="form-control form-control-solid form-control-lg" name="bankIban" id="bankIban" placeholder="Banka İbanı" value="{{ $personnel_card->bank_iban }}"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-xl-3 col-lg-3 col-form-label">Aylık Maaş</label>
                                                            <div class="col-lg-9 col-xl-9">
                                                                <div class="input-group input-group-solid input-group-lg">
                                                                    <input type="text" class="form-control form-control-solid form-control-lg" name="salary" id="salary" placeholder="Aylık Maaş" value="{{ $personnel_card->salary }}"/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label class="col-xl-3 col-lg-3 col-form-label">Not</label>
                                                            <div class="col-lg-9 col-xl-9">
                                                                <div class="input-group input-group-solid input-group-lg">
                                                                    <textarea class="form-control form-control-solid form-control-lg" name="note" id="note" placeholder="Not" rows="3" cols="50">{{ $personnel_card->note }}</textarea>

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <button type="submit" class="btn btn-warning float-right font-weight-bolder px-9 py-4"><i class="fa fa-edit"></i> Güncelle</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
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
