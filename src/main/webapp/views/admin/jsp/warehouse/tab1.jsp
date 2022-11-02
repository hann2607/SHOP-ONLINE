<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<!-- tab1  -->
<div id="tab1" class="tab-pane fade in active align-middle">
	<div class="row">
		<div class="col-md-12 text-center">
			<div class="row">
				<div class="col-md-4 col-xs-6"></div>
				<div class="col-md-4 col-xs-6">
					<div class="product">
						<div class="product-img">
							<img src="views/khachhang/img/product/${product.imageMain }" alt="">
							<div class="product-label">
								<c:if test="${product.sale > 0}">
									<span class="sale">-${product.sale }%</span>
								</c:if>
								<span class="new">MỚI</span>
							</div>
						</div>
						<div class="product-body">
							<input type="hidden" value="${product.productid }" name="productID" />
							<p class="product-category">${product.category }</p>
							<h3 class="product-name">
								<a><c:out value="${param.abc}"></c:out></a>
							</h3>
							<h4 class="product-price">
								<fmt:formatNumber type="number" pattern="###,###,###"
									value="${product.price }" />
								VNĐ <br />
								<del class="product-old-price">
									<fmt:formatNumber type="number" pattern="###,###,###"
										value="${product.oldprice }" />
									VNĐ
								</del>
							</h4>
							<div class="product-rating">
								<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i> <i class="fa fa-star"></i> <i
									class="fa fa-star"></i>
							</div>

							<div class="product-btns">
								<button class="add-to-wishlist">
									<i class="fa fa-heart-o"></i><span class="tooltipp">YÊU
										THÍCH</span>
								</button>
								<button class="add-to-compare">
									<i class="fa-solid fa-share"></i><span class="tooltipp">CHIA
										SẺ</span>
								</button>
								<button class="quick-view" data-toggle="modal"
									data-target="#exampleModalCenter">
									<i class="fa fa-eye"></i><span class="tooltipp">XEM
										NHANH</span>
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
				<div class="col-md-4 col-xs-6"></div>
			</div>
		</div>
	</div>
</div>
<!-- /tab1  -->
