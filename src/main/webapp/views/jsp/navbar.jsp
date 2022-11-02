<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- NAVIGATION -->
<nav id="navigation">
	<!-- container -->
	<div class="container">
		<!-- responsive-nav -->
		<div id="responsive-nav">
			<!-- NAV -->
			<form action="NavbarServlet" method="post" id="my_form">
				<ul class="main-nav nav navbar-nav">
					<li class="${NavHomeSelected }"><a href="StoreServlet">TRANG
							CHỦ</a></li>
					<li class="${NavFavoritesSelected }"><a
						href="FavoriteServlet/Favorite">YÊU THÍCH</a></li>
					<li class="dropdown ${NavAdminSelected } ${sessionScope.role ? '' : 'hidden'}"><a
						class="dropdown-toggle" role="button" id="dropdownMenuLink"
						data-bs-toggle="dropdown" aria-expanded="false"> ADMIN <i
							class="fa-sharp fa-solid fa-caret-down"></i></a>

						<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
							<li><a class="dropdown-item" href="NavbarServlet/admin/Warehouse">QUẢN
									LÝ KHO</a></li>
							<li><a class="dropdown-item" href="NavbarServlet/admin/Customer">NGƯỜI
									DÙNG</a></li>
							<li><a class="dropdown-item" href="NavbarServlet/admin/Report">THỐNG
									KÊ</a></li>
						</ul></li>
				</ul>
			</form>
			<!-- /NAV -->
		</div>
		<!-- /responsive-nav -->
	</div>
	<!-- /container -->
</nav>
<!-- /NAVIGATION -->