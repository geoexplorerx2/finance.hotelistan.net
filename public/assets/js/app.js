var payment_request_id;
var purchasing_request_id;
var arr = [];
var counte = [];
//companies
var companies = [];
var companyColors = [];
var companyCounts = [];
//users
var users = [];
var userColors = [];
var userCounts = [];
//Suppliers
var suppliers = [];
var supplierColors = [];
var supplierCounts = [];
//Purchasing Users
var purchasingUsers = [];
var purchasingUserColors = [];
var purchasingUserCounts = [];

var HIDDEN_URL = {
    HOME: '/home'
}

function paymentRequestStepArr(){
    try {
        var frmInfo = $('#frmInfo');
        var frmInfoValidator = frmInfo.validate();

        var frmLogin = $('#frmLogin');
        var frmLoginValidator = frmLogin.validate();

        var frmMobile = $('#frmMobile');
        var frmMobileValidator = frmMobile.validate();

        $('#demo').steps({
            onChange: function (currentIndex, newIndex, stepDirection) {
                console.log('onChange', currentIndex, newIndex, stepDirection);
                // tab1
                if (currentIndex === 3) {
                    if (stepDirection === 'forward') {
                        var valid = frmLogin.valid();
                        return valid;
                    }
                    if (stepDirection === 'backward') {
                        frmLoginValidator.resetForm();
                    }
                }

                // tab2
                if (currentIndex === 1) {
                    if (stepDirection === 'forward') {
                        var valid = frmInfo.valid();
                        return valid;
                    }
                    if (stepDirection === 'backward') {
                        frmInfoValidator.resetForm();
                    }
                }

                return true;
            },
            onFinish: function () {
                alert('Wizard Completed');
            }
        });

    }
    catch (error) {
        console.log(error);
    }
}

function dashboard() {
    setTimeout(() => {
        const apexChart = "#companies";
        var options = {
            series: companyCounts,
            chart: {
                width: 400,
                type: 'pie',
            },
            labels: companies,
            responsive: [{
                breakpoint: 480,
                options: {
                    chart: {
                        width: 200
                    },
                    legend: {
                        position: 'bottom'
                    }
                }
            }],
            colors: companyColors
        };

        var chart = new ApexCharts(document.querySelector(apexChart), options);
        chart.render();
    }, 1000);

    setTimeout(() => {
        const apexChart = "#users";
        var options = {
            series: userCounts,
            chart: {
                width: 400,
                type: 'donut',
            },
            labels: users,
            responsive: [{
                breakpoint: 480,
                options: {
                    chart: {
                        width: 200
                    },
                    legend: {
                        position: 'bottom'
                    }
                }
            }],
            colors: userColors
        };

        var chart = new ApexCharts(document.querySelector(apexChart), options);
        chart.render();
    }, 1000);
//Purchasing reports

    setTimeout(() => {
        const apexChart = "#suppliers";
        var options = {
            series: supplierCounts,
            chart: {
                width: 400,
                type: 'pie',
            },
            labels: suppliers,
            responsive: [{
                breakpoint: 480,
                options: {
                    chart: {
                        width: 200
                    },
                    legend: {
                        position: 'bottom'
                    }
                }
            }],
            colors: supplierColors
        };

        var chart = new ApexCharts(document.querySelector(apexChart), options);
        chart.render();
    }, 1000);

    setTimeout(() => {
        const apexChart = "#purchasingUsers";
        var options = {
            series: purchasingUserCounts,
            chart: {
                width: 400,
                type: 'donut',
            },
            labels: purchasingUsers,
            responsive: [{
                breakpoint: 480,
                options: {
                    chart: {
                        width: 200
                    },
                    legend: {
                        position: 'bottom'
                    }
                }
            }],
            colors: purchasingUserColors
        };

        var chart = new ApexCharts(document.querySelector(apexChart), options);
        chart.render();
    }, 1000);
}

