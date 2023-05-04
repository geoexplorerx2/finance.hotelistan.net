<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card p-4 mt-3">
                <div class="card-title">
                    <h2>Senet Güncelle</h2>
                    <p class="float-right last-user">Ekleyen Kullanıcı: <i class="fa fa-user text-dark"></i> {{ $bill->user->name }}</p>
                </div>
                <form action="{{ route('bills.update',['id'=>$bill->id]) }}" method="POST">
                    @csrf
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="name">Banka Adı</label>
                                <input type="text" class="form-control" id="name" name="bankName" placeholder="Banka Adı" value="{{ $bill->bank_name}}" required>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="expiryDate">Vade</label>
                                <input type="text" class="form-control" id="expiryDate" name="expiryDate" value="{{ $bill->expiry_date}}" placeholder="Vade">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="issueDate">Verildiği Tarih</label>
                                <input type="text" class="form-control" id="issueDate" name="issueDate" value="{{ $bill->issue_date}}" placeholder="Verildiği Tarih">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="amount">Tutar</label>
                                <input type="text" class="form-control" id="amount" name="amount" value="{{ $bill->amount}}" placeholder="Tutar">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="companyId">Firma Adı</label>
                                <select class="form-control" id="companyId" name="company_id" required>
                                    <option value="{{ $bill->company_id }}" selected>{{ $bill->companies->name }}</option>
                                    @foreach ($companies as $company)
                                        <option value="{{ $company->id }}">{{ $company->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>

                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="note">Açıklama</label>
                            <textarea class="form-control" name="note" id="note" placeholder="Açıklama" rows="3" cols="50">{{ $bill->note}}</textarea>
                        </div>
                    </div>
                    </div>
                    <button type="submit" class="btn btn-primary mt-5 float-right">Güncelle<i class="fa fa-check" aria-hidden="true"></i></button>
                </form>
            </div>
        </div>
    </div>
</div>
