<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<form action="admin/UserServlet" method="post">
	<div class="form-group">
		<label for="username">TÊN ĐĂNG NHẬP</label> <input type="text"
			class="form-control" id="username" placeholder="Phải lớn hơn 6 ký tự" name="username" value="${user.username }">
	</div>
	<div class="form-group">
		<label for="password">MẬT KHẨU</label> <input type="password"
			class="form-control" id="password" placeholder="Phải lớn hơn 6 ký tự" name="password" value="${user.password }">
	</div>
	<div class="form-group">
		<label for="fullname">HỌ VÀ TÊN</label> <input type="text"
			class="form-control" id="fullname" placeholder="Nguyễn Văn A" name="fullname" value="${user.fullname }">
	</div>
	<div class="form-group">
		<label for="email">EMAIL</label> <input type="email"
			class="form-control" id="email" placeholder="name@example.com" name="email" value="${user.email }">
	</div>
	<div class="form-group">
		<label for="admin">QUYỀN:  &nbsp;</label>
		<label class="radio-inline"> <input type="radio"
		name="admin" ${user.admin? 'checked': ''}>ADMIN
	</label> <label class="radio-inline"> <input type="radio"
		name="admin" ${user.admin? '': 'checked'}>USER
	</label>
	</div>
	
	<div class="row">
		<div class="col-md-2 text-center"></div>
		<div class="col-md-2 text-center">
			<button type="submit" class="btn btn-primary" formaction="admin/UserServlet/create">THÊM MỚI</button>
		</div>
		<div class="col-md-2 text-center">
			<button type="submit" class="btn btn-primary" formaction="admin/UserServlet/update">CẬP NHẬT</button>
		</div>
		<div class="col-md-2 text-center">
			<button type="submit" class="btn btn-primary" formaction="admin/UserServlet/delete">XÓA</button>
		</div>
		<div class="col-md-2 text-center">
			<button type="submit" class="btn btn-primary" formaction="admin/UserServlet/reset">LÀM MỚI</button>
		</div>
		<div class="col-md-2 text-center"></div>
	</div>
</form>