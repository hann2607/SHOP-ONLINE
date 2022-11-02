<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<div class="tab-pane fade ${showtab1 }" id="home" role="tabpanel"
	aria-labelledby="home-tab">

	<form action="admin/ReportServlet" method="post">
		<!-- table -->
		<div class="card" style="margin-top: 4%;">
			<h3
				class="card-header text-center font-weight-bold text-uppercase py-4"
				style="margin-bottom: 4%;">SỐ NGƯỜI YÊU THÍCH TỪNG SẢN PHẨM</h3>
			<div class="row">
				<div class="col-md-10"></div>
				<div class="col-md-2">
					<button type="submit" class="btn btn-primary" formaction="admin/ReportServlet/tab1">REFRESH</button>
				</div>
			</div>

			<div class="card-body" style="margin-top: 4%;">
				<div id="table" class="table-editable">
					<table
						class="table table-bordered table-responsive-md table-striped text-center">
						<thead>
							<tr>
								<th class="text-center">TÊN SẢN PHẨM</th>
								<th class="text-center">SỐ LƯỢT THÍCH</th>
								<th class="text-center">NGÀY THÍCH CŨ NHẤT</th>
								<th class="text-center">NGÀY THÍCH MỚI NHẤT</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="report" items="${ReportFavoriteByProduct }">
								<tr>
									<td class="pt-3-half" contenteditable="true">${report.name }</td>
									<td class="pt-3-half" contenteditable="true">${report.likes }</td>
									<td class="pt-3-half" contenteditable="true">${report.oldest }</td>
									<td class="pt-3-half" contenteditable="true">${report.newest }</td>
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