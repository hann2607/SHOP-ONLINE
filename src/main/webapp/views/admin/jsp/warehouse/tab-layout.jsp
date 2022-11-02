<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!-- Product tab -->
<div class="col-md-12">
	<div id="product-tab" style="margin-top: 10px;">
		<!-- product tab nav -->
		<ul class="tab-nav">
			<li class="active"><a data-toggle="tab" href="#tab1">SẢN PHẨM</a></li>
			<li><a data-toggle="tab" href="#tab2">CHI TIẾT SẢN PHẨM</a></li>
		</ul>
		<!-- /product tab nav -->

		<!-- product tab content -->
		<div class="tab-content">
			<!-- tab1  -->
			<jsp:include page="tab1.jsp"></jsp:include>
			<!-- /tab1  -->

			<!-- tab2  -->
			<jsp:include page="tab2.jsp"></jsp:include>
			<!-- /tab2  -->
		</div>
		<!-- /product tab content  -->
	</div>
</div>
<!-- /product tab -->