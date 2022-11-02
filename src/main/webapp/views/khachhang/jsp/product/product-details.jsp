<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!-- Product details -->
<div class="col-md-5">
	<div class="product-details">
		<h2 class="product-name">${product.name }</h2>
		<div>
			<div class="product-rating">
				<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
					class="fa fa-star"></i> <i class="fa fa-star"></i> <i
					class="fa fa-star-o"></i>
			</div>
			<a class="review-link" href="#">10 Đánh giá | Thêm đánh giá của
				bạn.</a>
		</div>
		<div>
			<h3 class="product-price">
				<fmt:formatNumber type="number" pattern="###,###,###"
					value="${product.price }" />
				VNĐ
				<del class="product-old-price">
					<fmt:formatNumber type="number" pattern="###,###,###"
						value="${product.oldprice }" />
					VNĐ
				</del>
			</h3>
			
			<c:choose>
				<c:when test="${product.status==true}">
					<span class="product-available">CÒN HÀNG</span>
					<br />
				</c:when>
				<c:otherwise>
					<span class="product-available">HẾT HÀNG</span>
					<br />
				</c:otherwise>
			</c:choose>

		</div>
		<p>
			<strong>THÔNG SỐ KỸ THUẬT</strong> <br> 
			<c:if test="${not empty specification.cpu }"><strong>CPU :</strong> ${specification.cpu }<br></c:if>
			<c:if test="${not empty specification.graphicsCard }"><strong>CARD ĐỒ HỌA:</strong> ${specification.graphicsCard } <br> </c:if>
			<c:if test="${not empty specification.ram }"><strong>RAM:</strong> ${specification.ram } <br></c:if>
			<c:if test="${not empty specification.hardDrive }"><strong>Ổ CỨNG:</strong> ${specification.hardDrive } <br></c:if>
			<c:if test="${not empty specification.screen }"><Strong>MÀN HÌNH:</Strong> ${specification.screen } <br> </c:if>
			<c:if test="${not empty specification.network }"><Strong>MẠNG:</Strong> ${specification.network } <br> </c:if>
			<c:if test="${not empty specification.gateway }"><Strong>CỔNG KẾT NỐI:</Strong> ${specification.gateway }<br> </c:if>
			<c:if test="${not empty specification.win }"><Strong>HỆ ĐIỀU HÀNH:</Strong> ${specification.win } <br> </c:if>
			<c:if test="${not empty specification.pin }"><Strong>PIN:</Strong> ${specification.pin } <br> </c:if>
			<c:if test="${not empty specification.weight }"><Strong>TRỌNG LƯỢNG:</Strong> ${specification.weight }<br>  </c:if>
			<c:if test="${not empty specification.bluetooth }"><Strong>BLUETOOTH:</Strong> ${specification.bluetooth }<br>  </c:if>
		</p>
		<div class="product-options">
			<label> Màu: <select class="input-select">
					<option value="0">Đen</option>
					<option value="1">Xanh</option>
					<option value="1">Đỏ</option>
					<option value="1">Trắng</option>
			</select>
			</label>
		</div>

		<div class="add-to-cart">
			<div class="qty-label">
				Số lượng:
				<div class="input-number">
					<input type="number"> <span class="qty-up">+</span> <span
						class="qty-down">-</span>
				</div>
			</div>
			<button class="add-to-cart-btn">
				<i class="fa fa-shopping-cart"></i> THÊM VÀO GIỎ HÀNG
			</button>
		</div>

		<ul class="product-btns">
			<li><a href="#"><i class="fa fa-heart-o"></i> YÊU THÍCH</a></li>
		</ul>

		<ul class="product-links">
			<li>THỂ LOẠI:</li>
			<li><a>${product.category }</a></li>
		</ul>

		<ul class="product-links">
			<li>CHIA SẺ:</li>
			<li><a href="#"><i class="fa fa-facebook"></i></a></li>
			<li><a href="#"><i class="fa fa-twitter"></i></a></li>
			<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
			<li><a href="#"><i class="fa fa-envelope"></i></a></li>
		</ul>

	</div>
</div>
<!-- /Product details -->