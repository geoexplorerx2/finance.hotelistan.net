<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card p-4 mt-3">
                <div class="card-title">
                    <h2>Kredi Kart Güncelle</h2>
                    <p class="float-right last-user">Ekleyen Kullanıcı: <i class="fa fa-user text-dark"></i> {{ $creditcard->user->name }}</p>
                </div>
                <form action="{{ route('creditcards.update',['id'=>$creditcard->id]) }}" method="POST">
                    @csrf
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="creditCardName">Kart Adı</label>
                                <input type="text" class="form-control" id="creditCardName" name="creditCardName" placeholder="Kart Adı" value="{{ $creditcard->name}}" required>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="creditCardNumber">Kart Numarası</label>
                                <input type="text" class="form-control" id="creditCardNumber" name="creditCardNumber" value="{{ $creditcard->number}}" placeholder="Kart Numarası">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="expiry_date">Bitiş Tarihi</label>
                                <input type="text" class="form-control" id="expiry_date" name="expiry_date" value="{{ $creditcard->expiry_date}}" placeholder="10-29">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="cvv">CVV</label>
                                <input type="text" class="form-control" id="cvv" name="cvv" value="{{ $creditcard->cvv}}" placeholder="CVV">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="creditCardCurrency">Para Birimi</label>
                                <select class="form-control" id="creditCardCurrency2" name="creditCardCurrency">
                                    <option value="{{ $creditcard->currency }}" selected>{{ $creditcard->currency }}</option>
                                    <option value="EUR">EUR</option>
                                    <option value="USD">USD</option>
                                    <option value="GBP">GBP</option>
                                    <option value="TL">TL</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="note">Açıklama</label>
                                <textarea class="form-control" name="note" id="note" placeholder="Açıklama" rows="3" cols="50">{{ $creditcard->note }}</textarea>
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary mt-5 float-right">Güncelle<i class="fa fa-check" aria-hidden="true"></i></button>
                </form>
            </div>
        </div>
    </div>
</div>
