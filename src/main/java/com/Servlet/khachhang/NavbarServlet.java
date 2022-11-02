package com.Servlet.khachhang;

import java.io.IOException;
import java.util.List;

import com.DAO.store.ProductDAO;
import com.DAO.user.userDAO;
import com.Model.Product;
import com.Model.User;
import com.Utils.PageInfo;
import com.Utils.PageType;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/NavbarServlet", "/NavbarServlet/Home", "/NavbarServlet/Favorite",
		"/NavbarServlet/admin/Warehouse", "/NavbarServlet/admin/Customer", "/NavbarServlet/admin/Report" })
public class NavbarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public NavbarServlet() {
		super();
		// TODO Auto-generated constructor stub
	}
	userDAO userDAO = new userDAO();
	ProductDAO productDAO = new ProductDAO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = request.getRequestURL().toString();
		
		if (url.contains("Home")) {
			fillListProduct(request, response);
			fillTop3Product(request, response);
			request.setAttribute("NavHomeSelected", "active");
			PageInfo.prepareAndForwardSite(request, response, PageType.SITE_STORE);
		} else if (url.contains("Favorite")) {
			request.setAttribute("quantityPage", 1);
			request.setAttribute("NavFavoritesSelected", "active");
			PageInfo.prepareAndForwardSite(request, response, PageType.SITE_FAVORITES);
		} else if (url.contains("Warehouse")) {
			List<Product> lsProduct = productDAO.findAll();
			request.setAttribute("lsProduct", lsProduct);
			request.setAttribute("NavAdminSelected", "active");
			PageInfo.prepareAndForwardSite(request, response, PageType.ADMIN_WAREHOUSE);
		} else if (url.contains("Customer")) {
			List<User> lsUser = userDAO.findAll();
			request.setAttribute("lsUser", lsUser);
			request.setAttribute("NavAdminSelected", "active");
			PageInfo.prepareAndForwardSite(request, response, PageType.ADMIN_CUSTOMER);
		} else if (url.contains("Report")) {
			request.setAttribute("NavAdminSelected", "active");
			PageInfo.prepareAndForwardSite(request, response, PageType.ADMIN_CHART);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void fillListProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDAO productDAO = new ProductDAO();
		List<Product> listSP = productDAO.findPage(0, 9);
		request.setAttribute("listSP", listSP);
	}
	
	private void fillTop3Product(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDAO productDAO = new ProductDAO();
		List<Product> listSP = productDAO.findTop3Product();
		request.setAttribute("listTop3Product", listSP);
	}

}