var pageurl = window.location.href;
$(".menu-nav li a").each(function(){
    if ($(this).attr("href") == pageurl || $(this).attr("href") == '')
    $(this).parents('.menu-item-rel').addClass("menu-item-active");
});
$(".menu-subnav li a").each(function(){
    if ($(this).attr("href") == pageurl || $(this).attr("href") == '')
    $(this).parents('.menu-item-submenu').addClass("menu-item-active");
});
var dataTable;
var select2Init = function() {

    //Select2
    $("#annualTypeID").select2({ placeholder: 'Yıllık İzin Türü Seçiniz',dropdownParent: $('#annualLeaveModal'), dropdownAutoWidth: true, allowClear: true });
    $("#personnelTypeId").select2({ placeholder: 'Personel Seçiniz',dropdownParent: $('#annualLeaveModal'), dropdownAutoWidth: true, allowClear: true });
    $("#personnelID").select2({ placeholder: 'Personel Seçiniz',dropdownParent: $('#liabilityModal'), dropdownAutoWidth: true, allowClear: true });
    $("#personnelTypeID").select2({ placeholder: 'Personel Seçiniz',dropdownParent: $('#checkRegistrationModal'), dropdownAutoWidth: true, allowClear: true });
    $("#companyId").select2({ placeholder: 'Firma Seçiniz', dropdownAutoWidth: true, allowClear: true });
    $("#payCompanyId").select2({ placeholder: 'Firma Seçiniz', dropdownAutoWidth: true, allowClear: true });
    $("#paidCompanyId").select2({ placeholder: 'Firma Seçiniz', dropdownAutoWidth: true, allowClear: true });
    $("#categoryId").select2({ placeholder: 'Ödeme Kategorisi Seçiniz', dropdownAutoWidth: true, allowClear: true });
    $("#supplierId").select2({ placeholder: 'Tedarikçi Seçiniz', dropdownAutoWidth: true, allowClear: true });
    $("#company_id").select2({ placeholder: 'Firma Seçiniz', dropdownParent: $('#billModal'), dropdownAutoWidth: true, allowClear: true });
    $("#selectSearch").select2({ placeholder: 'Tümü', dropdownAutoWidth: true, allowClear: true });
    $("#supplierId").select2({ placeholder: 'Tedarikçi Seçiniz', dropdownAutoWidth: true, allowClear: true });
    $("#paymentTypeId").select2({ placeholder: 'Ödeme Türü Seçiniz', dropdownAutoWidth: true, allowClear: true });
    $("#paymentTypeID").select2({ placeholder: 'Ödeme Türü Seçiniz',dropdownParent: $('#companyModal'), dropdownAutoWidth: true, allowClear: true });
    $("#paymentCurrency").select2({ placeholder: 'Para Birimini Seçiniz', dropdownAutoWidth: true, allowClear: true });
    $("#chequeCurrency").select2({ placeholder: 'Para Birimini Seçiniz',dropdownParent: $('#billModal'), dropdownAutoWidth: true, allowClear: true });
    $("#cheques_statuses_id").select2({ placeholder: 'Çek Durumu Seçiniz',dropdownParent: $('#billModal'), dropdownAutoWidth: true, allowClear: true});
    $("#creditCardCurrency").select2({ placeholder: 'Para Birimini Seçiniz',dropdownParent: $('#billModal'), dropdownAutoWidth: true, allowClear: true});
    $("#creditCardCurrency2").select2({ placeholder: 'Para Birimini Seçiniz', dropdownAutoWidth: true, allowClear: true });
    $("#paymentRequestStatusId").select2({ placeholder: 'Ödeme Talebi Durumu Seçiniz',dropdownParent: $('#postModal'), dropdownAutoWidth: true, allowClear: true });
    $("#purchasingRequestStatusId").select2({ placeholder: 'Satın Almda Talebi Durumu Seçiniz',dropdownParent: $('#purchasingPostModal'), dropdownAutoWidth: true, allowClear: true });
    //End Select2
};

var dataTableInit = function() {
    dataTable = $('#dataTable').dataTable({
        "columnDefs": [{
                "targets": 1,
                "type": 'num',
            },
            {
                "targets": 2,
                "type": 'num',
            }
        ],
    });
};

var dtSearchInit = function() {

    $('#filterLeadSource').on("change", function(){
        dtSearchAction($(this), 7)
    });

    $('#filterGender').on("change", function(){
        dtSearchAction($(this), 10)
    });
};

