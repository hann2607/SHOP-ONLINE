<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<div class="tab-pane fade ${showtab2 }" id="profile" role="tabpanel"
	aria-labelledby="profile-tab">

	<form action="admin/ReportServlet" method="post">
		<!-- search -->
		<div class="input-group" style="margin-top: 3%; margin-bottom: 3%;">
			<input type="search" class="form-control rounded" name="search-tab2"
				placeholder="Tên sản phẩm ?" aria-label="Search"
				aria-describedby="search-addon" />
			<button type="submit" class="btn btn-outline-primary"
				formaction="admin/ReportServlet/tab2">TÌM KIẾM</button>
		</div>
		<!-- /search -->

		<!-- table -->
		<div class="card" style="margin-top: 4%;">
			<h3
				class="card-header text-center font-weight-bold text-uppercase py-4"
				style="margin-bottom: 4%;">NGƯỜI YÊU THÍCH THEO SẢN PHẨM</h3>
			<div class="card-body">
				<div id="table" class="table-editable">
					<table
						class="table table-bordered table-responsive-md table-striped text-center">
						<thead>
							<tr>
								<th class="text-center">TÊN ĐĂNG NHẬP</th>
								<th class="text-center">HỌ VÀ TÊN</th>
								<th class="text-center">EMAIL</th>
								<th class="text-center">NGÀY THÍCH</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="report" items="${lsReportUserByProduct }">
								<tr>
									<td class="pt-3-half" contenteditable="true">${report.username }</td>
									<td class="pt-3-half" contenteditable="true">${report.fullname }</td>
									<td class="pt-3-half" contenteditable="true">${report.email }</td>
									<td class="pt-3-half" contenteditable="true">${report.likedate }</td>			
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- /table -->
	</form>

</div>