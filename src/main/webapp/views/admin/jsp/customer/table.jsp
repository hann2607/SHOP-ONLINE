<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<form action="admin/UserServlet" method="post">
	<div class="card" style="margin-top: 4%;">
		<h3
			class="card-header text-center font-weight-bold text-uppercase py-4"
			style="margin-bottom: 4%;">QUẢN LÝ NGƯỜI DÙNG</h3>
		<div class="card-body">
			<div id="table" class="table-editable">
				<table
					class="table table-bordered table-responsive-md table-striped text-center">
					<thead>
						<tr>
							<th class="text-center">TÊN ĐĂNG NHẬP</th>
							<th class="text-center">MẬT KHẨU</th>
							<th class="text-center">HỌ VÀ TÊN</th>
							<th class="text-center">EMAIL</th>
							<th class="text-center">ADMIN</th>
							<th class="text-center">CHỈNH SỬA</th>
							<th class="text-center">XÓA</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="user" items="${lsUser }">
						<tr>
							<td class="pt-3-half" contenteditable="true">${user.username }</td>
							<td class="pt-3-half" contenteditable="true">${user.password }</td>
							<td class="pt-3-half" contenteditable="true">${user.fullname }</td>
							<td class="pt-3-half" contenteditable="true">${user.email }</td>
							<td class="pt-3-half" contenteditable="true">${user.admin }</td>
							<td><a href="admin/UserServlet/edit?username=${user.username}"><span class="table-remove"><button type="button"
										class="btn btn-danger btn-rounded btn-sm my-0">Sửa</button></span></a></td>
							<td><a href="admin/UserServlet/delete?username=${user.username}"><span class="table-remove"><button type="button"
										class="btn btn-danger btn-rounded btn-sm my-0">Xóa</button></span></a></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</form>