dtSearchAction = function(selector, columnId) {
    var fv = selector.val();
    if ((fv == '') || (fv == null)) {
        dataTable.api().column(columnId).search('', true, false).draw();
    } else {
        dataTable.api().column(columnId).search(fv, true, false).draw();
    }
};

var app = (function() {

    if ([HIDDEN_URL.HOME].includes(window.location.pathname)) {
        dashboard();
    }

    $(document).ready(function() {
        select2Init();
        dataTableInit();
        dtSearchInit();

        $('.popover').popover({
            container: 'body'
        })

        $.ajax({
            url: '/companiesReport',
            type: 'get',
            dataType: 'json',
            success: function (response) {
                if (response) {
                    $.each(response, function (key, value) {
                        companies.push(value.name);
                        companyCounts.push(value.count);
                        companyColors.push("#" + Math.floor(Math.random()*16777215).toString(16).padStart(6, '0').toUpperCase());
                    });
                }
            },

            error: function () {    },
        });
        $.ajax({
            url: '/usersReport',
            type: 'get',
            dataType: 'json',
            success: function (response) {
                if (response) {
                    $.each(response, function (key, value) {
                        users.push(value.name);
                        userCounts.push(value.count);
                        userColors.push("#" + Math.floor(Math.random()*16777215).toString(16).padStart(6, '0').toUpperCase());
                    });
                }
            },

            error: function () {    },
        });

        $.ajax({
            url: '/suppliersReport',
            type: 'get',
            dataType: 'json',
            success: function (response) {
                if (response) {
                    $.each(response, function (key, value) {
                        suppliers.push(value.name);
                        supplierCounts.push(value.count);
                        supplierColors.push("#" + Math.floor(Math.random()*16777215).toString(16).padStart(6, '0').toUpperCase());
                    });
                }
            },

            error: function () {    },
        });
        $.ajax({
            url: '/purchasingUsersReport',
            type: 'get',
            dataType: 'json',
            success: function (response) {
                if (response) {
                    $.each(response, function (key, value) {
                        purchasingUsers.push(value.name);
                        purchasingUserCounts.push(value.count);
                        purchasingUserColors.push("#" + Math.floor(Math.random()*16777215).toString(16).padStart(6, '0').toUpperCase());
                    });
                }
            },

            error: function () {    },
        });

        $('.navbar-nav li a').on('click', function () {
            $(this).parent().toggleClass('active');
        });

        $('.img-gal').magnificPopup({
            type: 'image',
            gallery: {
                enabled: true
            }
        });

        $("#preloader-active").hide(1000);
        $("#mainnav .child-nav > a").on('click', function () {
            $(this).toggleClass("active");
            $(".submenu").toggleClass("in");
            return false;
        });

        $(".cancel-warning").on("click", function(){
            swal({ icon: 'warning', title: 'Warning!', text: 'Please Contact Sales Manager to Cancel!' });
        });
    });

    //edit page
    $("#uploadFile").on("click", function () {
        setTimeout(() => {
            swal({ icon: 'success', title: 'Success!', text: 'Patient Photos Added Successfully!', timer: 1000 });
        }, 1000);
    });

    /*$.ajax({
        url: '/getCurrencies',
        type: 'GET',
        dataType: 'json',
        success: function(response) {
            if (response) {
                $.each(response, function(key, value) {
                    $("#currenciesSection").append("<span class='currencyText'>" + value[0] + "</span>");
                });
            }
        },
        error: function() {
            console.log();
        },
    });*/

    postRequestOperation();
    postPurchasingRequestOperation();

    paymentRequestStep();
    paymentRequestStepArr();
    // treatmentPlanRequestComplete();
    //completePaymentRequest();
    personnelCardStep();


    purchasingRequestStep();
    //completePurchasingRequest();
    //api's
    // countryCode();
});

