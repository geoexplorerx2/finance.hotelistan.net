<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta name="robots" content="noindex">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="X-UA-Compatible" content="IE=7">
    <title>Hotelistan Finans Yönetimi</title>
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link type="text/css" href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">
    <link type="text/css" href="{{ asset('assets/css/gijgo.css') }}" rel="stylesheet">
    <link type="text/css" href="{{ asset('assets/css/grid.css') }}" rel="stylesheet">
    <link type="text/css" href="{{ asset('assets/css/popover.css') }}" rel="stylesheet">
    <link type="text/css" href="{{ asset('assets/css/jquery-ui.css') }}" rel="stylesheet">
    <link type="text/css" href="{{ asset('assets/css/dropzone.min.css') }}" rel="stylesheet">
    <link type="text/css" href="{{ asset('assets/css/daterangepicker.css') }}" rel="stylesheet">
    <link type="text/css" href="{{ asset('assets/css/jquery-steps.css') }}" rel="stylesheet">
    <link type="text/css" href="{{ asset('assets/css/glightbox.css') }}" rel="stylesheet">
    <link type="text/css" href="{{ asset('assets/css/fullcalendar.min.css') }}" rel="stylesheet">
    <link rel="shortcut icon" href="{{ asset('assets/img/favicon.png') }}" type="image/x-icon">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
    <script type="text/javascript" src="{{ asset('assets/js/sweetalert.min.js') }}"></script>

    <!--new version-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<script src="https://kit.fontawesome.com/1899ceef68.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" />
	<link href="{{ asset('assets/new/plugins/global/plugins.bundle5883.css?v=7.2.9') }}" rel="stylesheet" type="text/css" />
	<link href="{{ asset('assets/new/plugins/custom/prismjs/prismjs.bundle5883.css?v=7.2.9') }}" rel="stylesheet" type="text/css" />
	<link href="{{ asset('assets/new/css/style.bundle5883.css?v=7.2.9') }}" rel="stylesheet" type="text/css" />
	<link href="{{ asset('assets/new/css/pages/wizard/wizard-2.css?v=7.2.9') }}" rel="stylesheet" type="text/css" />
    <!--End new version-->
