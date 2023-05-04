<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card p-4 mt-3">
                <div class="card-title">
                    <h2>Zimmetyi Güncelle</h2>
                    <p class="float-right last-user">Ekleyen Kullanıcı: <i class="fa fa-user text-dark"></i> {{ $liability->user->name }}</p>
                </div>
                <form action="{{ route('liabilities.update',['id'=>$liability->id]) }}" method="POST">
                    @csrf
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="name">Personel Ad Soyad</label>
                                <select name="personnelID" class="form-control" id="personnelID">
                                    <option value="{{ $liability->personnelCard->id }}">{{ $liability->personnelCard->name_surname }}</option>
                                    @foreach ($personnel_cards as $personnel_card)
                                    <option value="{{ $personnel_card->id }}">{{ $personnel_card->name_surname }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="annualTypeID">Ürün Modeli</label>
                                <input type="text" class="form-control" id="productModel" name="productModel" value="{{ $liability->product_model }}" placeholder="Ürün Modeli">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="startDate">Teslim ​​Tarihi</label>
                                <input type="date" class="form-control" id="startDate" name="startDate" value="{{ $liability->signature_date }}" placeholder="Teslim ​​Tarihi">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="note">Açıklama</label>
                                <textarea class="form-control" name="note" id="note" placeholder="Açıklama" rows="3" cols="50">{{ $liability->note }}</textarea>
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary float-right">Kaydet <i class="fa fa-check" aria-hidden="true"></i></button>
                </form>
            </div>
        </div>
    </div>
</div>
