<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<!-- product -->
<c:forEach var="item" items="${lsProduct }">
	<div class="col-md-3 col-xs-6">
		<div class="product">
			<div class="product-img"
				onclick="document.getElementById('form-product-${item.productid }').submit();">
				<img src="views/khachhang/img/product/${item.imageMain }" alt="">
				<div class="product-label">
					<c:if test="${item.sale > 0}">
						<span class="sale">-${item.sale }%</span>
					</c:if>
					<span class="new">MỚI</span>
				</div>
			</div>
			<div class="product-body">
				<form action="ProductServlet" method="post"
					id="form-product-${item.productid }">
					<input type="hidden" value="${item.productid }" name="productID" />
					<p class="product-category"
						onclick="document.getElementById('form-product-${item.productid }').submit();">${item.category }</p>
					<h3 class="product-name"
						onclick="document.getElementById('form-product-${item.productid }').submit();">
						<a>${item.name }</a>
					</h3>
					<h4 class="product-price"
						onclick="document.getElementById('form-product-${item.productid }').submit();">
						<fmt:formatNumber type="number" pattern="###,###,###"
							value="${item.price }" />
						VNĐ <br />
						<del class="product-old-price">
							<fmt:formatNumber type="number" pattern="###,###,###"
								value="${item.oldprice }" />
							VNĐ
						</del>
					</h4>
					<div class="product-rating"
						onclick="document.getElementById('form-product-${item.productid }').submit();">
						<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i> <i class="fa fa-star"></i> <i
							class="fa fa-star"></i>
					</div>
				</form>
				<div class="product-btns">
					<button class="add-to-wishlist">
						<i class="fa fa-heart-o"></i><span class="tooltipp">YÊU
							THÍCH</span>
					</button>
					<button class="add-to-compare">
						<i class="fa-solid fa-share"></i></i><span class="tooltipp">CHIA
							SẺ</span>
					</button>
					<button class="quick-view">
						<i class="fa fa-eye"></i><span class="tooltipp">XEM NHANH</span>
					</button>
				</div>
			</div>
			<div class="add-to-cart">
				<button class="add-to-cart-btn">
					<i class="fa fa-shopping-cart"></i> THÊM VÀO GIỎ HÀNG
				</button>
			</div>
		</div>
	</div>
	<!-- /product -->
</c:forEach>