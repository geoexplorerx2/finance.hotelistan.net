<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card p-4 mt-3">
                <div class="card-title">
                    <h2>Firmayı Güncelle</h2>
                    <p class="float-right last-user">Ekleyen Kullanıcı: <i class="fa fa-user text-dark"></i> {{ $company->user->name }}</p>
                </div>
                <form action="{{ route('companies.update',['id'=>$company->id]) }}" method="POST">
                    @csrf
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="name">Firma Adı</label>
                                <input type="text" class="form-control" id="name" name="name" placeholder="Firma Adı" value="{{ $company->name }}" required>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="bankName">Firma Banka Adı</label>
                                <input type="text" class="form-control" id="bankName" name="bankName" placeholder="Firma Banka Adı" value="{{ $company->bank_name }}">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="bankIban">Firma Banka İbanı</label>
                                <input type="text" class="form-control" id="bankIban" name="bankIban" placeholder="Firma Banka İbanı" value="{{ $company->bank_iban }}">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="personName">Firma Yetkili Adı</label>
                                <input type="text" class="form-control" id="personName" name="personName" placeholder="Firma Yetkili Adı" value="{{ $company->person_name }}">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="ExpiryDate">Vade</label>
                                <input type="text" class="form-control" id="ExpiryDate" name="ExpiryDate" value="{{ $company->expiry_date }}" placeholder="Vade">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <label for="paymentTypeID">Ödeme Türü</label>
                            <select name="paymentTypeID" class="form-control" id="paymentTypeID">
                                <option value="{{ $company->paymentType->id }}">{{ $company->paymentType->name }}</option>
                                @foreach ($payment_types as $payment_type)
                                <option value="{{ $payment_type->id }}">{{ $payment_type->name }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="phoneNumber">Firma İletişim Numarası</label>
                                <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" placeholder="Firma Yetkili Adı" value="{{ $company->phone_number }}">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="note">Açıklama</label>
                                <textarea class="form-control" name="note" id="note" placeholder="Açıklama" rows="3" cols="50">{{ $company->note }}</textarea>
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary mt-5 float-right">Güncelle<i class="fa fa-check" aria-hidden="true"></i></button>
                </form>
            </div>
        </div>
    </div>
</div>
