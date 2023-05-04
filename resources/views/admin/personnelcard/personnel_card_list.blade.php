@extends('layouts.app')

@section('content')

@include('layouts.navbar')

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12 table-responsive">
            <div class="card p-4 mt-3">
                <div class="content d-flex flex-column flex-column-fluid" id="kt_content">
                    <div class="subheader py-2 py-lg-4 subheader-transparent" id="kt_subheader">
                        <div class="container-fluid d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
                            <div class="d-flex align-items-center flex-wrap mr-2">
                                <h3 class="text-dark font-weight-bold mt-2 mb-2 mr-5">Personel Özlük Kartı</h3>
                            </div>
                            <div class="col-md-6">
                                @can('personel ozluk karti olustur')
                                    <a href="{{ route('personnelcard.create') }}" class="btn btn-primary float-right"><i class="fa fa-plus" aria-hidden="true"></i>Yeni Personel Ekle</a>
                                @endcan
                            </div>
                        </div>
                    </div>
                    <div class="card-body dt-responsive table-responsive">
                        <table id="newTable">
                                <thead>
                                    <tr>
                                        <th>İşlem</th>
                                        <th>Fotoğraf</th>
                                        <th>Ad Soyad</th>
                                        <th>Departman</th>
                                        <th>Görev</th>
                                        <th>Telefon Numarası</th>
                                        <th>E-mail</th>
                                        <th>Doğum Tarihi</th>
                                        <th>Başlangıç Tarihi</th>
                                        <th>Eğitim</th>
                                        <th>Banka Adı</th>
                                        <th>Banka İbanı</th>
                                        <th>Aylık Maaş</th>
                                        <th>Not</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th style="display: table-column;"></th>
                                        <th></th>
                                        <th>Ad Soyad</th>
                                        <th>Departman</th>
                                        <th>Görev</th>
                                        <th>Telefon Numarası</th>
                                        <th>E-mail</th>
                                        <th>Doğum Tarihi</th>
                                        <th>Başlangıç Tarihi</th>
                                        <th>Eğitim</th>
                                        <th>Banka Adı</th>
                                        <th>Banka İbanı</th>
                                        <th>Aylık Maaş</th>
                                        <th>Not</th>
                                    </tr>
                                </tfoot>
                                <tbody>
                                @foreach ($personnel_cards as $personnel_card)
                                <tr>

                                    <td>
                                        <div class="d-flex justify-content-center flex-shrink-0">
                                            @can('personel ozluk karti sil')
                                            <a href="{{ route('personnelcard.destroy', ['id' => $personnel_card->id]) }}" onclick="return confirm('Emin misiniz?');" class="btn btn-icon btn-bg-light btn-active-color-primary btn-sm" title="Sil">
                                                <span class="svg-icon svg-icon-3">
                                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path d="M5 9C5 8.44772 5.44772 8 6 8H18C18.5523 8 19 8.44772 19 9V18C19 19.6569 17.6569 21 16 21H8C6.34315 21 5 19.6569 5 18V9Z" fill="currentColor" />
                                                        <path opacity="0.5" d="M5 5C5 4.44772 5.44772 4 6 4H18C18.5523 4 19 4.44772 19 5V5C19 5.55228 18.5523 6 18 6H6C5.44772 6 5 5.55228 5 5V5Z" fill="currentColor" />
                                                        <path opacity="0.5" d="M9 4C9 3.44772 9.44772 3 10 3H14C14.5523 3 15 3.44772 15 4V4H9V4Z" fill="currentColor" />
                                                    </svg>
                                                </span>
                                            </a>
                                            @endcan
                                            @can('personel ozluk karti duzenle')
                                            <a href="{{ route('personnelcard.edit', ['id' => $personnel_card->id]) }}" class="btn btn-icon btn-bg-light btn-active-color-primary btn-sm me-1" title="Güncelle">
                                                <span class="svg-icon svg-icon-3">
                                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path opacity="0.3" d="M21.4 8.35303L19.241 10.511L13.485 4.755L15.643 2.59595C16.0248 2.21423 16.5426 1.99988 17.0825 1.99988C17.6224 1.99988 18.1402 2.21423 18.522 2.59595L21.4 5.474C21.7817 5.85581 21.9962 6.37355 21.9962 6.91345C21.9962 7.45335 21.7817 7.97122 21.4 8.35303ZM3.68699 21.932L9.88699 19.865L4.13099 14.109L2.06399 20.309C1.98815 20.5354 1.97703 20.7787 2.03189 21.0111C2.08674 21.2436 2.2054 21.4561 2.37449 21.6248C2.54359 21.7934 2.75641 21.9115 2.989 21.9658C3.22158 22.0201 3.4647 22.0084 3.69099 21.932H3.68699Z" fill="currentColor" />
                                                        <path d="M5.574 21.3L3.692 21.928C3.46591 22.0032 3.22334 22.0141 2.99144 21.9594C2.75954 21.9046 2.54744 21.7864 2.3789 21.6179C2.21036 21.4495 2.09202 21.2375 2.03711 21.0056C1.9822 20.7737 1.99289 20.5312 2.06799 20.3051L2.696 18.422L5.574 21.3ZM4.13499 14.105L9.891 19.861L19.245 10.507L13.489 4.75098L4.13499 14.105Z" fill="currentColor" />
                                                    </svg>
                                                </span>
                                            </a>
                                            @endcan
                                        </div>
                                    </td>
                                    <td style="text-align: center;">
                                        <div class="symbol symbol-40 symbol-sm flex-shrink-0">
                                            @if (sizeof($personnel_card->photos))

                                            @foreach($personnel_card->photos as $data)
                                            <a class="image-popup-vertical-fit" href="{{ url('/photos/'.$data->path) }}">
                                                <img src="{{ url('/photos/'.$data->path) }}" alt="{{ $personnel_card->name_surname }}">
                                            </a>
                                        @endforeach
                                        @else

                                        <a class="image-popup-vertical-fit" href="/photos/blank.png">
                                            <img src="/photos/blank.png" alt="{{ $personnel_card->name_surname }}">
                                        </a>
                                        @endif
                                        </div>
                                    </td>
                                    <td>{{ $personnel_card->name_surname }}</td>
                                    <td>{{ $personnel_card->department }}</td>
                                    <td>{{ $personnel_card->title }}</td>
                                    <td>{{ $personnel_card->phone }}</td>
                                    <td>{{ $personnel_card->email}}</td>
                                    <td>{{ date('d-m-Y', strtotime($personnel_card->birth_date)) }}</td>
                                    <td>{{ date('d-m-Y', strtotime($personnel_card->start_date))}}</td>
                                    <td>{{ $personnel_card->education }}</td>
                                    <td>{{ $personnel_card->bank_name }}</td>
                                    <td>{{ $personnel_card->bank_iban }}</td>
                                    <td>{{ $personnel_card->salary }}</td>
                                    <td>{{ $personnel_card->note }}</td>
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
