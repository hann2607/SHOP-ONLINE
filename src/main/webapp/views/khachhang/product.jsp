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
			<!-- Product main img -->
			<jsp:include page="jsp/product/main-image.jsp"></jsp:include>
			<!-- /Product main img -->

			<!-- Product thumb imgs -->
			<jsp:include page="jsp/product/thumb-image.jsp"></jsp:include>
			<!-- /Product thumb imgs -->

			<!-- Product details -->
			<jsp:include page="jsp/product/product-details.jsp"></jsp:include>
			<!-- /Product details -->

			<!-- Product tab -->
			<div class="col-md-12">
				<div id="product-tab">
					<!-- product tab nav -->
					<ul class="tab-nav">
						<li class="active"><a data-toggle="tab" href="#tab1">MÔ
								TẢ</a></li>
						<li><a data-toggle="tab" href="#tab2">CHI TIẾT SẢN PHẨM</a></li>
						<li><a data-toggle="tab" href="#tab3">ĐÁNH GIÁ (3)</a></li>
					</ul>
					<!-- /product tab nav -->

					<!-- product tab content -->
					<div class="tab-content">
						<!-- tab1  -->
						<jsp:include page="jsp/product/tabcontent-tab1.jsp"></jsp:include>
						<!-- /tab1  -->

						<!-- tab2  -->
						<jsp:include page="jsp/product/tabcontent-tab2.jsp"></jsp:include>
						<!-- /tab2  -->

						<!-- tab3  -->
						<jsp:include page="jsp/product/tabcontent-tab3.jsp"></jsp:include>
						<!-- /tab3  -->
					</div>
					<!-- /product tab content  -->
				</div>
			</div>
			<!-- /product tab -->
		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>
<!-- /SECTION -->

<!-- Section -->
<div class="section">
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">

			<div class="col-md-12">
				<div class="section-title text-center">
					<h3 class="title">SẢN PHẨM LIÊN QUAN</h3>
				</div>
			</div>

			<!-- product -->
			<jsp:include page="jsp/product/related-products.jsp"></jsp:include>
			<!-- /product -->
		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>
<!-- /Section -->
