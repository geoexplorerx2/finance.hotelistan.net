<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card p-4 mt-3">
                <div class="card-title">
                    <h2>Tedarikçiyi Güncelle</h2>
                    <p class="float-right last-user">Ekleyen Kullanıcı: <i class="fa fa-user text-dark"></i> {{ $supplier->user->name }}</p>
                </div>
                <form action="{{ route('suppliers.update',['id'=>$supplier->id]) }}" method="POST">
                    @csrf
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="name">Tedarikçi Adı</label>
                                <input type="text" class="form-control" id="name" name="name" placeholder="Tedarikçi Adı" value="{{ $supplier->name }}" required>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="personName">Tedarikçi Yetkili Adı</label>
                                <input type="text" class="form-control" id="personName" name="personName" placeholder="Tedarikçi Yetkili Adı" value="{{ $supplier->person_name }}">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="phoneNumber">Tedarikçi İletişim Numarası</label>
                                <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" placeholder="Tedarikçi Yetkili Adı" value="{{ $supplier->phone_number }}">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="iban">Tedarikçi Banka İbanı</label>
                                <input type="text" class="form-control" id="iban" name="iban" placeholder="Tedarikçi Banka İbanı" value="{{ $supplier->iban }}">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="tax">Tedarikçi Vergi Numarası</label>
                                <input type="text" class="form-control" id="tax" name="tax" placeholder="Tedarikçi Yetkili Adı" value="{{ $supplier->tax }}">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="note">Açıklama</label>
                                <textarea class="form-control" name="note" id="note" placeholder="Açıklama" rows="3" cols="50">{{ $supplier->note }}</textarea>
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary mt-5 float-right">Güncelle<i class="fa fa-check" aria-hidden="true"></i></button>
                </form>
            </div>
        </div>
    </div>
</div>
