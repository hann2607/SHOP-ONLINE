package com.Servlet.admin;

import java.io.IOException;
import java.util.List;

import com.DAO.report.reportDAO;
import com.Model.ReportFavoriteByProduct;
import com.Model.ReportUserByProduct;
import com.Model.ReportUserShareProduct;
import com.Utils.PageInfo;
import com.Utils.PageType;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/admin/ReportServlet", "/admin/ReportServlet/tab1", "/admin/ReportServlet/tab2", "/admin/ReportServlet/tab3",
		"/admin/ReportServlet/hiddenTab1", "/admin/ReportServlet/hiddenTab2", "/admin/ReportServlet/hiddenTab3" })
public class ReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ReportServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	reportDAO reportDAO = new reportDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		tab1(request, response);
		PageInfo.prepareAndForwardSite(request, response, PageType.ADMIN_CHART);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = request.getRequestURL().toString();
		if (url.contains("tab1")) {
			tab1(request, response);
		} else if (url.contains("tab2")) {
			tab2(request, response);
		} else if (url.contains("tab3")) {
			tab3(request, response);
		}
		PageInfo.prepareAndForwardSite(request, response, PageType.ADMIN_CHART);
	}

	private void tab1(HttpServletRequest request, HttpServletResponse response) {
		// Show tab1
		request.setAttribute("showtab1", "active in");
		request.setAttribute("activetab1", "active");
		request.setAttribute("tabselectedtab1", "true");
		request.setAttribute("NavAdminSelected", "active");

		// lấy list và đổ lên bảng
		List<ReportFavoriteByProduct> lsReportFavoriteByProduct = reportDAO.CountFavoriteByProduct();
		request.setAttribute("ReportFavoriteByProduct", lsReportFavoriteByProduct);

	}

	private void tab2(HttpServletRequest request, HttpServletResponse response) {
		// Show tab2
		request.setAttribute("showtab2", "active in");
		request.setAttribute("activetab2", "active");
		request.setAttribute("tabselectedtab2", "true");
		// chuyển navbar
		request.setAttribute("NavAdminSelected", "active");

		try {
			if (request.getParameter("search-tab2") != null && !request.getParameter("search-tab2").equals("")) {
				String productname = request.getParameter("search-tab2");
				List<ReportUserByProduct> lsReportUserByProduct = reportDAO.ReportUserByProduct(productname);
				request.setAttribute("lsReportUserByProduct", lsReportUserByProduct);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	private void tab3(HttpServletRequest request, HttpServletResponse response) {
		// Show tab2
		request.setAttribute("showtab3", "active in");
		request.setAttribute("activetab3", "active");
		request.setAttribute("tabselectedtab3", "true");
		// chuyển navbar
		request.setAttribute("NavAdminSelected", "active");

		try {
			if (request.getParameter("search-tab3") != null && !request.getParameter("search-tab3").equals("")) {
				String productname = request.getParameter("search-tab3");
				List<ReportUserShareProduct> lsReportUserShareProduct = reportDAO.ReportUserShareProduct(productname);
				request.setAttribute("lsReportUserShareProduct", lsReportUserShareProduct);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
