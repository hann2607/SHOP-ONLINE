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

			<div class="col-md-7">
				<!-- Billing Details -->
				<jsp:include page="jsp/checkout/billing-details.jsp"></jsp:include>
				<!-- /Billing Details -->
			</div>

			<!-- Order Details -->
			<jsp:include page="jsp/checkout/order-details.jsp"></jsp:include>
			<!-- /Order Details -->
		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>
<!-- /SECTION -->
