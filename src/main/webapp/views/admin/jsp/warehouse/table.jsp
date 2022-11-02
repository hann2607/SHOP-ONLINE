<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!-- Editable table -->
<form action="admin/WarehouseServlet" method="post">
	<div class="card" style="margin-top: 4%;">
		<h3
			class="card-header text-center font-weight-bold text-uppercase py-4"
			style="margin-bottom: 4%;">QUẢN LÝ KHO</h3>
		<div class="card-body">
			<div id="table" class="table-editable">
				<table
					class="table table-bordered table-responsive-md table-striped text-center">
					<thead>
						<tr>
							<th class="text-center">MÃ SẢN PHẨM</th>
							<th class="text-center">TÊN SẢN PHẨM</th>
							<th class="text-center">LOẠI SẢN PHẨM</th>
							<th class="text-center">GIÁ CŨ</th>
							<th class="text-center">GIÁ MỚI</th>
							<th class="text-center">SỐ LƯỢNG</th>
							<th class="text-center">TÌNH TRẠNG</th>
							<th class="text-center">SỬA</th>
							<th class="text-center">XÓA</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="product" items="${lsProduct }">
							<tr>
								<td class="pt-3-half" contenteditable="true">${product.productid }</td>
								<td class="pt-3-half" contenteditable="true">${product.name }</td>
								<td class="pt-3-half" contenteditable="true">${product.category }</td>
								<td class="pt-3-half" contenteditable="true"><fmt:formatNumber type="number" pattern="###,###,###"
					value="${product.oldprice }" /></td>
								<td class="pt-3-half" contenteditable="true"><fmt:formatNumber type="number" pattern="###,###,###"
						value="${product.price }" /></td>
								<td class="pt-3-half" contenteditable="true">${product.quantity }</td>
								<td class="pt-3-half" contenteditable="true"><c:choose>
										<c:when test="${product.status==true}">
											CÒN HÀNG
											<br />
										</c:when>
										<c:otherwise>
											HẾT HÀNG
											<br />
										</c:otherwise>
									</c:choose></td>
								<td><a href="admin/WarehouseServlet/edit?productid=${product.productid}"><span class="table-remove"><button type="button"
											class="btn btn-danger btn-rounded btn-sm my-0">Sửa</button></span></a></td>
								<td><a href="admin/WarehouseServlet/delete?productid=${product.productid}"><span class="table-remove"><button type="button"
											class="btn btn-danger btn-rounded btn-sm my-0">Xóa</button></span></a></td>
								
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</form>
<!-- Editable table -->