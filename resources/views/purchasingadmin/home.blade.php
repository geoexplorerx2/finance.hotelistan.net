@extends('layouts.app')
@section('content')

@include('layouts.navbar')
<div class="content d-flex flex-column flex-column-fluid" id="kt_content">
    <div class="d-flex flex-column-fluid">
       <div class="container">
          <div class="row mt-0 mt-lg-8">
             <div class="col-xl-12">
                <div class="card card-custom gutter-b">
                   <div class="card-header h-auto border-0">
                      <div class="card-title py-5">
                         <h3 class="card-label">
                            <span class="d-block text-dark font-weight-bolder">Arayüz</span>
                         </h3>
                      </div>
                      <div class="card-toolbar">
                         <ul class="nav nav-pills nav-pills-sm nav-dark-75" role="tablist">
                            <li class="nav-item">
                               <a class="nav-link py-2 px-4" data-toggle="tab" href="#kt_charts_widget_2_chart_tab_1">
                               <span class="nav-text font-size-sm">Aylık</span>
                               </a>
                            </li>
                            <li class="nav-item">
                               <a class="nav-link py-2 px-4" data-toggle="tab" href="#kt_charts_widget_2_chart_tab_2">
                               <span class="nav-text font-size-sm">Haftalık</span>
                               </a>
                            </li>
                            <li class="nav-item">
                               <a class="nav-link py-2 px-4 active" data-toggle="tab" href="#kt_charts_widget_2_chart_tab_3">
                               <span class="nav-text font-size-sm">Günlük</span>
                               </a>
                            </li>
                         </ul>
                      </div>
                   </div>

                   <div class="container">
                      <div class="row d-flex justify-content-around">
                         <div class="col-xl-6">
                            <div class="card-stretch gutter-b">
                               <div class="card card-custom gutter-b">
                                  <div class="card-body p-0">
                                     <div class="d-flex align-items-center justify-content-between card-spacer flex-grow-1">
                                        <span class="symbol symbol-50 symbol-light-success mr-2">
                                        <span class="symbol-label">
                                        <i class="fa fa-files-o"></i>
                                        </span>
                                        </span>
                                        <div class="d-flex flex-column text-right">
                                           <a href="{{ route('purchasingrequests.index'); }}"><span class="text-dark-75 font-weight-bolder font-size-h3">{{ $purchasingRequestCount }}</span></a>
                                           <span class="text-muted font-weight-bold mt-2">Satın Alma Talepleri</span>
                                        </div>
                                     </div>
                                  </div>
                               </div>
                               <div class="card card-custom">
                                  <div class="card-body p-0">
                                     <div class="d-flex align-items-center justify-content-between card-spacer flex-grow-1">
                                        <span class="symbol symbol-50 symbol-light-info mr-2">
                                        <span class="symbol-label">
                                        <i class="fa fa-building"></i>
                                        </span>
                                        </span>
                                        <div class="d-flex flex-column text-right">
                                           <a href="{{ route('suppliers.index'); }}"><span class="text-dark-75 font-weight-bolder font-size-h3">{{ $supplierCount }}</span></a>
                                           <span class="text-muted font-weight-bold mt-2">Tedarikçiler</span>
                                        </div>
                                     </div>
                                  </div>
                               </div>
                            </div>
                         </div>
                         <div class="col-xl-5">
                            <div class="col d-flex flex-column">
                               <div class="flex-grow-1 bg-danger p-8 rounded-xl bgi-no-repeat" style="background-position: calc(100% + 0.5rem) bottom; background-size: auto 70%; background-image: url({{ asset('assets/new/media/svg/humans/custom-3.svg') }})">
                                  <h4 class="text-inverse-danger mt-2 font-weight-bolder">User Confidence</h4>
                                  <p class="text-inverse-danger my-6">Boost marketing &amp; sales
                                     <br />through product confidence.
                                  </p>
                                  <a href="#" class="btn btn-warning font-weight-bold py-2 px-6">Learn</a>
                               </div>
                            </div>
                         </div>
                      </div>
                   </div>
                </div>
                <div class="row">
                    @can('raporları göster')
                   <div class="col-lg-6">
                      <div class="card card-custom gutter-b">
                         <div class="card-header">
                            <div class="card-title">
                               <h3 class="card-label">Kullanıcı Özeti</h3>
                            </div>
                         </div>
                         <div class="card-body">
                            <div id="purchasingUsers" class="d-flex justify-content-center"></div>
                         </div>
                      </div>
                   </div>
                   <div class="col-lg-6">
                      <div class="card card-custom gutter-b">
                         <div class="card-header">
                            <div class="card-title">
                               <h3 class="card-label">Tedarikçi Satın Alma Özeti</h3>
                            </div>
                         </div>
                         <div class="card-body">
                            <div id="suppliers" class="d-flex justify-content-center"></div>
                         </div>
                      </div>
                   </div>
                   @endcan
                </div>
             </div>
          </div>
       </div>
    </div>
 </div>
@endsection

