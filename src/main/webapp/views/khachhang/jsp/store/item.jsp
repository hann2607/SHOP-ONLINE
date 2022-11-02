<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<!-- product -->
<c:forEach var="item" items="${listSP }">

	<div class="col-md-4 col-xs-6">
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
				<form action="FavoriteServlet" method="post">
					<div class="product-btns">
						<button type="submit" class="add-to-wishlist"
							formaction="FavoriteServlet/Favorite?action=Like&proID=${item.productid}">
							<i class="fa fa-heart-o"></i><span class="tooltipp">YÊU
								THÍCH</span>
						</button>
						<button type="button" class="add-to-compare" data-toggle="modal"
							data-target="#exampleModalCenter${item.productid}">
							<i class="fa-solid fa-share"></i><span class="tooltipp">CHIA
								SẺ</span>
						</button>
						<button type="button" class="quick-view" data-toggle="modal"
							data-target="#exampleModalCenter-video${item.productid}">
							<i class="fa fa-eye"></i><span class="tooltipp">XEM NHANH</span>
						</button>
					</div>
				</form>
			</div>
			<div class="add-to-cart">
				<button class="add-to-cart-btn">
					<i class="fa fa-shopping-cart"></i> THÊM VÀO GIỎ HÀNG
				</button>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<form
		action="FavoriteServlet/Favorite?action=Share&proID=${item.productid }"
		method="post" id="form-modal-${item.productid }">
		<div class="modal fade" id="exampleModalCenter${item.productid }"
			tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLongTitle">CHIA SẺ
							SẢN PHẨM</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">

						<div class="form-group">
							<label for="exampleFormControlInput1">EMAIL</label> <input
								type="email" class="form-control" id="exampleFormControlInput1"
								placeholder="name@example.com" name="SenderMail">
						</div>
						<div class="form-group">
							<label for="exampleFormControlInput2">MẬT KHẨU EMAIL:</label> <input
								type="password" class="form-control"
								id="exampleFormControlInput2" placeholder="Mật khẩu..."
								name="SenderPass">
						</div>
						<div class="form-group">
							<label for="exampleFormControlInput3">TỚI AI:</label> <input
								type="email" class="form-control" id="exampleFormControlInput3"
								placeholder="name@example.com" name="to">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">ĐÓNG</button>
						<div class="btn btn-primary"
							onclick="document.getElementById('form-modal-${item.productid }').submit();">CHIA
							SẺ</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<div class="modal fade" id="exampleModalCenter-video${item.productid}"
		tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">XEM VIDEO</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<iframe src="https://www.youtube.com/embed/${item.video }">
					
					</iframe>
					
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">ĐÓNG</button>
					<div class="btn btn-primary"
						onclick="document.getElementById('form-modal-${item.productid }').submit();">CHIA
						SẺ</div>
				</div>
			</div>
		</div>
	</div>
</c:forEach>
<!-- /product -->