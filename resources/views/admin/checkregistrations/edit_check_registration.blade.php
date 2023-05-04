<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card p-4 mt-3">
                <div class="card-title">
                    <h2>Puantaj Kayıt Güncelle</h2>
                    <p class="float-right last-user">Ekleyen Kullanıcı: <i class="fa fa-user text-dark"></i> {{ $check_registration->user->name }}</p>
                </div>
                <form action="{{ route('checkregistrations.update',['id'=>$check_registration->id]) }}" method="POST">
                    @csrf
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="name">Personel Ad Soyad</label>
                                <select name="personnelTypeID" class="form-control" id="personnelTypeID">
                                    <option value="{{ $check_registration->personnelCard->id }}">{{ $check_registration->personnelCard->name_surname }}</option>
                                    @foreach ($personnel_cards as $personnel_card)
                                    <option value="{{ $personnel_card->id }}">{{ $personnel_card->name_surname }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="startDate">Kayıt Günü Tarihi</label>
                                <input type="date" class="form-control" id="startDate" name="startDate" value="{{ $check_registration->check_date }}" placeholder="Kayıt Günü Tarihi">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="startHour">Sabah Başlayış Saati</label>
                                <input type="time" class="form-control" id="startHour" name="startHour" value="{{ $check_registration->start_hour }}" placeholder="Sabah Başlayış Saati">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="endHour">Sabah Bırakış Saati</label>
                                <input type="time" class="form-control" id="endHour" name="endHour" value="{{ $check_registration->end_hour }}" placeholder="Bitiş Tarihi">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="note">Açıklama</label>
                                <textarea class="form-control" name="note" id="note" placeholder="Açıklama" rows="3" cols="50">{{ $check_registration->note }}</textarea>
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary float-right">Kaydet <i class="fa fa-check" aria-hidden="true"></i></button>
                </form>
            </div>
        </div>
    </div>
</div>