var Layout = (function() {

    function pinSidenav() {
        $('.sidenav-toggler').addClass('active');
        $('.sidenav-toggler').data('action', 'sidenav-unpin');
        $('body').removeClass('g-sidenav-hidden').addClass('g-sidenav-show g-sidenav-pinned');
        $('body').append('<div class="backdrop d-xl-none" data-action="sidenav-unpin" data-target=' + $('#sidenav-main').data('target') + ' />');
        Cookies.set('sidenav-state', 'pinned');
    }

    function unpinSidenav() {
        $('.sidenav-toggler').removeClass('active');
        $('.sidenav-toggler').data('action', 'sidenav-pin');
        $('body').removeClass('g-sidenav-pinned').addClass('g-sidenav-hidden');
        $('body').find('.backdrop').remove();
        Cookies.set('sidenav-state', 'unpinned');
    }

    var $sidenavState = Cookies.get('sidenav-state') ? Cookies.get('sidenav-state') : 'pinned';

    if ($(window).width() > 1200) {
        if ($sidenavState == 'pinned') {
            pinSidenav()
        }

        if (Cookies.get('sidenav-state') == 'unpinned') {
            unpinSidenav()
        }

        $(window).resize(function() {
            if ($('body').hasClass('g-sidenav-show') && !$('body').hasClass('g-sidenav-pinned')) {
                $('body').removeClass('g-sidenav-show').addClass('g-sidenav-hidden');
            }
        });
    }

    $(document).ready(function(){
        $("#tableCompleted").dataTable({ paging: true, pageLength: 25 });
        $("#tableData").dataTable({ paging: true, pageLength: 25 });
        $("#tablePatients").dataTable({ paging: true, pageLength: 15 });
    });

    if ($(window).width() < 1200) {
        $('body').removeClass('g-sidenav-hide').addClass('g-sidenav-hidden');
        $('body').removeClass('g-sidenav-show');
        $(window).resize(function() {
            if ($('body').hasClass('g-sidenav-show') && !$('body').hasClass('g-sidenav-pinned')) {
                $('body').removeClass('g-sidenav-show').addClass('g-sidenav-hidden');
            }
        });
    }

    $("body").on("click", "[data-action]", function(e) {

        e.preventDefault();

        var $this = $(this);
        var action = $this.data('action');
        var target = $this.data('target');

        switch (action) {
            case 'sidenav-pin':
                pinSidenav();
                break;

            case 'sidenav-unpin':
                unpinSidenav();
                break;

            case 'search-show':
                target = $this.data('target');
                $('body').removeClass('g-navbar-search-show').addClass('g-navbar-search-showing');

                setTimeout(function() {
                    $('body').removeClass('g-navbar-search-showing').addClass('g-navbar-search-show');
                }, 150);

                setTimeout(function() {
                    $('body').addClass('g-navbar-search-shown');
                }, 300)
                break;

            case 'search-close':
                target = $this.data('target');
                $('body').removeClass('g-navbar-search-shown');

                setTimeout(function() {
                    $('body').removeClass('g-navbar-search-show').addClass('g-navbar-search-hiding');
                }, 150);

                setTimeout(function() {
                    $('body').removeClass('g-navbar-search-hiding').addClass('g-navbar-search-hidden');
                }, 300);

                setTimeout(function() {
                    $('body').removeClass('g-navbar-search-hidden');
                }, 500);
                break;
        }
    });

    $('.sidenav').on('mouseenter', function() {
        if (!$('body').hasClass('g-sidenav-pinned')) {
            $('body').removeClass('g-sidenav-hide').removeClass('g-sidenav-hidden').addClass('g-sidenav-show');
        }
    });

    $('.sidenav').on('mouseleave', function() {
        if (!$('body').hasClass('g-sidenav-pinned')) {
            $('body').removeClass('g-sidenav-show').addClass('g-sidenav-hide');

            setTimeout(function() {
                $('body').removeClass('g-sidenav-hide').addClass('g-sidenav-hidden');
            }, 300);
        }
    });

    var userFormat = "YYYY-MM-DD";

    $('#expiryDate').daterangepicker({
        "autoApply": true,
        "singleDatePicker": true,
        "showDropdowns": true,
        "autoUpdateInput": true,
        locale: {
            firstDay: 1,
            format: userFormat
        },
    });

    $('#invoiceDate').daterangepicker({
        "autoApply": true,
        "singleDatePicker": true,
        "showDropdowns": true,
        "autoUpdateInput": true,
        locale: {
            firstDay: 1,
            format: userFormat
        },
    });

    $('#issueDate').daterangepicker({
        "autoApply": true,
        "singleDatePicker": true,
        "showDropdowns": true,
        "autoUpdateInput": true,
        locale: {
            firstDay: 1,
            format: userFormat
        },
    });

    $('#documentDate').daterangepicker({
        "autoApply": true,
        "singleDatePicker": true,
        "showDropdowns": true,
        "autoUpdateInput": true,
        locale: {
            firstDay: 1,
            format: userFormat
        },
    });

    $('#startDate').daterangepicker({
        "autoApply": true,
        "singleDatePicker": true,
        "showDropdowns": true,
        "autoUpdateInput": true,
        locale: {
            firstDay: 0,
            format: userFormat
        },
    });

    $('#endDate').daterangepicker({
        "autoApply": true,
        "singleDatePicker": true,
        "showDropdowns": true,
        "autoUpdateInput": true,
        locale: {
            firstDay: 0,
            format: userFormat
        },
    });

    $('#birthDate').daterangepicker({
        "autoApply": true,
        "singleDatePicker": true,
        "showDropdowns": true,
        "autoUpdateInput": true,
        locale: {
            firstDay: 1,
            format: userFormat
        },
    });

    $('#start_date').daterangepicker({
        "autoApply": true,
        "singleDatePicker": true,
        "showDropdowns": true,
        "autoUpdateInput": true,
        locale: {
            firstDay: 1,
            format: userFormat
        },
    });

    $(window).on('load resize', function() {
        if ($('body').height() < 800) {
            $('body').css('min-height', '100vh');
            $('#footer-main').addClass('footer-auto-bottom')
        }
    });
})();

