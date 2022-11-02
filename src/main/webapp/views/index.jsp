<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>${page.title}</title>
<base href="/ASM_JAVA4/" />
<!-- Google font -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700"
	rel="stylesheet">

<!-- Bootstrap -->
<link type="text/css" rel="stylesheet"
	href="views/khachhang/css/bootstrap.min.css" />


<!-- Slick -->
<link type="text/css" rel="stylesheet"
	href="views/khachhang/css/slick.css" />
<link type="text/css" rel="stylesheet"
	href="views/khachhang/css/slick-theme.css" />

<!-- nouislider -->
<link type="text/css" rel="stylesheet"
	href="views/khachhang/css/nouislider.min.css" />

<!-- Font Awesome Icon -->
<link rel="stylesheet" href="views/khachhang/css/font-awesome.min.css">
<script src="https://kit.fontawesome.com/f757c7087e.js"
	crossorigin="anonymous"></script>

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet"
	href="views/khachhang/css/style.css" />

<!-- favicon -->
<link rel="apple-touch-icon" sizes="57x57"
	href="views/khachhang/img/favicon/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60"
	href="views/khachhang/img/favicon/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="views/khachhang/img/favicon/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76"
	href="views/khachhang/img/favicon/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="views/khachhang/img/favicon/apple-icon-114x114.png">
<link rel="views/apple-touch-icon" sizes="120x120"
	href="views/khachhang/img/favicon/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144"
	href="views/khachhang/img/favicon/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152"
	href="views/khachhang/img/favicon/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180"
	href="views/khachhang/img/favicon/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"
	href="views/khachhang/img/favicon/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="views/khachhang/img/favicon/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="views/khachhang/img/favicon/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="views/khachhang/img/favicon/favicon-16x16.png">
<link rel="manifest" href="views/khachhang/img/favicon/manifest.json">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage"
	content="views/khachhang/img/favicon/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">
</head>

<body ${bodyClass} ${bodyStyle }>
	<!-- 	HEADER -->
	<jsp:include page="jsp/header.jsp"></jsp:include>
	<!-- 	/HEADER -->

	<!-- NAVIGATION -->
	
		<jsp:include page="jsp/navbar.jsp"></jsp:include>

	<!-- /NAVIGATION -->

	<!-- BREADCRUMB -->
	<jsp:include page="jsp/breadcrumb.jsp"></jsp:include>
	<!-- /BREADCRUMB -->

	<!-- SECTION -->
	<jsp:include page="${page.contentUrl}"></jsp:include>
	<!-- /SECTION -->

	<!-- NEWSLETTER -->
	<jsp:include page="jsp/subscribe.jsp"></jsp:include>
	<!-- /NEWSLETTER -->

	<!-- FOOTER -->
	<jsp:include page="jsp/footer.jsp"></jsp:include>
	<!-- /FOOTER -->

	<!-- jQuery Plugins -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
		crossorigin="anonymous"></script>

	<script src="views/khachhang/js/jquery.min.js"></script>
	<script src="views/khachhang/js/bootstrap.min.js"></script>
	<script src="views/khachhang/js/slick.min.js"></script>
	<script src="views/khachhang/js/nouislider.min.js"></script>
	<script src="views/khachhang/js/jquery.zoom.min.js"></script>
	<script src="views/khachhang/js/main.js"></script>
	
	${divColorBlack}
</body>

</html>