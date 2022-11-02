<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!-- SIGNIN -->
<form action="LoginServlet" method="post" class="sign-in-form">
<input type="hidden" name="from" value="${pageContext.servletContext.contextPath}">
	<h2 class="title">ĐĂNG NHẬP</h2>
	<div class="input-field">
		<i class="fas fa-user"></i> <input type="text"
			placeholder="Tên đăng nhập" name="usernameLogin" id="usernameLogin"
			value="${userLogin.username }" />

	</div>
	<c:if test="${not empty errorUsernameLogin }">
		<label for="usernameLogin"
			style="color: #D10024; max-width: 300px; width: 100%; padding: 0 0.4rem; text-align: center;"><strong>${errorUsernameLogin }</strong></label>
	</c:if>

	<div class="input-field">
		<i class="fas fa-user"></i> <input type="password" id="passwordLogin"
			value="${userLogin.password }" placeholder="Mật khẩu" name="passwordLogin" />
	</div>
	<c:if test="${not empty errorPasswordLogin }">
		<label for="passwordLogin"
			style="color: #D10024; max-width: 300px; width: 100%; padding: 0 0.4rem; text-align: center;"><strong>${errorPasswordLogin }</strong></label>
	</c:if>
	<input type="submit" value="Đăng nhập" class="btn solid"
		formaction="LoginServlet/Login" />
	<c:if test="${not empty errorLogin }">
		<label style="color: #D10024; max-width: 300px; width: 100%; padding: 0 0.4rem; text-align: center;"><strong>${errorLogin }</strong></label>
	</c:if>
	<p class="social-text">Hoặc đăng nhập bằng</p>
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
<!-- /SIGNIN -->