function previousPage() {
    history.go(-1);
}
//Purchasing Request
function purchasingRequestStep(){
    try {
        $('#savePurchasingRequestBtn').on('click', function () {
            var mainStep = $("#step1");
            var productTitle    = mainStep.find('#productTitle').val(),
                productUrl      = mainStep.find('#productUrl').val(),
                description     = mainStep.find('#note').val();


            if (productTitle == "" || productUrl == "") {
                Swal.fire('Hatalı', 'Lütfen Bütün Boşlukları Doldurun!', 'error').then(function(){ });
            }
            else {
                $("#next-step").trigger("click");
                $(".product-title").text(productTitle);
                $(".product-url").text(productUrl);
                $(".description").text(description);
            }
        });
    } catch (error) {
        console.log(error);
    }
}

/*function completePurchasingRequest(){
    try {
        $("#completePurchasingRequest").on("click", function(){
            //payment request
            setTimeout(() => {
                var mainStep = $("#tab1");
                var productTitle    = mainStep.find('#productTitle').val(),
                    productUrl      = mainStep.find('#productUrl').val(),
                    supplierId      = mainStep.find('#supplierId').children("option:selected").val(),
                    supplierName    = mainStep.find('#supplierId').children("option:selected").val(),
                    note            = mainStep.find('#note').val();
                addPurchasingRequest(productTitle, productUrl, note, supplierId, supplierName)

                $("#dropzone").find("#prId").val(purchasing_request_id);
                setTimeout(() => {
                    $("#uploadFile").trigger("click");
                }, 100);
            }, 1000);
        });
    }
    catch(error){ }
}*/

function postPurchasingRequestOperation(){
    try {
        $("#purchasingPostRequest").on("click", function(){
            var purchasingRequestId = $("#purchasingPostModal").find("#purchasing_request_id").val();
            var purchasingRequestStatusId = $("#purchasingPostModal").find("#purchasingRequestStatusId").children("option:selected").val();
            var note = $("#purchasingPostModal").find("#note").val();
            if(purchasingRequestStatusId == ""){
                Swal.fire( 'Hatalı', 'Lütfen Bütün Boşlukları Doldurun!', 'info').then(function(){ });
            }
            else {
                setTimeout(() => {
                    postPurchasingRequest(purchasingRequestId, purchasingRequestStatusId, note);
                }, 100);
            }
        });
    }
    catch (error) { }
}

