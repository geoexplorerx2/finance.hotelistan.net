<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card p-4 mt-3">
                <div class="card-title">
                    <h2>Personel Güncelle</h2>
                    <p class="float-right last-user">Ekleyen Kullanıcı: <i class="fa fa-user text-dark"></i> {{ $employee->user->name }}</p>
                </div>
                <form action="{{ route('employees.update',['id'=>$employee->id]) }}" method="POST">
                    @csrf
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="nameSurname">Ad Soyad</label>
                                <input type="text" class="form-control" id="nameSurname" name="nameSurname" value="{{ $employee->name_surname}}" placeholder="Ad Soyad">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="bankName">Banka Adı</label>
                                <input type="text" class="form-control" id="bankName" name="bankName" placeholder="Banka Adı" value="{{ $employee->bank_name}}" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="bankIban">Banka İbanı</label>
                                <input type="text" class="form-control" id="bankIban" name="bankIban" value="{{ $employee->bank_iban}}" placeholder="Banka İbanı">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="staff">Personel</label>
                                <input type="text" class="form-control" id="staff" name="staff" value="{{ $employee->staff}}" placeholder="Personel">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="companyId">Firma Adı</label>
                                <select class="form-control" id="companyId" name="company_id" required>
                                    <option value="{{ $employee->company_id }}" selected>{{ $employee->companies->name }}</option>
                                    @foreach ($companies as $company)
                                        <option value="{{ $company->id }}">{{ $company->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="note">Açıklama</label>
                                <textarea class="form-control" name="note" id="note" placeholder="Açıklama" rows="3" cols="50">{{ $employee->note }}</textarea>
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary mt-5 float-right">Güncelle<i class="fa fa-check" aria-hidden="true"></i></button>
                </form>
            </div>
        </div>
    </div>
</div>
