<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
   <head>
      <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="csrf-token" content="{{ csrf_token() }}">
      <meta name="robots" content="noindex">
      <meta http-equiv="X-UA-Compatible" content="ie=edge">
      <meta http-equiv="X-UA-Compatible" content="IE=7">
      <title>Ödeme Talebi Takvimi</title>
      <link rel="dns-prefetch" href="//fonts.gstatic.com">
      <link type="text/css" href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">
      <link type="text/css" href="{{ asset('assets/css/app.css') }}" rel="stylesheet">
      <link type="text/css" href="{{ asset('assets/css/jquery-ui.css') }}" rel="stylesheet">
      <link type="text/css" href="{{ asset('assets/css/glightbox.css') }}" rel="stylesheet">
      <link type="text/css" href="{{ asset('assets/css/fullcalendar.min.css') }}" rel="stylesheet">
      <link rel="shortcut icon" href="{{ asset('assets/img/favicon.png') }}" type="image/x-icon">
      <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
      <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
      <script type="text/javascript" src="{{ asset('assets/js/sweetalert.min.js') }}"></script>
   </head>
   <body onload="app();">

    @include("layouts.active_users_modal")

        <main class="main-content">
            @include('layouts.menu')
            @include('layouts.navbar')
            <div class="header bg-primary pb-6">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-8 mt-5">
                            <div class="card card-primary">
                                <div class="card-body p-0">
                                <div id="calendar"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 mt-5">
                            <h3 id="dailyTitle" class="text-left text-white">Daily Summary</h3>
                            <hr>
                            <div class="mb-3 resultCalendarCard" id="cardsDiv">
                            </div>
                            <a id="seeallBtn" class="btn btn-warning btn-block mb-3" style="color: white;">See All Treatment Plans for <b id="seeallText"></b></a>
                        </div>
                    </div>
                </div>
            </div>
        </main>

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
        <script type="text/javascript" src="{{ asset('assets/js/html2pdf.bundle.js') }}"></script>
        <script type="text/javascript" src="{{ asset('assets/js/intlTelInput.js') }}"></script>
        <script type="text/javascript" src="{{ asset('assets/js/datatable.js') }}"></script>
        <script type="text/javascript" src="{{ asset('assets/js/jscolor.js') }}"></script>
        <script type="text/javascript" src="{{ asset('assets/js/moment.min.js') }}"></script>
        <script type="text/javascript" src="{{ asset('assets/js/fullcalendar.min.js') }}"></script>
        <script type="text/javascript" src="{{ asset('assets/js/jquery-steps.js') }}"></script>
        <script type="text/javascript" src="{{ asset('assets/js/jquery.MultiLanguage.min.js') }}"></script>
        <script type="text/javascript" src="{{ asset('assets/js/extension-btns-custom.js') }}"></script>
        <script type="text/javascript" src="{{ asset('assets/js/gijgo.min.js') }}"></script>
        <script type="text/javascript" src="{{ asset('assets/js/moment.min.js') }}"></script>
        <script type="text/javascript" src="{{ asset('assets/js/daterangepicker.js') }}"></script>
        <script type="text/javascript" src="{{ asset('assets/js/rest_api.js') }}"></script>
        <script type="text/javascript" src="{{ asset('assets/js/app.js') }}" defer></script>
        <script>
            $(document).ready(function(){
                let today = new Date().toISOString().slice(0, 10);
                getDailySummary(today);
                changeseeall(today);

                    $('#calendar').fullCalendar({
                        header: {
                            left: 'prev,next today',
                            center: 'title',
                            right: 'month, agendaWeek, agendaDay, listWeek'
                        },
                        firstDay: 1,
                        events: [
                            @foreach($listCountByMonth as $treatmentplan)
                            {
                                title: '{{ $treatmentplan->countR }} Patient,  {{ $treatmentplan->status_name }}',
                                start: '{{ $treatmentplan->date }}',
                                description: '{{ $treatmentplan->countR }} Patient,  {{ $treatmentplan->status_name }}',
                                end: '{{ $treatmentplan->date }}',
                                color: '{{ $treatmentplan->status_color}}',
                                //url: '{{ url('/reservations/bydate?s='.$treatmentplan->date) }}',
                                //textColor: 'black',
                            },
                            @endforeach
                        ],
                        dayClick: function (date, jsEvent, view, resourceObj) {
                            console.log('Date: ' + date.format());
                            getDailySummary(date.format());
                            changeseeall(date.format());
                        }
                });
                });

            function changeseeall(date) {
                $("#seeallBtn").attr("href", '/bydate?s=' + date);
                $("#seeallText").text(date);
                $("#dailyTitle").text(date + " Daily Summary");
            }

            function getDailySummary(sDate) {
                try {
                    $.ajax({
                        url: '/countbydate?sDate=' + sDate,
                        type: 'get',
                        dataType: 'json',
                        success: function (response) {
                            if (response) {
                                //$("p").empty();
                                console.log(response);
                                $('#parent').append('<div>hello</div>');
                                $('#cardsDiv').empty();

                                $.each(response, function (i, item) {
                                    var patientStatuses = "";
                                    if (i==null || i=="") {
                                        i="Others";
                                    }
                                    console.log(i);
                                    $.each(item, function (i, item) {
                                        patientStatuses += '<a href="/bydate?s=' + sDate+'&ps='+item.pId+'"><div class="external-event" style="background-color:' + item.status_color + ';">' + item.countR + " Patient " + item.status_name + '</div></a>'
                                    });

                                    var htmlResponse = ' <div class="card">' +
                                        '<div class="card-header">' +
                                        '<h4 class="card-title" id="">' + i + '</h4>' +
                                        '</div>' +
                                        '<div class="card-body">' +
                                        '<div id="external-events">' +
                                        patientStatuses +
                                        '</div></div></div>';

                                    $('#cardsDiv').append(htmlResponse);
                                });
                            }
                        },

                        error: function () {
                        },
                    });
                } catch (error) {
                    console.info(error);
                } finally {

                }
            }
        </script>
    </body>
</html>
