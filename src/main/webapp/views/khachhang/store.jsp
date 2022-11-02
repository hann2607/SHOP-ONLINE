<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!-- SECTION -->
<div class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">
			<!-- ASIDE -->
			<div id="aside" class="col-md-3">
				<!-- aside Widget -->
				<jsp:include page="../jsp/categories.jsp"></jsp:include>
				<!-- /aside Widget -->

				<!-- aside Widget -->
				<jsp:include page="../jsp/production-companies.jsp"></jsp:include>
				<!-- /aside Widget -->

				<!-- aside Widget -->
				<div class="aside">
					<h3 class="aside-title">BÁN CHẠY NHẤT</h3>
					<jsp:include page="../jsp/top-product.jsp"></jsp:include>
				</div>

				<!-- /aside Widget -->
			</div>
			<!-- /ASIDE -->

			<!-- STORE -->
			<div id="store" class="col-md-9">
				<!-- store top filter -->
				<jsp:include page="../jsp/sort.jsp"></jsp:include>
				<!-- /store top filter -->

				<!-- store products -->
				<div class="row">
					<!-- product -->
					<jsp:include page="jsp/store/item.jsp"></jsp:include>
					<!-- /product -->
				</div>
				<!-- /store products -->

				<!-- store bottom filter -->
				<jsp:include page="jsp/store/quantity-pages.jsp"></jsp:include>
				<!-- /store bottom filter -->
			</div>
			<!-- /STORE -->
		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>
<!-- /SECTION -->

