<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div class="card p-4 mt-3">
                <div class="card-title">
                    <h2>Firma Türü Güncelle</h2>
                    <p class="float-right last-user">Ekleyen Kullanıcı: <i class="fa fa-user text-dark"></i> {{ $company_type->user->name }}</p>
                </div>
                <form action="{{ route('companytypes.update',['id'=>$company_type->id]) }}" method="POST">
                    @csrf
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="name">Firma Türü Adı</label>
                                <input type="text" class="form-control" id="name" name="name" placeholder="Firma Türü" value="{{ $company_type->name }}" required>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label for="note">Not</label>
                                <input type="text" class="form-control" id="note" name="note" placeholder="Not" value="{{ $company_type->note }}">
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary mt-5 float-right">Güncelle <i class="fa fa-check" aria-hidden="true"></i></button>
                </form>
            </div>
        </div>
    </div>
</div>
