@extends('layouts.app')

@section('content')

@include('layouts.navbar')

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12 table-responsive">
            <div class="card mt-3">
                    <div class="subheader py-2 py-lg-6 subheader-transparent" id="kt_subheader">
                        <div class="container-fluid d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
                            <div class="d-flex align-items-center flex-wrap mr-1">
                                <div class="d-flex align-items-baseline flex-wrap mr-5">
                                    <h3 class="text-dark font-weight-bold my-1 mr-5">Raporlar</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                <div class="card-body">
                    <form action="" method="GET">
                        <div class="row pb-3">
                            <div class="col-lg-4">
                                <label for="startDate">Başlangıç Tarihi</label>
                                <input type="text" class="form-control datepicker" id="startDate" name="startDate" placeholder="Başlangıç Tarihi" value="" autocomplete="off" required>
                            </div>
                            <div class="col-lg-4">
                                <label for="endDate">Bitiş Tarihi</label>
                                <input type="text" class="form-control datepicker" id="endDate" name="endDate" placeholder="Bitiş Tarihi" autocomplete="off" value="" required>
                            </div>
                            <div class="col-lg-4">
                                <label for="endDate">Firma</label>
                                <select name="companyId" class="form-control" id="companyId">
                                    <option></option>
                                    @foreach($companies as $company)
                                    <option value="{{ $company->id }}">{{ $company->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-lg-12">
                                <button class="btn btn-success mt-3 float-right" type="submit">Filtrele <i class="fa fa-check"></i></button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="card p-3 mt-3">
                <div class="content d-flex flex-column flex-column-fluid" id="kt_content">
                    <div class="d-flex flex-column-fluid">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="card card-custom gutter-b">
                                        <div class="card-header">
                                            <div class="card-title">
                                                <h3 class="card-label">Chart 1</h3>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <div id="chart_11" class="d-flex justify-content-center"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="card card-custom gutter-b">
                                        <div class="card-header">
                                            <div class="card-title">
                                                <h3 class="card-label">Chart 2</h3>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <div id="chart_12" class="d-flex justify-content-center"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="card card-custom gutter-b">
                                        <div class="card-header">
                                            <div class="card-title">
                                                <h3 class="card-label">Chart 3</h3>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <div id="chart_111" class="d-flex justify-content-center"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="card card-custom gutter-b">
                                        <div class="card-header">
                                            <div class="card-title">
                                                <h3 class="card-label">Chart 4</h3>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <div id="chart_121" class="d-flex justify-content-center"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection
