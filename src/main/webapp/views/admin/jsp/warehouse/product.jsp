<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<!-- SECTION -->
<div class="section">
	<!-- container -->
		<!-- row -->
		<div class="row">
			<!-- Product main img -->
			<jsp:include page="main-image.jsp"></jsp:include>
			<!-- /Product main img -->

			<!-- Product thumb imgs -->
			<jsp:include page="thumb-image.jsp"></jsp:include>
			<!-- /Product thumb imgs -->

			<!-- Product details -->
			<jsp:include page="product-details.jsp"></jsp:include>
			<!-- /Product details -->

			
		</div>
		<!-- /row -->
	
	<!-- /container -->
</div>
<!-- /SECTION -->