function postPurchasingRequest(purchasingRequestId, purchasingRequestStatusId, note){
    try {
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        $.ajax({
            url: '/purchasingrequests/postPurchasingRequest/' + purchasingRequestId +'',
            type: 'POST',
            data: {
                'purchasing_request_status_id': purchasingRequestStatusId,
                'note': note
            },
            async: false,
            dataType: 'json',
            success: function (response) {
                if (response) {
                    Swal.fire( 'Başarılı!', 'Satın Alma Talebi Başarıyla Cevaplandı!', 'success').then(function(){
                        location.reload();
                    });
                }
            },

            error: function () { },
        });
    }
    catch (error) {
        console.log(error);
    }
    finally { }
}

//payment request
function paymentRequestStep(){
    try {
        $('#savePaymentRequestBtn').on('click', function () {
            var mainStep = $("#step1");
            var expiryDate = mainStep.find('#expiryDate').val(),
                paymentAmount = mainStep.find('#paymentAmount').val(),
                paymentCurrency = mainStep.find('#paymentCurrency').children("option:selected").val(),
                paidCompanyId = mainStep.find('#paidCompanyId').children("option:selected").val(),
                payCompanyId = mainStep.find('#payCompanyId').children("option:selected").val(),
                paidCompanyName = mainStep.find('#paidCompanyId').children("option:selected").text(),
                payCompanyName = mainStep.find('#payCompanyId').children("option:selected").text(),
                categoryId = mainStep.find('#categoryId').children("option:selected").val(),
                categoryName = mainStep.find('#categoryId').children("option:selected").text(),
                paymentTypeId = mainStep.find('#paymentTypeId').children("option:selected").val(),
                documentNo = mainStep.find('#documentNo').val(),
                documentDate = mainStep.find('#documentDate').val(),
                invoiceDate = mainStep.find('#invoiceDate').val(),
                description = mainStep.find('#note').val();

             /*if (expiryDate == "" || paymentAmount == "" || paymentCurrency == "" || paidCompanyId == "" || payCompanyId == ""  || categoryId == "" || paymentTypeId == "") {
                Swal.fire('Hatalı', 'Lütfen Bütün Boşlukları Doldurun!', 'error').then(function(){ });
            }else*/ if(paidCompanyId == payCompanyId){
                Swal.fire('Hatalı', '2 farklı şirket seçmeniz gerekiyor!', 'error').then(function(){ });
            }

            else{
                $("#next-step").trigger("click");
                $(".expiry-date").text(expiryDate);
                $(".payment-amount").text(paymentAmount + " " + paymentCurrency);
                $(".paid-company-name").text(paidCompanyName);
                $(".pay-company-name").text(payCompanyName);
                $(".category-name").text(categoryName);
                $(".document-no").text(documentNo);
                $(".document-date").text(documentDate);
                $(".invoice-date").text(invoiceDate);
                $(".description").text(description);
            }
        });
    } catch (error) {
        console.log(error);
    }
}

function postRequestOperation(){
    try {
        $("#postRequest").on("click", function(){
            var paymentRequestId = $("#postModal").find("#payment_request_id").val();
            var paymentRequestStatusId = $("#postModal").find("#paymentRequestStatusId").children("option:selected").val();
            var note = $("#postModal").find("#note").val();
            if(paymentRequestStatusId == ""){
                Swal.fire( 'Hatalı', 'Lütfen Bütün Boşlukları Doldurun!', 'info').then(function(){ });
            }
            else {
                setTimeout(() => {
                    postPaymentRequest(paymentRequestId, paymentRequestStatusId, note);
                }, 100);
            }
        });
    }
    catch (error) { }
}

function postPaymentRequest(paymentRequestId, paymentRequestStatusId, note){
    try {
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        $.ajax({
            url: '/paymentrequests/postPaymentRequest/' + paymentRequestId +'',
            type: 'POST',
            data: {
                'payment_request_status_id': paymentRequestStatusId,
                'note': note
            },
            async: false,
            dataType: 'json',
            success: function (response) {
                if (response) {
                    Swal.fire( 'Başarılı!', 'Ödeme Talebi Başarıyla Cevaplandı!', 'success').then(function(){
                        location.reload();
                    });
                }
            },

            error: function () { },
        });
    }
    catch (error) {
        console.log(error);
    }
    finally { }
}

