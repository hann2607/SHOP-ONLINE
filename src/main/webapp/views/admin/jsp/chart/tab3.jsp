<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<div class="tab-pane fade ${showtab3 }" id="contact" role="tabpanel"
	aria-labelledby="contact-tab">

	<form action="admin/ReportServlet" method="post">
		<!-- search -->
		<div class="input-group" style="margin-top: 3%; margin-bottom: 3%;">
			<input type="search" class="form-control rounded" name="search-tab3"
				placeholder="Tên sản phẩm ?" aria-label="Search"
				aria-describedby="search-addon" />
			<button type="submit" class="btn btn-outline-primary"
				formaction="admin/ReportServlet/tab3">TÌM KIẾM</button>
		</div>
		<!-- /search -->

		<!-- table -->
		<div class="card" style="margin-top: 4%;">
			<h3
				class="card-header text-center font-weight-bold text-uppercase py-4"
				style="margin-bottom: 4%;">NGƯỜI GỬI VÀ NGƯỜI NHẬN CỦA SẢN PHẨM</h3>
			<div class="card-body">
				<div id="table" class="table-editable">
					<table
						class="table table-bordered table-responsive-md table-striped text-center">
						<thead>
							<tr>
								<th class="text-center">TÊN NGƯỜI GỬI</th>
								<th class="text-center">EMAIL NGƯỜI GỬI</th>
								<th class="text-center">EMAIL NGƯỜI NHẬN</th>
								<th class="text-center">NGÀY GỬI</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="report" items="${lsReportUserShareProduct }">
								<tr>
									<td class="pt-3-half" contenteditable="true">${report.fullname }</td>
									<td class="pt-3-half" contenteditable="true">${report.senderemail }</td>
									<td class="pt-3-half" contenteditable="true">${report.receiveremail }</td>
									<td class="pt-3-half" contenteditable="true">${report.sharedate }</td>
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