</head>
<body onload="app();" id="kt_body" class="header-fixed header-mobile-fixed subheader-enabled sidebar-enabled page-loading">
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
            <div class="preloader-circle"></div>
            <div class="preloader-img pere-text"><img src="{{ asset('assets/img/favicon.png') }}"></div>
            </div>
        </div>
    </div>
    <div class="d-flex flex-column flex-root">
		<div class="d-flex flex-row flex-column-fluid page">
            <div class="d-flex flex-column flex-row-fluid wrapper" id="kt_wrapper">

                {{-- @include('layouts.navbar') --}}
                @if (Auth::user()->hasRole('Sales Person')) @include('layouts.sales_menu')
                @elseif(Auth::user()->hasRole('Sales Admin')) @include('layouts.sales_admin_menu')
                @elseif(Auth::user()->hasRole('Doctor')) @include('layouts.doctor_menu')
                @else
                    @include('layouts.menu')
                @endif

                    @yield('content')
            </div>

		<div id="kt_quick_user" class="offcanvas offcanvas-left p-10">
			<div class="offcanvas-header d-flex align-items-center justify-content-between pb-5">
				<h3 class="font-weight-bold m-0">Hoşgeldiniz, {{ auth()->user()->name }}</h3>
				<a href="#" class="btn btn-xs btn-icon btn-light btn-hover-primary" id="kt_quick_user_close">
					<i class="ki ki-close icon-xs text-muted"></i>
				</a>
			</div>
			<div class="offcanvas-content pr-5 mr-n5">
				<div class="d-flex align-items-center mt-5">
					<div class="symbol symbol-100 mr-5">
						<div class="symbol-label" style="background-image:url('{{ asset('assets/img/user-icon.png'); }}')"></div>
						<i class="symbol-badge bg-success"></i>
					</div>
					<div class="d-flex flex-column">
						<a href="#" class="font-weight-bold font-size-h5 text-dark-75 text-hover-primary">{{ auth()->user()->name }}</a>
						<div class="navi mt-2">

                            <a href="{{ url('/profile/edit/'.auth()->user()->id) }}" class="navi-item">
								<span class="navi-link p-0 pb-2">
									<span class="navi-icon mr-1">
										<span class="svg-icon svg-icon-lg svg-icon-primary">
                                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                    <polygon points="0 0 24 0 24 24 0 24"/>
                                                    <path d="M12,11 C9.790861,11 8,9.209139 8,7 C8,4.790861 9.790861,3 12,3 C14.209139,3 16,4.790861 16,7 C16,9.209139 14.209139,11 12,11 Z" fill="#000000" fill-rule="nonzero" opacity="0.3"/>
                                                    <path d="M3.00065168,20.1992055 C3.38825852,15.4265159 7.26191235,13 11.9833413,13 C16.7712164,13 20.7048837,15.2931929 20.9979143,20.2 C21.0095879,20.3954741 20.9979143,21 20.2466999,21 C16.541124,21 11.0347247,21 3.72750223,21 C3.47671215,21 2.97953825,20.45918 3.00065168,20.1992055 Z" fill="#000000" fill-rule="nonzero"/>
                                                </g>
                                            </svg>
										</span>
									</span>
									<span class="navi-text text-muted text-hover-primary">Profilim</span>
								</span>
							</a>
						</div>
					</div>
				</div>
				<div class="separator separator-dashed mt-8 mb-5"></div>
				<div class="navi navi-spacer-x-0 p-0">
                    <a href="{{ url('/logout') }}" class="btn btn-sm btn-light-primary font-weight-bolder py-2 px-5">Çıkış Yap</a>
				</div>
			</div>
		</div>
                @yield('sidebar')
        </div>
    </div>
    @if (session('message'))
        <script type="text/javascript">
            swal({ icon: 'success', title: 'Başarılı!', text: '{{ session('message') }}', });
        </script>
    @endif

    @include("layouts.active_users_modal")
	<script>var KTAppSettings = { "breakpoints": { "sm": 576, "md": 768, "lg": 992, "xl": 1200, "xxl": 1200 }, "colors": { "theme": { "base": { "white": "#ffffff", "primary": "#663259", "secondary": "#E5EAEE", "success": "#1BC5BD", "info": "#8950FC", "warning": "#FFA800", "danger": "#F64E60", "light": "#F3F6F9", "dark": "#212121" }, "light": { "white": "#ffffff", "primary": "#F4E1F0", "secondary": "#ECF0F3", "success": "#C9F7F5", "info": "#EEE5FF", "warning": "#FFF4DE", "danger": "#FFE2E5", "light": "#F3F6F9", "dark": "#D6D6E0" }, "inverse": { "white": "#ffffff", "primary": "#ffffff", "secondary": "#212121", "success": "#ffffff", "info": "#ffffff", "warning": "#ffffff", "danger": "#ffffff", "light": "#464E5F", "dark": "#ffffff" } }, "gray": { "gray-100": "#F3F6F9", "gray-200": "#ECF0F3", "gray-300": "#E5EAEE", "gray-400": "#D6D6E0", "gray-500": "#B5B5C3", "gray-600": "#80808F", "gray-700": "#464E5F", "gray-800": "#1B283F", "gray-900": "#212121" } }, "font-family": "Poppins" };</script>

	<script src="{{ asset('assets/new/plugins/global/plugins.bundle5883.js?v=7.2.9') }}"></script>
	<script src="{{ asset('assets/new/plugins/custom/prismjs/prismjs.bundle5883.js?v=7.2.9') }}"></script>
	<script src="{{ asset('assets/new/js/scripts.bundle5883.js?v=7.2.9') }}"></script>
    <script src="{{ asset('assets/new/js/pages/features/charts/apexcharts5883.js?v=7.2.9') }}"></script>
    <script src="{{ asset('assets/new/js/pages/custom/user/add-user.js?v=7.2.9') }}"></script>

    <script type="text/javascript" src="{{ asset('assets/js/jquery.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('assets/js/jquery-ui.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('assets/js/js.cookie.js') }}"></script>
    <script type="text/javascript" src="{{ asset('assets/js/dropzone.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('assets/js/jquery-ui.js') }}"></script>
    <script type="text/javascript" src="{{ asset('assets/js/popover.js') }}"></script>
    <script type="text/javascript" src="{{ asset('assets/js/jquery.scrollbar.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('assets/js/jquery-scrollLock.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('assets/js/jquery.magnific-popup.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('assets/js/Chart.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('assets/js/glightbox.js') }}"></script>
    <script type="text/javascript" src="{{ asset('assets/js/Chart.extension.js') }}"></script>
    <script type="text/javascript" src="{{ asset('assets/js/select2.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('assets/js/jquery.datatable.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('assets/js/dataTables.bootstrap4.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('assets/js/jquery.validate.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('assets/js/dataTables.responsive.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('assets/js/html2pdf.bundle.js') }}"></script>
    <script type="text/javascript" src="{{ asset('assets/js/datatable.js') }}"></script>
    <script type="text/javascript" src="{{ asset('assets/js/jscolor.js') }}"></script>
    <script type="text/javascript" src="{{ asset('assets/js/jquery-steps.js') }}"></script>
    <script type="text/javascript" src="{{ asset('assets/js/jquery.MultiLanguage.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('assets/js/extension-btns-custom.js') }}"></script>
    <script type="text/javascript" src="{{ asset('assets/js/gijgo.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('assets/js/moment.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('assets/js/daterangepicker.js') }}"></script>
    <script type="text/javascript" src="{{ asset('assets/js/app.js') }}" defer></script>
    @if(Request::is('paymentrequests/create'))
    <script src="{{ asset('assets/new/js/paymentrequest.js') }}"></script>
    @endif
    @if(Request::is('purchasingrequests/create'))
    <script src="{{ asset('assets/new/js/purchasingrequest.js') }}"></script>
    @endif
    <script>
        $('.inline-popups').magnificPopup({
            removalDelay: 500,
            callbacks: {
                beforeOpen: function () {
                    this.st.mainClass = this.st.el.attr('data-effect');
                }
            },
            type: 'ajax',
            midClick: true
        });

    </script>
    @if(Request::is('paymentrequests/create'))
        <script type="text/javascript">
            try {
                Dropzone.autoDiscover = false;
                var myDropzone = new Dropzone(".dropzone", {
                    autoProcessQueue: false,
                    maxFilesize: 30,
                    resizeQuality: 1.0,
                    parallelUploads: 100,
                    acceptedFiles: ".jpeg, .jpg, .png, .gif, .pdf, .docx",
                    addRemoveLinks: true
                });

                $('#completePaymentRequest').click(function(){
                    myDropzone.processQueue();
                });
            }
            catch (error) {   }
        </script>
    @endif
    @if(Request::is('purchasingrequests/create'))
        <script type="text/javascript">
            try {
                Dropzone.autoDiscover = false;
                var myDropzone = new Dropzone(".dropzone", {
                    autoProcessQueue: false,
                    maxFilesize: 30,
                    resizeQuality: 1.0,
                    parallelUploads: 100,
                    acceptedFiles: ".jpeg, .jpg, .png, .gif, .pdf, .docx",
                    addRemoveLinks: true
                });

                $('#completePurchasingRequest').click(function(){
                    myDropzone.processQueue();
                });
            }
            catch (error) {   }
        </script>
    @endif
    @if(Request::is('humanresource/create'))
        <script type="text/javascript">
            try {
                Dropzone.autoDiscover = false;
                var myDropzone = new Dropzone(".dropzone", {
                    autoProcessQueue: false,
                    maxFilesize: 30,
                    resizeQuality: 1.0,
                    parallelUploads: 100,
                    acceptedFiles: ".jpeg, .jpg, .png",
                    addRemoveLinks: true
                });


            }
            catch (error) {   }
        </script>
    @endif
    <script type="text/javascript">
        $(document).ready(function () {
            $('#dataTable').DataTable({
                initComplete: function () {
                    this.api()
                        .columns()
                        .every(function () {
                            var column = this;
                            var select = $('<select><option value=""></option></select>')
                                .appendTo($(column.footer()).empty())
                                .on('change', function () {
                                    var val = $.fn.dataTable.util.escapeRegex($(this).val());

                                    column.search(val ? '^' + val + '$' : '', true, false).draw();
                                });

                            column
                                .data()
                                .unique()
                                .sort()
                                .each(function (d, j) {
                                    select.append('<option value="' + d + '">' + d + '</option>');
                                });
                        });
                },
            });
        });
    </script>

    <!--New Version-->


	<!-- Bootstrap 5 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

    <!-- End New Version-->
    @yield('footer')
</body>
</html>
