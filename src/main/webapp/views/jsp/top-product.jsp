<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!-- aside Widget -->
<c:forEach var="item" items="${listTop3Product }">
	<form action="ProductServlet" method="post"
		id="form-product-${item.productid }">
		<input type="hidden" value="${item.productid }" name="productID" />
		<div class="product-widget" onclick="document.getElementById('form-product-${item.productid }').submit();">
			<div class="product-img">
				<img src="views/khachhang/img/product/${item.image1 }" alt="">
			</div>
			<div class="product-body">
				<p class="product-category">${item.category }</p>
				<h3 class="product-name">
					<a>${item.name}</a>
				</h3>
				<h4 class="product-price">
					<fmt:formatNumber type="number" pattern="###,###,###"
						value="${item.price }" />
					VNĐ <br />
					<del class="product-old-price">
						<fmt:formatNumber type="number" pattern="###,###,###"
							value="${item.oldprice }" />
						VNĐ
					</del>
				</h4>
			</div>
		</div>
	</form>
</c:forEach>
<!-- /aside Widget -->