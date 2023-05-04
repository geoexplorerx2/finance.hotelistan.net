<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card p-4 mt-3">
                <div class="card-title">
                    <h2>Deneme Süreleriyi Güncelle</h2>
                    <p class="float-right last-user">Ekleyen Kullanıcı: <i class="fa fa-user text-dark"></i> {{ $trial_period->user->name }}</p>
                </div>
                <form action="{{ route('trialperiods.update',['id'=>$trial_period->id]) }}" method="POST">
                    @csrf
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="name">Personel Ad Soyad</label>
                                <select name="personnelTypeID" class="form-control" id="personnelTypeID">
                                    <option value="{{ $trial_period->personnelCard->id }}">{{ $trial_period->personnelCard->name_surname }}</option>
                                    @foreach ($personnel_cards as $personnel_card)
                                    <option value="{{ $personnel_card->id }}">{{ $personnel_card->name_surname }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="startDate">Başlangıç ​​Tarihi</label>
                                <input type="date" class="form-control" id="startDate" name="startDate" value="{{ $trial_period->start_date }}" placeholder="Başlangıç ​​Tarihi">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="endDate">Bitiş Tarihi</label>
                                <input type="date" class="form-control" id="endDate" name="endDate" value="{{ $trial_period->end_date }}" placeholder="Bitiş Tarihi">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="note">Açıklama</label>
                                <textarea class="form-control" name="note" id="note" placeholder="Açıklama" rows="3" cols="50">{{ $trial_period->note }}</textarea>
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary float-right">Kaydet <i class="fa fa-check" aria-hidden="true"></i></button>
                </form>
            </div>
        </div>
    </div>
</div>
