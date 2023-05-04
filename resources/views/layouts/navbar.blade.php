<div id="kt_header_mobile" class="header-mobile header-mobile-fixed">
    <a href="{{ route('home') }}">
        <img class="navbar-brand-img" src="{{ asset('assets/img/logo.svg') }}" class="logo-default max-h-30px" alt="Hotelistan">
    </a>
    <div class="d-flex align-items-center">
        <button class="btn p-0 burger-icon burger-icon-left rounded-0" id="kt_header_mobile_toggle">
            <span></span>
        </button>
        <button class="btn btn-hover-icon-primary p-0 ml-5" id="kt_sidebar_mobile_toggle">
            <span class="svg-icon svg-icon-xl">
                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                        <rect x="0" y="0" width="24" height="24" />
                        <path d="M6,9 L6,15 C6,16.6568542 7.34314575,18 9,18 L15,18 L15,18.8181818 C15,20.2324881 14.2324881,21 12.8181818,21 L5.18181818,21 C3.76751186,21 3,20.2324881 3,18.8181818 L3,11.1818182 C3,9.76751186 3.76751186,9 5.18181818,9 L6,9 Z" fill="#000000" fill-rule="nonzero" />
                        <path d="M10.1818182,4 L17.8181818,4 C19.2324881,4 20,4.76751186 20,6.18181818 L20,13.8181818 C20,15.2324881 19.2324881,16 17.8181818,16 L10.1818182,16 C8.76751186,16 8,15.2324881 8,13.8181818 L8,6.18181818 C8,4.76751186 8.76751186,4 10.1818182,4 Z" fill="#000000" opacity="0.3" />
                    </g>
                </svg>
            </span>
        </button>
        <button class="btn btn-hover-icon-primary p-0 ml-2" id="kt_aside_mobile_toggle">
            <span class="svg-icon svg-icon-xl">
                <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                    <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                        <polygon points="0 0 24 0 24 24 0 24" />
                        <path d="M12,11 C9.790861,11 8,9.209139 8,7 C8,4.790861 9.790861,3 12,3 C14.209139,3 16,4.790861 16,7 C16,9.209139 14.209139,11 12,11 Z" fill="#000000" fill-rule="nonzero" opacity="0.3" />
                        <path d="M3.00065168,20.1992055 C3.38825852,15.4265159 7.26191235,13 11.9833413,13 C16.7712164,13 20.7048837,15.2931929 20.9979143,20.2 C21.0095879,20.3954741 20.9979143,21 20.2466999,21 C16.541124,21 11.0347247,21 3.72750223,21 C3.47671215,21 2.97953825,20.45918 3.00065168,20.1992055 Z" fill="#000000" fill-rule="nonzero" />
                    </g>
                </svg>
            </span>
        </button>
    </div>
</div>