/*function completePaymentRequest(){
    try {
        $("#completePaymentRequest").on("click", function(){
            //payment request
            setTimeout(() => {
                var mainStep = $("#tab1");
                var expiryDate = mainStep.find('#expiryDate').val(),
                    paymentAmount = mainStep.find('#paymentAmount').val(),
                    paymentCurrency = mainStep.find('#paymentCurrency').children("option:selected").val(),
                    companyId = mainStep.find('#companyId').children("option:selected").val(),
                    paymentTypeId = mainStep.find('#paymentTypeId').children("option:selected").val(),
                    documentNo = mainStep.find('#documentNo').val(),
                    documentDate = mainStep.find('#documentDate').val(),
                    invoiceDate = mainStep.find('#invoiceDate').val(),
                    note = mainStep.find('#note').val();
                addPaymentRequest(expiryDate, paymentAmount, paymentCurrency, companyId, paymentTypeId, documentNo, documentDate, invoiceDate, note)

                $("#dropzone").find("#prId").val(payment_request_id);
                setTimeout(() => {
                    $("#uploadFile").trigger("click");
                }, 100);
            }, 1000);
        });
    }
    catch(error){ }
}*/

//send Payement Request
/*
function addPaymentRequest(expiryDate, paymentAmount, paymentCurrency, companyId, paymentTypeId, documentNo, documentDate, invoiceDate, note){
    try {
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        $.ajax({
            url: '/paymentrequests/store',
            type: 'POST',
            data: {
                'expiryDate': expiryDate,
                'paymentAmount': paymentAmount,
                'paymentCurrency': paymentCurrency,
                'companyId': companyId,
                'paymentTypeId': paymentTypeId,
                'documentNo': documentNo,
                'documentDate': documentDate,
                'invoiceDate': invoiceDate,
                'note': note
            },
            async: false,
            dataType: 'json',
            success: function (response) {
                if (response) {
                    setTimeout(() => {
                        Swal.fire('Başarılı', 'Ödeme Talebi Başarıyla Oluşturuldu!', 'success').then(function(){
                            location.reload();
                        });
                    }, 1000);
                    payment_request_id = response;
                }
            },

            error: function () { },
        });
    } catch (error) {
        console.log(error);
    } finally { }
}*/


$(document).ready(function () {
    let index = 0;
    $('#newTable').DataTable({
        initComplete: function () {
            this.api()
                .columns()
                .every(function () {
                    index += 1;
                    var column = this;
                    var select = $('<select id="selectSearch'+index+'" class="select2-multiple"><option value=""> Tümü</option></select>')
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
$(document).ready(function() {
    $('.select2-multiple').select2({ placeholder: 'Tümü', dropdownAutoWidth: true, allowClear: true ,width: 'auto!important'});
 });


 $(document).ready(function() {

	$('.image-popup-vertical-fit').magnificPopup({
		type: 'image',
		closeOnContentClick: true,
		mainClass: 'mfp-img-mobile',
		image: {
			verticalFit: true
		}

	});

	$('.image-popup-fit-width').magnificPopup({
		type: 'image',
		closeOnContentClick: true,
		image: {
			verticalFit: false
		}
	});

	$('.image-popup-no-margins').magnificPopup({
		type: 'image',
		closeOnContentClick: true,
		closeBtnInside: false,
		fixedContentPos: true,
		mainClass: 'mfp-no-margins mfp-with-zoom', // class to remove default margin from left and right side
		image: {
			verticalFit: true
		},
		zoom: {
			enabled: true,
			duration: 300 // don't foget to change the duration also in CSS
		}
	});

});
document.addEventListener('DOMContentLoaded', function (e) {
    const form = document.getElementById('billModal');
    const fv = FormValidation.formValidation(form, {
        fields: {
            amount: {
                validators: {
                    numeric:{
                        message: 'Lütfen Doğru Tütar Giriniz'
                    }
                },
            },
        },
        plugins: {
            trigger: new FormValidation.plugins.Trigger(),
            bootstrap: new FormValidation.plugins.Bootstrap(),
        },
    });
});
