<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!-- HEADER -->
<header>
	<!-- TOP HEADER -->
	<div id="top-header">
		<div class="container">
			<ul class="header-links pull-left">
				<li><a><i class="fa fa-phone"></i> +84 123 456 789</a></li>
				<li><a><i class="fa fa-envelope-o"></i>
						hannnps19480@fpt.edu.vn</a></li>
				<li><a><i class="fa fa-map-marker"></i> Quận 12, TP Hồ Chí
						Minh</a></li>
			</ul>
			<ul class="header-links pull-right">
				<li><a><i class="fa fa-dollar"></i> VNĐ</a></li>
				<li>
					<%
					String s = request.getAttribute("jakarta.servlet.forward.request_uri").toString();
					if(!s.contains("Login")) {
						String annotation = s.substring(s.indexOf("/", 2) + 1, s.length());
						HttpSession session2 = request.getSession();
						session2.setAttribute("pageUrl", annotation);
					}

					if (session.getAttribute("username") == null) {
					%> <a href="/ASM_JAVA4/LoginServlet?from=${sessionScope.pageUrl}"><i
						class="fa fa-user-o"></i>ĐĂNG NHẬP</a> <%
 					} else {
					%> <a><i class="fa fa-user-o"></i>${sessionScope.username}</a> <a
						href="/ASM_JAVA4/LoginServlet?from=${sessionScope.pageUrl}"> | Đăng Xuất</a> <%
 					}
 					%>
				</li>
			</ul>
		</div>
	</div>
	<!-- /TOP HEADER -->

	<!-- MAIN HEADER -->
	<div id="header">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<!-- LOGO -->
				<div class="col-md-3">
					<div class="header-logo">
						<a href="#" class="logo"> <img
							src="views/khachhang/img/logo.png" alt="">
						</a>
					</div>
				</div>
				<!-- /LOGO -->

				<!-- SEARCH BAR -->
				<div class="col-md-6">
					<div class="header-search">
						<form>
							<select class="input-select">
								<option value="0">DANH MỤC</option>
								<option value="1">PC</option>
								<option value="1">LAPTOP</option>
								<option value="1">KHÁC</option>
							</select> <input class="input" placeholder="Nhập để tìm kiếm">
							<button class="search-btn">TÌM KIẾM</button>
						</form>
					</div>
				</div>
				<!-- /SEARCH BAR -->

				<!-- ACCOUNT -->
				<div class="col-md-3 clearfix">
					<div class="header-ctn">
						<!-- Wishlist -->
						<div>
							<a href="#"> <i class="fa fa-heart-o"></i> <span>Yêu
									thích</span>
								<div class="qty">2</div>
							</a>
						</div>
						<!-- /Wishlist -->

						<!-- Cart -->
						<div class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown"
								aria-expanded="true"> <i class="fa fa-shopping-cart"></i> <span>Giỏ
									hàng</span>
								<div class="qty">2</div>
							</a>
							<div class="cart-dropdown">
								<div class="cart-list">
									<div class="product-widget">
										<div class="product-img">
											<img src="./img/product01.png" alt="">
										</div>
										<div class="product-body">
											<h3 class="product-name">
												<a href="#">LAPTOP BRAVO 15</a>
											</h3>
											<h4 class="product-price">
												<span class="qty">1x</span>18.999.000 VNĐ
											</h4>
										</div>
										<button class="delete">
											<i class="fa fa-close"></i>
										</button>
									</div>

									<div class="product-widget">
										<div class="product-img">
											<img src="./img/product02.png" alt="">
										</div>
										<div class="product-body">
											<h3 class="product-name">
												<a href="#">TAI NGHE GAMING</a>
											</h3>
											<h4 class="product-price">
												<span class="qty">3x</span>599.000 VNĐ
											</h4>
										</div>
										<button class="delete">
											<i class="fa fa-close"></i>
										</button>
									</div>
								</div>
								<div class="cart-summary">
									<small>3 Sản phẩm đã chọn</small>
									<h5>TỔNG TIỀN: 19.598.000 VNĐ</h5>
								</div>
								<div class="cart-btns">
									<a href="#">XÓA HẾT</a> <a href="checkout.jsp">THANH TOÁN <i
										class="fa fa-arrow-circle-right"></i></a>
								</div>
							</div>
						</div>
						<!-- /Cart -->

						<!-- Menu Toogle -->
						<div class="menu-toggle">
							<a href="#"> <i class="fa fa-bars"></i> <span>Menu</span>
							</a>
						</div>
						<!-- /Menu Toogle -->
					</div>
				</div>
				<!-- /ACCOUNT -->
			</div>
			<!-- row -->
		</div>
		<!-- container -->
	</div>
	<!-- /MAIN HEADER -->
</header>
<!-- /HEADER -->