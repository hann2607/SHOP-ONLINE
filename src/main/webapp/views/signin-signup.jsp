<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://kit.fontawesome.com/f757c7087e.js"
	crossorigin="anonymous"></script>
<title>ĐĂNG NHẬP & ĐĂNG KÝ</title>
<base href="/ASM_JAVA4/" />
<!-- css -->
<link rel="stylesheet" type="text/css"
	href="views/signin-signup/css/signin-signup.css">

<!-- favicon -->
<link rel="apple-touch-icon" sizes="57x57"
	href="views/signin-signup/img/favicon/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60"
	href="views/signin-signup/img/favicon/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="views/signin-signup/img/favicon/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76"
	href="views/signin-signup/img/favicon/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="views/signin-signup/img/favicon/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120"
	href="views/signin-signup/img/favicon/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144"
	href="views/signin-signup/img/favicon/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152"
	href="views/signin-signup/img/favicon/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180"
	href="views/signin-signup/img/favicon/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"
	href="views/signin-signup/img/favicon/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="views/signin-signup/img/favicon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="views/signin-signup/img/favicon/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="views/signin-signup/img/favicon/favicon-16x16.png">
<link rel="manifest"
	href="views/signin-signup/img/favicon/manifest.json">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage"
	content="views/signin-signup/img/favicon/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">

</head>
<body>
	<div class="container ${changeSignUpForm }">
		<div class="forms-container">
			<div class="signin-signup">
				<!-- SIGNIN -->
				<jsp:include page="signin-signup/jsp/signin.jsp"></jsp:include>
				<!-- /SIGNIN -->

				<!-- SIGNUP -->
				<jsp:include page="signin-signup/jsp/signup.jsp"></jsp:include>
				<!-- /SIGNUP -->
			</div>
		</div>

		<div class="panels-container">
			<div class="panel left-panel">
				<div class="content">
					<h3>Tạo mới tài khoản?</h3>
					<p>
						Nếu bạn chưa có tài khoản hãy nhấn vào nút bên dưới. <br>
						Nhập thông tin cá nhân của bạn và bắt đầu hành trình với chúng
						tôi.
					</p>
					<button class="btn transparent" id="sign-up-btn">Đăng ký</button>
				</div>
				<img src="views/signin-signup/img/signin-signup/login.svg" alt=""
					class="image" />
			</div>

			<div class="panel right-panel">
				<div class="content">
					<h3>Nếu bạn đã có tài khoản?</h3>
					<p>Hãy nhấn vào nút bên dưới để đăng nhập với quyền người dùng.</p>
					<button class="btn transparent" id="sign-in-btn">Đăng nhập</button>
				</div>
				<img src="views/signin-signup/img/signin-signup/register.svg" alt=""
					class="image" />
			</div>
		</div>
	</div>

</body>
<script type="text/javascript"
	src="views/signin-signup/js/signin-signup.js"></script>
</html>