<div id="kt_header" class="header header-fixed">
    <div class="header-wrapper rounded-top-xl d-flex flex-grow-1 align-items-center">
        <div class="container-fluid d-flex align-items-center justify-content-end justify-content-lg-between flex-wrap">
            <div class="header-menu-wrapper header-menu-wrapper-left" id="kt_header_menu_wrapper">
                <div id="kt_header_menu" class="header-menu header-menu-mobile header-menu-layout-default">
                    <ul class="menu-nav">
                        <li class="menu-item menu-item-rel">
                            <a href="{{ route('home'); }}" class="menu-link menu-toggle">
                                <span class="menu-text">Arayüz</span>
                            </a>
                        </li>

                        <!-- Takvimler -->
                        @can('takvimi göster')
                        <li class="menu-item menu-item-submenu menu-item-rel" data-menu-toggle="click" aria-haspopup="true">
                            <a href="javascript:;" class="menu-link menu-toggle">
                                <span class="menu-text">Takvimler</span>
                                <span class="menu-desc"></span>
                                <i class="menu-arrow"></i>
                            </a>
                            <div class="menu-submenu menu-submenu-classic menu-submenu-left">
                                <ul class="menu-subnav">
                                    <li class="menu-item menu-item-submenu menu-item-rel" data-menu-toggle="hover" aria-haspopup="true">
                                        <a href="{{ route('chequecalendar.index'); }}" class="menu-link menu-toggle">
                                            <span class="menu-text">Çek Takvimi</span>
                                        </a>
                                    </li>
                                    <li class="menu-item menu-item-submenu menu-item-rel" data-menu-toggle="hover" aria-haspopup="true">
                                        <a href="{{ route('paymentcalendar.index'); }}" class="menu-link menu-toggle">
                                            <span class="menu-text">Ödeme Takvimi</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        @endcan
                        <!-- Ödeme Talepleri -->
                        @if (Auth::user()->hasRole('Finance Admin') || Auth::user()->hasRole('Finance Person') || Auth::user()->hasRole('Super Admin'))
                        <li class="menu-item menu-item-submenu menu-item-rel" data-menu-toggle="click" aria-haspopup="true">
                            <a href="javascript:;" class="menu-link menu-toggle">
                                <!-- <i class="fa fa-files-o text-primary"></i> -->
                                <span class="menu-text">Ödeme Talepleri</span>
                                <span class="menu-desc"></span>
                                <i class="menu-arrow"></i>
                            </a>
                            <div class="menu-submenu menu-submenu-classic menu-submenu-left">
                                <ul class="menu-subnav">

                                    <!-- Ödenmeyen Talepler -->
                                    @can('istenen ödeme talebini göster')
                                    <li class="menu-item menu-item-submenu" data-menu-toggle="hover" aria-haspopup="true">
                                        <a href="{{ route('paymentrequests.requested',['startDate'=>date("Y-m-d"),'endDate'=>date("Y-m-d"),'']); }}" class="menu-link menu-toggle">
                                            <span class="menu-text">Ödenmeyen Talepler</span>
                                        </a>
                                    </li>
                                    @endcan

                                    <!-- Onaya Gönderilen Talepler -->
                                    @can('ödeme isteği sonrası')
                                    <li class="menu-item menu-item-submenu" data-menu-toggle="hover" aria-haspopup="true">
                                        <a href="{{ route('paymentrequests.waiting',['startDate'=>date("Y-m-d"),'endDate'=>date("Y-m-d"),'']); }}" class="menu-link menu-toggle">
                                            <span class="menu-text">Onaya Gönderilen Talepler</span>
                                        </a>
                                    </li>

                                    @endcan
                                    @can('tamamlanan ödeme talebini göster')
                                    <li class="menu-item menu-item-submenu" data-menu-toggle="hover" aria-haspopup="true">
                                        <a href="{{ route('paymentrequests.completed',['startDate'=>date("Y-m-d"),'endDate'=>date("Y-m-d"),'']); }}" class="menu-link menu-toggle">
                                            <span class="menu-text">Ödenen Talepler</span>
                                        </a>
                                    </li>
                                    @endcan

                                    <!-- Tüm Talepler -->
                                    @can('ödeme talebini göster')
                                    <li class="menu-item menu-item-submenu" data-menu-toggle="hover" aria-haspopup="true">
                                        <a href="{{ route('paymentrequests.index',['startDate'=>date("Y-m-d"),'endDate'=>date("Y-m-d"),'']); }}" class="menu-link menu-toggle">
                                            <span class="menu-text">Tüm Talepler</span>
                                        </a>
                                    </li>
                                    @endcan

                                    <!-- Yeni Talep Oluştur -->
                                    @can('ödeme talebi oluştur')
                                    <li class="menu-item menu-item-submenu" data-menu-toggle="hover" aria-haspopup="true">
                                        <a href="{{ route('paymentrequests.create'); }}" class="menu-link menu-toggle">
                                            <span class="menu-text">Yeni Talep Oluştur</span>
                                        </a>
                                    </li>
                                    @endcan
                                </ul>
                            </div>
                        </li>
                        @endif
                        <li class="menu-item menu-item-submenu menu-item-rel" data-menu-toggle="click" aria-haspopup="true">
                            <a href="javascript:;" class="menu-link menu-toggle">
                                <span class="menu-text">Raporlar</span>
                                <span class="menu-desc"></span>
                            </a>
                            <div class="menu-submenu menu-submenu-classic menu-submenu-left">
                                <ul class="menu-subnav">
                                    @can('raporları göster')
                                    <li class="menu-item menu-item-submenu" data-menu-toggle="hover" aria-haspopup="true">

                                        <!-- Ödeme Raporu -->
                                        <a href="{{ route('report.payment',['startDate'=>date("Y-m-d"),'endDate'=>date("Y-m-d"),'']); }}" class="menu-link menu-toggle">
                                            <span class="menu-text">Ödeme Raporu</span>
                                        </a>
                                    </li>
                                    @endcan
                                </ul>
                            </div>
                        </li>

                        <!-- Kullanıcılar -->
                        @if (Auth::user()->hasRole('Super Admin'))
                        <li class="menu-item menu-item-submenu menu-item-rel" data-menu-toggle="click" aria-haspopup="true">
                            <a href="javascript:;" class="menu-link menu-toggle">
                                <!-- <i class="fa fa-user text-primary"></i> -->
                                <span class="menu-text">Kullanıcılar</span>
                                <span class="menu-desc"></span>
                            </a>
                            <div class="menu-submenu menu-submenu-classic menu-submenu-left">
                                <ul class="menu-subnav">
                                    <!-- Tüm Kullanıcılar -->
                                    @can('kullanıcıları göster')
                                        <li class="menu-item menu-item-submenu" data-menu-toggle="hover" aria-haspopup="true">
                                            <a href="{{ route('users.index'); }}" class="menu-link menu-toggle">
                                                <span class="menu-text">Tüm Kullanıcılar</span>
                                            </a>
                                        </li>
                                    @endcan

                                    <!-- Roller -->
                                    @can('rolleri göster')
                                    <li class="menu-item menu-item-submenu" data-menu-toggle="hover" aria-haspopup="true">
                                        <a href="{{ route('roles.index'); }}" class="menu-link menu-toggle">
                                            <span class="menu-text">Roller</span>
                                        </a>
                                    </li>
                                    @endcan

                                    <!-- Raporlar -->
                                    @can('raporları göster')
                                    <li class="menu-item menu-item-submenu" data-menu-toggle="hover" aria-haspopup="true">
                                        <a href="{{ route('reports.index'); }}" class="menu-link menu-toggle">
                                            <span class="menu-text">Raporlar</span>
                                        </a>
                                    </li>
                                    @endcan
                                </ul>
                            </div>
                        </li>
                        @endif

                        <!-- Tanımlamalar -->
                        <li class="menu-item menu-item-submenu menu-item-rel" data-menu-toggle="click" aria-haspopup="true">
                            <a href="javascript:;" class="menu-link menu-toggle">
                                <!-- <i class="fa fa-tasks text-primary"></i> -->
                                <span class="menu-text">Tanımlamalar</span>
                                <span class="menu-desc"></span>
                            </a>
                            <div class="menu-submenu menu-submenu-classic menu-submenu-left">
                                <ul class="menu-subnav">

                                <!-- Çek Durumu -->
                                @can('cek durumu goster')
                                 <li class="menu-item menu-item-submenu" data-menu-toggle="hover" aria-haspopup="true">
                                    <a href="{{ route('chequestatus.index') }}" class="menu-link menu-toggle">
                                        <span class="menu-text">Çek Durumu</span>
                                    </a>
                                </li>
                                @endcan
                                <!-- Çekler -->
                                @can('cekleri goster')
                                <li class="menu-item menu-item-submenu" data-menu-toggle="hover" aria-haspopup="true">
                                    <a href="{{ route('cheques.index') }}" class="menu-link menu-toggle">
                                        <span class="menu-text">Çekler</span>
                                    </a>
                                </li>
                                @endcan
                                <!-- Departman listesi -->
                                @can('departman goster')
                                <li class="menu-item menu-item-submenu" data-menu-toggle="hover" aria-haspopup="true">
                                    <a href="{{ route('departments.index') }}" class="menu-link menu-toggle">
                                        <span class="menu-text">Departman Listesi</span>
                                    </a>
                                </li>
                                @endcan
                                <!-- Firmalar -->
                                @can('şirketleri göster')
                                    <li class="menu-item menu-item-submenu" data-menu-toggle="hover" aria-haspopup="true">
                                        <a href="{{ route('companies.index') }}" class="menu-link menu-toggle">
                                            <span class="menu-text">Firmalar</span>
                                        </a>
                                    </li>
                                @endcan
                                <!-- Firma Türü -->
                                @can('firma turu goster')
                                    <li class="menu-item menu-item-submenu" data-menu-toggle="hover" aria-haspopup="true">
                                        <a href="{{ route('companytypes.index') }}" class="menu-link menu-toggle">
                                            <span class="menu-text">Firma Türü</span>
                                        </a>
                                    </li>
                                @endcan
                                <!-- Kredi Kartları -->
                                @can('kredi kartlari goster')
                                <li class="menu-item menu-item-submenu" data-menu-toggle="hover" aria-haspopup="true">
                                    <a href="{{ route('creditcards.index') }}" class="menu-link menu-toggle">
                                        <span class="menu-text">Kredi Kartları</span>
                                    </a>
                                </li>
                                @endcan
                                <!-- Personeller -->
                                @can('personelleri goster')
                                <li class="menu-item menu-item-submenu" data-menu-toggle="hover" aria-haspopup="true">
                                    <a href="{{ route('employees.index') }}" class="menu-link menu-toggle">
                                        <span class="menu-text">Personeller</span>
                                    </a>
                                </li>
                                @endcan
                                <!-- Senetler -->
                                @can('senetleri goster')
                                <li class="menu-item menu-item-submenu" data-menu-toggle="hover" aria-haspopup="true">
                                    <a href="{{ route('bills.index') }}" class="menu-link menu-toggle">
                                        <span class="menu-text">Senetler</span>
                                    </a>
                                </li>
                                @endcan
                                <!-- Tüm Tedarikçiler -->
                                @can('tedarikciler goster')
                                    <li class="menu-item menu-item-submenu" data-menu-toggle="hover" aria-haspopup="true">
                                        <a href="{{ route('suppliers.index') }}" class="menu-link menu-toggle">
                                            <span class="menu-text">Tedarikçiler</span>
                                        </a>
                                    </li>
                                @endcan
                                <!-- Roller -->
                                @can('ödeme talebi durumunu göster')
                                <li class="menu-item menu-item-submenu" data-menu-toggle="hover" aria-haspopup="true">
                                    <a href="{{ route('paymentrequeststatus.index') }}" class="menu-link menu-toggle">
                                        <span class="menu-text">Ödeme Talebi Durumları</span>
                                    </a>
                                </li>
                                @endcan
                                <!-- Ödeme Kategorileri -->
                                @can('odeme kategorileri goster')
                                <li class="menu-item menu-item-submenu" data-menu-toggle="hover" aria-haspopup="true">
                                    <a href="{{ route('paymentrequestcategory.index') }}" class="menu-link menu-toggle">
                                        <span class="menu-text">Ödeme Kategorileri</span>
                                    </a>
                                </li>
                                @endcan
                                <!-- Raporlar -->
                                @can('ödeme türlerini göster')
                                <li class="menu-item menu-item-submenu" data-menu-toggle="hover" aria-haspopup="true">
                                    <a href="{{ route('paymenttypes.index') }}" class="menu-link menu-toggle">
                                        <span class="menu-text">Ödeme Türleri</span>
                                    </a>
                                </li>
                                @endcan
                                @can('yillik izin turlerini goster')
                                <li class="menu-item menu-item-submenu" data-menu-toggle="hover" aria-haspopup="true">
                                    <a href="{{ route('annualleavetypes.index') }}" class="menu-link menu-toggle">
                                        <span class="menu-text">Yıllık İzin Türleri</span>
                                    </a>
                                </li>
                                @endcan
                                </ul>
                            </div>
                        </li>
                        <!-- Satın Alma -->
                        @if (Auth::user()->hasRole('Purchasing Admin') || Auth::user()->hasRole('Super Admin'))
                        <li class="menu-item menu-item-submenu menu-item-rel" data-menu-toggle="click" aria-haspopup="true">
                            <a href="javascript:;" class="menu-link menu-toggle">
                                <!-- <i class="fa fa-tasks text-primary"></i> -->
                                <span class="menu-text">Satın Alma</span>
                                <span class="menu-desc"></span>
                            </a>
                            <div class="menu-submenu menu-submenu-classic menu-submenu-left">
                                <ul class="menu-subnav">

                                    <!-- Ödenmeyen Talepler -->
                                    @can('cevaplanmayan talebini göster')
                                        <li class="menu-item menu-item-submenu" data-menu-toggle="hover" aria-haspopup="true">
                                            <a href="{{ route('purchasingrequests.requested',['startDate'=>date("Y-m-d"),'endDate'=>date("Y-m-d"),'']); }}" class="menu-link menu-toggle">
                                                <span class="menu-text">Cevaplanmayan Talepler</span>
                                            </a>
                                        </li>
                                    @endcan
                                    <!-- Onaya Gönderilen Talepler -->
                                    @can('onaya goderilen talebini göster')
                                        <li class="menu-item menu-item-submenu" data-menu-toggle="hover" aria-haspopup="true">
                                            <a href="{{ route('purchasingrequests.waiting',['startDate'=>date("Y-m-d"),'endDate'=>date("Y-m-d"),'']); }}" class="menu-link menu-toggle">
                                                <span class="menu-text">Onaya Gönderilen Talepleri</span>
                                            </a>
                                        </li>
                                    @endcan
                                    @can('tamamlan talebini göster')
                                        <li class="menu-item menu-item-submenu" data-menu-toggle="hover" aria-haspopup="true">
                                            <a href="{{ route('purchasingrequests.completed',['startDate'=>date("Y-m-d"),'endDate'=>date("Y-m-d"),'']); }}" class="menu-link menu-toggle">
                                                <span class="menu-text">Tamamlanan Talepleri</span>
                                            </a>
                                        </li>
                                    @endcan
                                    <!-- Tüm Talepler -->
                                    @can('satin alma talebini göster')
                                    <li class="menu-item menu-item-submenu" data-menu-toggle="hover" aria-haspopup="true">
                                        <a href="{{ route('purchasingrequests.index') }}" class="menu-link menu-toggle">
                                            <span class="menu-text">Tüm Talepler</span>
                                        </a>
                                    </li>
                                    @endcan
                                    @can('satin alma talebini olustur')
                                        <li class="menu-item menu-item-submenu" data-menu-toggle="hover" aria-haspopup="true">
                                            <a href="{{ route('purchasingrequests.create') }}" class="menu-link menu-toggle">
                                                <span class="menu-text">Yeni Talep Oluştur</span>
                                            </a>
                                        </li>
                                    @endcan
                                </ul>
                            </div>
                        </li>
                        @endif
                        @if (Auth::user()->hasRole('Human Resources Admin') || Auth::user()->hasRole('Human Resources Person') || Auth::user()->hasRole('Super Admin'))
                        <li class="menu-item menu-item-submenu menu-item-rel" data-menu-toggle="click" aria-haspopup="true">
                            <a href="javascript:;" class="menu-link menu-toggle">
                                <!-- <i class="fa fa-tasks text-primary"></i> -->
                                <span class="menu-text">İnsan Kaynakları</span>
                                <span class="menu-desc"></span>
                            </a>
                            <div class="menu-submenu menu-submenu-classic menu-submenu-left">
                                <ul class="menu-subnav">
                                    <!-- Personel Özlük Kartı -->
                                    @can('personel ozluk karti goster')
                                    <li class="menu-item menu-item-submenu" data-menu-toggle="hover" aria-haspopup="true">
                                        <a href="{{route('personnelcard.index')}}" class="menu-link menu-toggle">
                                            <span class="menu-text">Personel Özlük Kartı</span>
                                        </a>
                                    </li>
                                    @endcan
                                    <!-- Puantaj Kayıt -->
                                    @can('puantaj kayit goster')
                                    <li class="menu-item menu-item-submenu" data-menu-toggle="hover" aria-haspopup="true">
                                        <a href="{{route('checkregistrations.index')}}" class="menu-link menu-toggle">
                                            <span class="menu-text">Puantaj Kayıt</span>
                                        </a>
                                    </li>
                                    @endcan
                                    <!-- Yıllık İzin Takip -->
                                    @can('yillik izin takip goster')
                                    <li class="menu-item menu-item-submenu" data-menu-toggle="hover" aria-haspopup="true">
                                        <a href="{{route('annualleaves.index')}}" class="menu-link menu-toggle">
                                            <span class="menu-text">Yıllık İzin Takip</span>
                                        </a>
                                    </li>
                                    @endcan
                                    <!-- Özlük Evrakları -->
                                    @can('ozluk evraklari goster')
                                    <li class="menu-item menu-item-submenu" data-menu-toggle="hover" aria-haspopup="true">
                                        <a href="#" class="menu-link menu-toggle">
                                            <span class="menu-text">Özlük Evrakları</span>
                                        </a>
                                    </li>
                                    @endcan
                                    <!-- Deneme Süreleri -->
                                    @can('deneme sureleri goster')
                                    <li class="menu-item menu-item-submenu" data-menu-toggle="hover" aria-haspopup="true">
                                        <a href="{{route('trialperiods.index')}}" class="menu-link menu-toggle">
                                            <span class="menu-text">Deneme Süreleri</span>
                                        </a>
                                    </li>
                                    @endcan
                                    <!-- Zimmet -->
                                    @can('zimmet goster')
                                    <li class="menu-item menu-item-submenu" data-menu-toggle="hover" aria-haspopup="true">
                                        <a href="{{route('liabilities.index')}}" class="menu-link menu-toggle">
                                            <span class="menu-text">Zimmetler</span>
                                        </a>
                                    </li>
                                    @endcan
                                </ul>
                            </div>
                        </li>
                        @endif
                    </ul>
                </div>
            </div>
            <div class="d-flex align-items-center py-3 py-lg-2">
                <a class="navbar-brand" href="{{ route('home') }}">
                    <img class="navbar-brand-img-desk" src="{{ asset('assets/img/logo.svg') }}" alt="">
                </a>
            </div>
        </div>
    </div>
</div>
