@extends('layouts.app')

@section('content')

@include('layouts.navbar')
<div class="d-flex flex-column-fluid">
    <div class="container-fluid">
    <div class="card card-custom">
            <div class="card-body p-0">
                <div class="wizard wizard-4" id="wizard2" data-wizard-state="step-first" data-wizard-clickable="true">
                    <div class="wizard-nav">
                        <div class="wizard-steps">
                            <div class="wizard-step" data-wizard-type="step" data-wizard-state="current">
                                <div class="wizard-wrapper">
                                    <div class="wizard-number">1</div>
                                    <div class="wizard-label">
                                        <div class="wizard-title">Yeni Personel Ekle</div>
                                        <div class="wizard-desc">Personel Detaylarını Belirleyin</div>
                                    </div>
                                </div>
                            </div>
                            <div class="wizard-step" data-wizard-type="step">
                                <div class="wizard-wrapper">
                                    <div class="wizard-number">2</div>
                                    <div class="wizard-label">
                                        <div class="wizard-title">Personel Özeti</div>
                                        <div class="wizard-desc">İncele ve Gönder</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card card-custom card-shadowless rounded-top-0">
                        <div class="card-body p-0">
                            <div class="row justify-content-center py-8 px-8 py-lg-15 px-lg-10">
                                <div class="col-xl-12 col-xxl-10">
                                        <div class="row justify-content-center">
                                            <div class="col-xl-9">
                                                <div class="my-5 step" data-wizard-type="step-content" data-wizard-state="current" id="step1">
                                                    <h5 class="text-dark font-weight-bold mb-10">Personel Bilgileri:</h5>
                                                    <div class="form-group row">
                                                        <label class="col-xl-3 col-lg-3 col-form-label text-left">Fotoğraf</label>
                                                        <div class="col-lg-3 col-xl-3">
                                                            <form method="post" action="{{ url('personnelcard/photos/store') }}" enctype="multipart/form-data" class="dropzone" id="dropzone">
                                                                @csrf
                                                                <input type="hidden" name="personnelCardId" id="prId">
                                                                <div class="dz-message needsclick">
                                                                    <i class="fas fa-user fa-5x pull-r"></i>
                                                                    <br>
                                                                </div>
                                                            </form>
                                                            <span class="form-text text-muted">Fotoğraf buraya sürükleyip bırakın veya yüklemek için tıklayın.</span>
                                                        </div>

                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-xl-3 col-lg-3 col-form-label">Ad Soyad</label>
                                                        <div class="col-lg-9 col-xl-9">
                                                            <input class="form-control form-control-solid form-control-lg" name="nameSurname" id="nameSurname" type="text" placeholder="Ad Soyad" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-xl-3 col-lg-3 col-form-label">Departman</label>
                                                        <div class="col-lg-9 col-xl-9">
                                                            <input class="form-control form-control-solid form-control-lg" name="department" id="department" type="text" placeholder="Departman" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-xl-3 col-lg-3 col-form-label">Görev</label>
                                                        <div class="col-lg-9 col-xl-9">
                                                            <input class="form-control form-control-solid form-control-lg" name="title" id="title" type="text" placeholder="Görev" />
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
                                                                <input type="text" class="form-control form-control-solid form-control-lg" name="phone" id="phone" value="" placeholder="Telefon Numarası" />
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
                                                                <input type="text" class="form-control form-control-solid form-control-lg" name="email" id="email" placeholder="E-mail" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-xl-3 col-lg-3 col-form-label">Doğum Tarihi</label>
                                                        <div class="col-lg-9 col-xl-9">
                                                            <div class="input-group input-group-solid input-group-lg">
                                                                <input type="text" class="form-control form-control-solid form-control-lg" name="birthDate" id="birthDate" placeholder="Doğum Tarihi" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-xl-3 col-lg-3 col-form-label">Başlangıç Tarihi</label>
                                                        <div class="col-lg-9 col-xl-9">
                                                            <div class="input-group input-group-solid input-group-lg">
                                                                <input type="text" class="form-control form-control-solid form-control-lg" name="start_date" id="start_date" placeholder="Başlangıç Tarihi"  />
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-xl-3 col-lg-3 col-form-label">Eğitim</label>
                                                        <div class="col-lg-9 col-xl-9">
                                                            <div class="input-group input-group-solid input-group-lg">
                                                                <input type="text" class="form-control form-control-solid form-control-lg" name="education" id="education" placeholder="Eğitim"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-xl-3 col-lg-3 col-form-label">Banka Adı</label>
                                                        <div class="col-lg-9 col-xl-9">
                                                            <div class="input-group input-group-solid input-group-lg">
                                                                <input type="text" class="form-control form-control-solid form-control-lg" name="bankName" id="bankName" placeholder="Banka Adı"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-xl-3 col-lg-3 col-form-label">Banka İbanı</label>
                                                        <div class="col-lg-9 col-xl-9">
                                                            <div class="input-group input-group-solid input-group-lg">
                                                                <input type="text" class="form-control form-control-solid form-control-lg" name="bankIban" id="bankIban" placeholder="Banka İbanı"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-xl-3 col-lg-3 col-form-label">Aylık Maaş</label>
                                                        <div class="col-lg-9 col-xl-9">
                                                            <div class="input-group input-group-solid input-group-lg">
                                                                <input type="text" class="form-control form-control-solid form-control-lg" name="salary" id="salary" placeholder="Aylık Maaş"/>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">
                                                        <label class="col-xl-3 col-lg-3 col-form-label">Not</label>
                                                        <div class="col-lg-9 col-xl-9">
                                                            <div class="input-group input-group-solid input-group-lg">
                                                                <textarea class="form-control form-control-solid form-control-lg" name="note" id="note" placeholder="Not" rows="3" cols="50"></textarea>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="my-5 step" data-wizard-type="step-content"  id="step2">
                                                    <h5 class="mb-10 font-weight-bold text-dark">Personel Özlük Kartı Özeti</h5>
                                                    <div class="border-bottom mb-5 pb-5">
                                                        <div class="font-weight-bolder mb-3">Ad Soyadı:</div>
                                                        <div class="name-surname"></div>
                                                    </div>
                                                    <div class="border-bottom mb-5 pb-5">
                                                        <div class="font-weight-bolder mb-3">Departman:</div>
                                                        <div class="department"></div>
                                                    </div>
                                                    <div class="border-bottom mb-5 pb-5">
                                                        <div class="font-weight-bolder mb-3">Görev:</div>
                                                        <div class="title"></div>
                                                    </div>
                                                    <div class="border-bottom mb-5 pb-5">
                                                        <div class="font-weight-bolder mb-3">Telefon Numarası:</div>
                                                        <div class="phone-number"></div>
                                                    </div>
                                                    <div class="border-bottom mb-5 pb-5">
                                                        <div class="font-weight-bolder mb-3">E-mail:</div>
                                                        <div class="email"></div>
                                                    </div>
                                                    <div class="border-bottom mb-5 pb-5">
                                                        <div class="font-weight-bolder mb-3">Doğum Tarihi:</div>
                                                        <div class="birth-date"></div>
                                                    </div>
                                                    <div class="border-bottom mb-5 pb-5">
                                                        <div class="font-weight-bolder mb-3">Başlangıç Tarihi:</div>
                                                        <div class="start-date"></div>
                                                    </div>
                                                    <div class="border-bottom mb-5 pb-5">
                                                        <div class="font-weight-bolder mb-3">Eğitim:</div>
                                                        <div class="education"></div>
                                                    </div>
                                                    <div class="border-bottom mb-5 pb-5">
                                                        <div class="font-weight-bolder mb-3">Banka Adı:</div>
                                                        <div class="bank-name"></div>
                                                    </div>
                                                    <div class="border-bottom mb-5 pb-5">
                                                        <div class="font-weight-bolder mb-3">Banka İbanı:</div>
                                                        <div class="bank-iban"></div>
                                                    </div>
                                                    <div class="border-bottom mb-5 pb-5">
                                                        <div class="font-weight-bolder mb-3">Aylık Maaş:</div>
                                                        <div class="salary"></div>
                                                    </div>
                                                        <div class="font-weight-bolder mb-3">Not:</div>
                                                        <div class="description"></div>
                                                </div>
                                                <div class="d-flex justify-content-between border-top pt-10 mt-15">
                                                    <div class="mr-2">
                                                        <button type="button" id="prev-step" class="btn btn-light-primary font-weight-bolder px-9 py-4" data-wizard-type="action-prev">Önceki</button>
                                                    </div>
                                                    <div>
                                                        <button type="button" id="completePersonnelCard" class="btn btn-success font-weight-bolder px-9 py-4" data-wizard-type="action-submit">Tamamla</button>
                                                        <button type="button" id="savePersonnelCardBtn" class="btn btn-primary font-weight-bolder px-9 py-4" data-wizard-type="action-next">İleri <i class="fa fa-arrow-right"></i></button>
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
</div>
@endsection
