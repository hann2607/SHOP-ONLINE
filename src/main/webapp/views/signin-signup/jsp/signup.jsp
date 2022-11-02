<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!-- SIGNUP -->
<form action="RegisterServlet" method="post" class="sign-up-form">
	<h2 class="title">ĐĂNG KÝ</h2>
	<div class="input-field">
		<i class="fas fa-user"></i> <input type="text" id="username"
			placeholder="Tên đăng nhập" name="username" value="${user.username }"/>
	</div>
	<c:if test="${not empty errorUsernameRegister }">
		<label for="username"
			style="color: #D10024; max-width: 300px; width: 100%; padding: 0 0.4rem; text-align: center;"><strong>${errorUsernameRegister }</strong></label>
	</c:if>
	<div class="input-field">
		<i class="fas fa-lock"></i> <input type="password" value="${user.password }" id="password"
			placeholder="Mật khẩu" name="password" />
	</div>
	<c:if test="${not empty errorPasswordRegister }">
		<label for="password"
			style="color: #D10024; max-width: 300px; width: 100%; padding: 0 0.4rem; text-align: center;"><strong>${errorPasswordRegister }</strong></label>
	</c:if>
	<div class="input-field">
		<i class="fas fa-lock"></i> <input type="password" value="${rePassword }" id="rePassword"
			placeholder="Nhập lại mật khẩu" name="rePassword" />
	</div>
	<c:if test="${not empty errorRePasswordRegister }">
		<label for="rePassword"
			style="color: #D10024; max-width: 300px; width: 100%; padding: 0 0.4rem; text-align: center;"><strong>${errorRePasswordRegister }</strong></label>
	</c:if>
	<div class="input-field">
		<i class="fas fa-user"></i> <input type="text" placeholder="Họ và tên" value="${user.fullname }"
			name="fullname" id="fullname"/>
	</div>
	<c:if test="${not empty errorFullNameRegister }">
		<label for="fullname"
			style="color: #D10024; max-width: 300px; width: 100%; padding: 0 0.4rem; text-align: center;"><strong>${errorFullNameRegister }</strong></label>
	</c:if>
	<div class="input-field">
		<i class="fas fa-envelope"></i> <input type="email" placeholder="Email" value="${user.email }"
			name="email" id="email"/>
	</div>
	<c:if test="${not empty errorEmailRegister }">
		<label for="email"
			style="color: #D10024; max-width: 300px; width: 100%; padding: 0 0.4rem; text-align: center;"><strong>${errorEmailRegister }</strong></label>
	</c:if>
	<input type="submit" value="Đăng ký" class="btn solid"
		formaction="RegisterServlet/Register" />
	<c:if test="${not empty errorRegister }">
		<label 
			style="color: #D10024; max-width: 300px; width: 100%; padding: 0 0.4rem; text-align: center;"><strong>${errorRegister }</strong></label>
	</c:if>
	<c:if test="${not empty registerSuccess }">
		<label 
			style="color: #3CB371; max-width: 300px; width: 100%; padding: 0 0.4rem; text-align: center;"><strong>${registerSuccess }</strong></label>
	</c:if>
	<p class="social-text">Hoặc đăng ký bằng</p>
	<div class="social-media">
		<a href="#" class="social-icon"> <i class="fa-brands fa-facebook"></i>
		</a> <a href="#" class="social-icon"> <i
			class="fa-brands fa-square-twitter"></i>
		</a> <a href="#" class="social-icon"> <i class="fa-brands fa-google"></i>
		</a> <a href="#" class="social-icon"> <i
			class="fa-brands fa-square-instagram"></i>
		</a>
	</div>
</form>
<!-- /SIGNUP -->