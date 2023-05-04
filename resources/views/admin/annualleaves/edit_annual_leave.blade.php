<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card p-4 mt-3">
                <div class="card-title">
                    <h2>Yıllık İzinyi Güncelle</h2>
                    <p class="float-right last-user">Ekleyen Kullanıcı: <i class="fa fa-user text-dark"></i> {{ $annual_leave->user->name }}</p>
                </div>
                <form action="{{ route('annualleaves.update',['id'=>$annual_leave->id]) }}" method="POST">
                    @csrf
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="name">Personel Ad Soyad</label>
                                <select name="personnelTypeID" class="form-control" id="personnelTypeID">
                                    <option value="{{ $annual_leave->personnelCard->id }}">{{ $annual_leave->personnelCard->name_surname }}</option>
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
                                    <option value="{{ $annual_leave->annualLeaveType->id }}">{{ $annual_leave->annualLeaveType->name }}</option>
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
                                <input type="date" class="form-control" id="startDate" name="startDate" value="{{ $annual_leave->start_date }}" placeholder="Başlangıç ​​Tarihi">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="endDate">Bitiş Tarihi</label>
                                <input type="date" class="form-control" id="endDate" name="endDate" value="{{ $annual_leave->end_date }}" placeholder="Bitiş Tarihi">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="note">Açıklama</label>
                                <textarea class="form-control" name="note" id="note" placeholder="Açıklama" rows="3" cols="50">{{ $annual_leave->note }}</textarea>
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary float-right">Kaydet <i class="fa fa-check" aria-hidden="true"></i></button>
                </form>
            </div>
        </div>
    </div>
</div>
