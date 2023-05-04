<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card p-4 mt-3">
                <div class="card-title">
                    <h2>Çek Güncelle</h2>
                    <p class="float-right last-user">Ekleyen Kullanıcı: <i class="fa fa-user text-dark"></i> {{ $cheque->user->name }}</p>
                </div>
                <form action="{{ route('cheques.update',['id'=>$cheque->id]) }}" method="POST">
                    @csrf
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="name">Banka Adı</label>
                                <input type="text" class="form-control" id="name" name="bankName" placeholder="Banka Adı" value="{{ $cheque->bank_name}}" required>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="expiryDate">Vade</label>
                                <input type="date" class="form-control" id="expiryDate" name="expiryDate" value="{{ $cheque->expiry_date}}" placeholder="Vade">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="issueDate">Verildiği Tarih</label>
                                <input type="date" class="form-control" id="issueDate" name="issueDate" value="{{ $cheque->issue_date}}" placeholder="Verildiği Tarih">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="companyId">Firma Adı</label>
                                <select class="form-control" id="companyId" name="company_id" required>
                                    <option value="{{ $cheque->company_id }}" selected>{{ $cheque->companies->name }}</option>
                                    @foreach ($companies as $company)
                                        <option value="{{ $company->id }}">{{ $company->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="amount">Tutar</label>
                                <input type="text" class="form-control" id="amount" name="amount" value="{{ $cheque->amount}}" placeholder="Tutar">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="chequesCurrency">Para Birimi</label>
                                <select class="form-control" id="chequeCurrency" name="chequeCurrency">
                                    <option value="{{ $cheque->currency }}" selected>{{ $cheque->currency }}</option>
                                    <option value="EUR">EUR</option>
                                    <option value="USD">USD</option>
                                    <option value="GBP">GBP</option>
                                    <option value="TL">TL</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="chequeNo">Çek Numarası</label>
                                <input type="text" class="form-control" id="chequeNo" name="chequeNo" value="{{ $cheque->cheque_no}}" placeholder="Çek Numarası">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="cheques_statuses_id">Çek Durumu</label>
                                <select name="cheques_statuses_id" class="form-control" id="cheques_statuses_id">
                                @if ($cheque->cheques_statuses_id != "")
                                    @foreach($chequestatuses as $chequestatus)
                                        @if($cheque->cheques_statuses_id  == $chequestatus->id)
                                            <option value="{{ $chequestatus->id}}" selected>{{ $chequestatus->name }}</option>
                                        @endif
                                    @endforeach
                                @endif
                                @foreach($chequestatuses as $chequestatus)
                                    <option value="{{ $chequestatus->id }}">{{ $chequestatus->name }}</option>
                                @endforeach
                                </select>

                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="note">Açıklama</label>
                                <textarea class="form-control" name="note" id="note" placeholder="Açıklama" rows="3" cols="50">{{ $cheque->note}}</textarea>
                            </div>
                        </div></div>
                    <button type="submit" class="btn btn-primary mt-5 float-right">Güncelle<i class="fa fa-check" aria-hidden="true"></i></button>
                </form>
            </div>
        </div>
    </div>
</div>
