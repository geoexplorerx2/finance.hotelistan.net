<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta http-equiv="X-UA-Compatible" content="IE=7">
    <meta name="robots" content="noindex">
    <title>Hotelistan Finans Yönetimi</title>
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <!--new version-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<script src="https://kit.fontawesome.com/1899ceef68.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" />
	<link href="{{ asset('assets/new/plugins/global/plugins.bundle5883.css?v=7.2.9') }}" rel="stylesheet" type="text/css" />
	<link href="{{ asset('assets/new/plugins/custom/prismjs/prismjs.bundle5883.css?v=7.2.9') }}" rel="stylesheet" type="text/css" />
	<link href="{{ asset('assets/new/css/style.bundle5883.css?v=7.2.9') }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset('assets/new/css/pages/login/classic/login-45883.css?v=7.2.9') }}" rel="stylesheet" type="text/css" />
    <!--End new version-->
</head>
<body id="kt_body" class="header-fixed header-mobile-fixed subheader-enabled sidebar-enabled page-loading">
		<div class="d-flex flex-column flex-root" style="background-image: url({{ asset('/assets/new/media/bg/bg-3.jpg') }})">
			<div class="login login-4 login-signin-on d-flex flex-row-fluid" id="kt_login">
				<div class="d-flex flex-center flex-row-fluid bgi-size-cover bgi-position-top bgi-no-repeat" style="background-image: url('../../../../../theme/html/demo10/dist/assets/media/bg/bg-3.jpg');">
					<div class="login-form text-center p-7 position-relative overflow-hidden">
						<div class="d-flex flex-center mb-15">
							<a href="#">
								<img src="{{ asset('assets/img/logo.svg') }}" class="max-h-75px" alt="" />
							</a>
						</div>
						<div class="login-signin">
							<form class="form" method="POST" action="{{ route('login') }}">
                                @csrf

								<div class="form-group mb-5">
									<input  id="email" class="form-control h-auto form-control-solid py-4 px-8 @error('email') is-invalid @enderror" type="email" placeholder="{{ __('Email Adresiniz') }}"  value="{{ old('email') }}" name="email" required autocomplete="email" autofocus/>
                                    @error('email')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
								<div class="form-group mb-5">
									<input id="password" type="password"  class="form-control h-auto form-control-solid py-4 px-8 @error('password') is-invalid @enderror" name="password" placeholder="{{ __('Şifre') }}" required autocomplete="current-password"/>
								</div>
								<div class="form-group d-flex flex-wrap justify-content-between align-items-center">
									<div class="checkbox-inline">
										<label class="checkbox m-0 text-muted">
										<input type="checkbox" name="remember" />
										<span></span>
                                        {{ __('Beni Hatırla') }}

                                    </label>
									</div>
								</div>
								<button id="kt_login_signin_submit" class="btn btn-primary font-weight-bold px-9 py-4 my-3 mx-4">{{ __('Giriş Yap') }}</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
    <script>var KTAppSettings = { "breakpoints": { "sm": 576, "md": 768, "lg": 992, "xl": 1200, "xxl": 1200 }, "colors": { "theme": { "base": { "white": "#ffffff", "primary": "#663259", "secondary": "#E5EAEE", "success": "#1BC5BD", "info": "#8950FC", "warning": "#FFA800", "danger": "#F64E60", "light": "#F3F6F9", "dark": "#212121" }, "light": { "white": "#ffffff", "primary": "#F4E1F0", "secondary": "#ECF0F3", "success": "#C9F7F5", "info": "#EEE5FF", "warning": "#FFF4DE", "danger": "#FFE2E5", "light": "#F3F6F9", "dark": "#D6D6E0" }, "inverse": { "white": "#ffffff", "primary": "#ffffff", "secondary": "#212121", "success": "#ffffff", "info": "#ffffff", "warning": "#ffffff", "danger": "#ffffff", "light": "#464E5F", "dark": "#ffffff" } }, "gray": { "gray-100": "#F3F6F9", "gray-200": "#ECF0F3", "gray-300": "#E5EAEE", "gray-400": "#D6D6E0", "gray-500": "#B5B5C3", "gray-600": "#80808F", "gray-700": "#464E5F", "gray-800": "#1B283F", "gray-900": "#212121" } }, "font-family": "Poppins" };</script>
	<script src="{{ asset('assets/new/plugins/global/plugins.bundle5883.js?v=7.2.9') }}"></script>
	<script src="{{ asset('assets/new/plugins/custom/prismjs/prismjs.bundle5883.js?v=7.2.9') }}"></script>
	<script src="{{ asset('assets/new/js/scripts.bundle5883.js?v=7.2.9') }}"></script>
    <script src="{{ asset('assets/new/js/pages/custom/login/login-general5883.js?v=7.2.9') }}"></script>

    <script type="text/javascript" src="{{ asset('assets/js/jquery.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('assets/js/app.js') }}" defer></script>
</body>
</html>
