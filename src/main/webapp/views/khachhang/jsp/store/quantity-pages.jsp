<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- store bottom filter -->
<div class="store-filter clearfix">
	<span class="store-qty">Đang hiển thị
		${quantityProductOnPageNow} sản phẩm</span>
	<ul class="store-pagination">
		<li><a href="#"><i class="fa fa-angle-left"></i></a></li>
		<%
		String s = request.getAttribute("jakarta.servlet.forward.request_uri").toString();
		String annotation = s.substring(s.indexOf("/", 2) + 1, s.length());
		request.setAttribute("pageUrl", annotation);
		int quantityPage = Integer.valueOf(request.getAttribute("quantityPage").toString());
		for (int i = 1; i <= quantityPage; i += 1) {
			if (request.getParameter("page") != null && !request.getParameter("page").equals("")) {
				if (Integer.valueOf(request.getParameter("page")) == i) {
		%>
		<tr>
			<li class="active"><a href="${pageUrl }?page=<%=i%>"><%=i%></a></li>
		</tr>
		<%
		} else {
		%>
		<tr>
			<li><a href="${pageUrl }?page=<%=i%>"><%=i%></a></li>
		</tr>
		<%
		}

		} else {
		if (i == 1) {
		%>
		<tr>
			<li class="active"><a href="${pageUrl }?page=<%=i%>"><%=i%></a></li>
		</tr>
		<%
		} else {
		%>
		<tr>
			<li><a href="${pageUrl }?page=<%=i%>"><%=i%></a></li>
		</tr>
		<%
		}
		}
		}
		%>

		<li><a href="#"><i class="fa fa-angle-right"></i></a></li>
	</ul>
</div>
<!-- /store bottom filter -->