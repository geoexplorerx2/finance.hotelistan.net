<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <meta name="robots" content="noindex">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <meta http-equiv="X-UA-Compatible" content="IE=7">
        <title>Hotelistan Finans Sistemi | Ödeme Takvimi</title>
        <link rel="dns-prefetch" href="//fonts.gstatic.com">
        <link type="text/css" href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">
        <link type="text/css" href="{{ asset('assets/css/jquery-ui.css') }}" rel="stylesheet">
        <link type="text/css" href="{{ asset('assets/css/glightbox.css') }}" rel="stylesheet">
        <link type="text/css" href="{{ asset('assets/css/fullcalendar-5.11.0.css') }}" rel="stylesheet">
        <link rel="shortcut icon" href="{{ asset('assets/img/favicon.png') }}" type="image/x-icon">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
        <script type="text/javascript" src="{{ asset('assets/js/sweetalert.min.js') }}"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/1899ceef68.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" />
        <link href="{{ asset('assets/new/plugins/global/plugins.bundle5883.css?v=7.2.9') }}" rel="stylesheet" type="text/css" />
        <link href="{{ asset('assets/new/plugins/custom/prismjs/prismjs.bundle5883.css?v=7.2.9') }}" rel="stylesheet" type="text/css" />
        <link href="{{ asset('assets/new/css/style.bundle5883.css?v=7.2.9') }}" rel="stylesheet" type="text/css" />
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

                    @include("layouts.active_users_modal")

                    @include('layouts.navbar')

                    @include('layouts.menu')
                    <div class="card-header flex-wrap border-0 pb-0">
                        <div class="card-title">
                            <h3 class="card-label">Ödeme Takvimi</h3>
                        </div>
                    </div>
                    <div class="col-md-12 mt-5">
                        <div id="calendar"></div>
                    </div>

                </div>
            </div>
        </div>

        <script>var KTAppSettings = { "breakpoints": { "sm": 576, "md": 768, "lg": 992, "xl": 1200, "xxl": 1200 }, "colors": { "theme": { "base": { "white": "#ffffff", "primary": "#663259", "secondary": "#E5EAEE", "success": "#1BC5BD", "info": "#8950FC", "warning": "#FFA800", "danger": "#F64E60", "light": "#F3F6F9", "dark": "#212121" }, "light": { "white": "#ffffff", "primary": "#F4E1F0", "secondary": "#ECF0F3", "success": "#C9F7F5", "info": "#EEE5FF", "warning": "#FFF4DE", "danger": "#FFE2E5", "light": "#F3F6F9", "dark": "#D6D6E0" }, "inverse": { "white": "#ffffff", "primary": "#ffffff", "secondary": "#212121", "success": "#ffffff", "info": "#ffffff", "warning": "#ffffff", "danger": "#ffffff", "light": "#464E5F", "dark": "#ffffff" } }, "gray": { "gray-100": "#F3F6F9", "gray-200": "#ECF0F3", "gray-300": "#E5EAEE", "gray-400": "#D6D6E0", "gray-500": "#B5B5C3", "gray-600": "#80808F", "gray-700": "#464E5F", "gray-800": "#1B283F", "gray-900": "#212121" } }, "font-family": "Poppins" };</script>
        <script src="{{ asset('assets/new/plugins/global/plugins.bundle5883.js?v=7.2.9') }}"></script>
        <script src="{{ asset('assets/new/plugins/custom/prismjs/prismjs.bundle5883.js?v=7.2.9') }}"></script>
        <script src="{{ asset('assets/new/js/scripts.bundle5883.js?v=7.2.9') }}"></script>
        <script type="text/javascript" src="{{ asset('assets/js/jquery.min.js') }}"></script>
        <script type="text/javascript" src="{{ asset('assets/js/jquery-ui.min.js') }}"></script>
        <script type="text/javascript" src="{{ asset('assets/js/bootstrap.bundle.min.js') }}"></script>
        <script type="text/javascript" src="{{ asset('assets/js/js.cookie.js') }}"></script>
        <script type="text/javascript" src="{{ asset('assets/js/dropzone.min.js') }}"></script>
        <script type="text/javascript" src="{{ asset('assets/js/chart.min.js') }}"></script>
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
        <script type="text/javascript" src="{{ asset('assets/js/fullcalendar-5.11.0.js') }}"></script>
        <script type="text/javascript" src="{{ asset('assets/js/html2pdf.bundle.js') }}"></script>
        <script type="text/javascript" src="{{ asset('assets/js/intlTelInput.js') }}"></script>
        <script type="text/javascript" src="{{ asset('assets/js/datatable.js') }}"></script>
        <script type="text/javascript" src="{{ asset('assets/js/jscolor.js') }}"></script>
        <script type="text/javascript" src="{{ asset('assets/js/jquery-steps.js') }}"></script>
        <script type="text/javascript" src="{{ asset('assets/js/jquery.MultiLanguage.min.js') }}"></script>
        <script type="text/javascript" src="{{ asset('assets/js/extension-btns-custom.js') }}"></script>
        <script type="text/javascript" src="{{ asset('assets/js/gijgo.min.js') }}"></script>
        <script type="text/javascript" src="{{ asset('assets/js/moment.min.js') }}"></script>
        <script type="text/javascript" src="{{ asset('assets/js/daterangepicker.js') }}"></script>
        <script type="text/javascript" src="{{ asset('assets/js/app.js') }}" defer></script>
        <script>
            $(document).ready(function(){
                let today = new Date().toISOString().slice(0, 10);
                var calendarEl = document.getElementById('calendar');

                var calendar = new FullCalendar.Calendar(calendarEl, {
                    headerToolbar: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'dayGridMonth, timeGridWeek, timeGridDay, listMonth'
                    },
                    firstDay: 1,
                    locale: "tr",
                    buttonIcons: true,
                    weekNumbers: false,
                    navLinks: true,
                    editable: false,
                    dayMaxEvents: false,
                    events: [
                        @foreach($listCountByMonth as $paymentrequest)
                        {
                            title: '{{ $paymentrequest->countR }} {{ $paymentrequest->name }}, {{ number_format($paymentrequest->payment_amount, 2) }} {{ $paymentrequest->payment_amount_currency }}',
                            start: '{{ $paymentrequest->date }}',
                            description: '{{ $paymentrequest->countR }} {{ $paymentrequest->name }}',
                            end: '{{ $paymentrequest->date }}',
                            color: '#000',
                            url: '{{ url('/paymentsbydate?s='.$paymentrequest->date) }}',
                            textColor: '#fff',
                        },
                        @endforeach
                    ],
                    dayClick: function (date, jsEvent, view, resourceObj) {
                        console.log('Date: ' + date.format());
                        getDailySummary(date.format());
                        changeseeall(date.format());
                    }
                });
                calendar.render();
            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
