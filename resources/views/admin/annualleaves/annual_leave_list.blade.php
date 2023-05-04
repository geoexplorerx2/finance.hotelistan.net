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
									<h3 class="text-dark font-weight-bold mt-2 mb-2 mr-5">Yıllık İzin Takip</h3>
								</div>
								<div class="d-flex align-items-center">
                                    @can('yillik izin takip olustur')
                                    <button data-toggle="modal" data-target="#annualLeaveModal" class="btn btn-primary float-right"><i class="fa fa-plus" aria-hidden="true"></i> Yeni Yıllık İzin Ekle</button>
                                    @endcan
								</div>
							</div>
						</div>
                        <div class="card-body">
                            <table id="newTable" class="display" style="width:100%">
                                <thead>
                                    <tr>
                                        <th>Personel Ad Soyad</th>
                                        <th>Başlangıç ​​Tarihi</th>
                                        <th>Bitiş Tarihi</th>
                                        <th>Yıllık İzin Türü</th>
                                        <th>Açıklama</th>
                                        <th>İşlem</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>Personel Ad Soyad</th>
                                        <th>Başlangıç ​​Tarihi</th>
                                        <th>Bitiş Tarihi</th>
                                        <th>Yıllık İzin Türü</th>
                                        <th>Açıklama</th>
                                    </tr>
                                </tfoot>
                                <tbody>
                                    @foreach ( $annual_leaves as $annual_leave )
                                        <tr role="row" class="odd">
                                            <td>{{ $annual_leave->personnelCard->name_surname }}</td>
                                            <td>{{ date('d-m-Y', strtotime($annual_leave->start_date)) }}</td>
                                            <td>{{ date('d-m-Y', strtotime($annual_leave->end_date)) }}</td>
                                            <td>{{ $annual_leave->annualLeaveType->name }}</td>
                                            <td>{{ $annual_leave->note }}</td>
                                            <td>
                                                <div class="d-flex justify-content-center flex-shrink-0">
                                                    @can('yillik izin takip duzenle')
                                                        <a href="{{ route('annualleaves.edit', ['id' => $annual_leave->id]) }}" class="btn btn-icon btn-bg-light btn-active-color-primary btn-sm me-1 inline-popups" title="Güncelle">
                                                            <span class="svg-icon svg-icon-3">
                                                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                                    <path opacity="0.3" d="M21.4 8.35303L19.241 10.511L13.485 4.755L15.643 2.59595C16.0248 2.21423 16.5426 1.99988 17.0825 1.99988C17.6224 1.99988 18.1402 2.21423 18.522 2.59595L21.4 5.474C21.7817 5.85581 21.9962 6.37355 21.9962 6.91345C21.9962 7.45335 21.7817 7.97122 21.4 8.35303ZM3.68699 21.932L9.88699 19.865L4.13099 14.109L2.06399 20.309C1.98815 20.5354 1.97703 20.7787 2.03189 21.0111C2.08674 21.2436 2.2054 21.4561 2.37449 21.6248C2.54359 21.7934 2.75641 21.9115 2.989 21.9658C3.22158 22.0201 3.4647 22.0084 3.69099 21.932H3.68699Z" fill="currentColor" />
                                                                    <path d="M5.574 21.3L3.692 21.928C3.46591 22.0032 3.22334 22.0141 2.99144 21.9594C2.75954 21.9046 2.54744 21.7864 2.3789 21.6179C2.21036 21.4495 2.09202 21.2375 2.03711 21.0056C1.9822 20.7737 1.99289 20.5312 2.06799 20.3051L2.696 18.422L5.574 21.3ZM4.13499 14.105L9.891 19.861L19.245 10.507L13.489 4.75098L4.13499 14.105Z" fill="currentColor" />
                                                                </svg>
                                                            </span>
                                                        </a>
                                                    @endcan
                                                    @can('yillik izin takip sil')
                                                        <a href="{{ route('annualleaves.destroy', ['id' => $annual_leave->id]) }}" onclick="return confirm('Silmek İstediğinize Emin misiniz?');" class="btn btn-icon btn-bg-light btn-active-color-primary btn-sm" title="Sil">
                                                            <span class="svg-icon svg-icon-3">
                                                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                                    <path d="M5 9C5 8.44772 5.44772 8 6 8H18C18.5523 8 19 8.44772 19 9V18C19 19.6569 17.6569 21 16 21H8C6.34315 21 5 19.6569 5 18V9Z" fill="currentColor" />
                                                                    <path opacity="0.5" d="M5 5C5 4.44772 5.44772 4 6 4H18C18.5523 4 19 4.44772 19 5V5C19 5.55228 18.5523 6 18 6H6C5.44772 6 5 5.55228 5 5V5Z" fill="currentColor" />
                                                                    <path opacity="0.5" d="M9 4C9 3.44772 9.44772 3 10 3H14C14.5523 3 15 3.44772 15 4V4H9V4Z" fill="currentColor" />
                                                                </svg>
                                                            </span>
                                                        </a>
                                                    @endcan
                                                </div>
                                            </td>
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

<div class="modal fade" id="annualLeaveModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Yeni Yıllık İzin Ekle</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="{{ route('annualleaves.store') }}" method="POST">
                    @csrf
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="name">Personel Ad Soyad</label>
                                <select name="personnelTypeID" class="form-control" id="personnelTypeId">
                                    <option></option>
                                    @foreach ($personnel_cards as $personnel_card)
                                    <option value="{{ $personnel_card->id }}">{{ $personnel_card->name_surname }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="annualTypeID">Yıllık İzin Türü</label>
                                <select name="annualTypeID" class="form-control" id="annualTypeID">
                                    <option></option>
                                    @foreach ($annual_leave_types as $annual_leave_type)
                                    <option value="{{ $annual_leave_type->id }}">{{ $annual_leave_type->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="startDate">Başlangıç ​​Tarihi</label>
                                <input type="text" class="form-control" id="startDate" name="startDate" placeholder="Başlangıç ​​Tarihi">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="endDate">Bitiş Tarihi</label>
                                <input type="text" class="form-control" id="endDate" name="endDate" placeholder="Bitiş Tarihi">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="note">Açıklama</label>
                                <textarea class="form-control" name="note" id="note" placeholder="Açıklama" rows="3" cols="50"></textarea>
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary float-right">Kaydet <i class="fa fa-check" aria-hidden="true"></i></button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Kapat</button>
            </div>
        </div>
    </div>
</div>

@endsection
