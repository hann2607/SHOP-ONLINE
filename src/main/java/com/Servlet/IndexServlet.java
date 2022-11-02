package com.Servlet;

import java.io.IOException;
import java.util.List;

import com.DAO.store.ProductDAO;
import com.Model.Product;
import com.Utils.PageInfo;
import com.Utils.PageType;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/StoreServlet")
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public IndexServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	ProductDAO productDAO = new ProductDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		fillListProduct(request, response);
		fillTop3Product(request, response);
		
		//lấy số trang và hiển thị trang đầu tiên
		double quantityProduct = productDAO.countProduct();
		int quantityPage = (int) Math.ceil((double) quantityProduct / 9);
		request.setAttribute("quantityPage", quantityPage);
		
		
		request.setAttribute("NavHomeSelected", "active");
		PageInfo.prepareAndForwardSite(request, response, PageType.SITE_STORE);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private void fillListProduct(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProductDAO productDAO = new ProductDAO();
		List<Product> listSP;
		if(request.getParameter("page") != null && !request.getParameter("page").equals("")) {
			int pageNum = Integer.valueOf(request.getParameter("page"));
			listSP = productDAO.findPage(pageNum-1, 9);
		} else {
			listSP = productDAO.findPage(0, 9);
		}
		
		if(!listSP.isEmpty()) {
			request.setAttribute("quantityProductOnPageNow", listSP.size());
			request.setAttribute("listSP", listSP);
		}
	}

	private void fillTop3Product(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProductDAO productDAO = new ProductDAO();
		List<Product> listSP = productDAO.findTop3Product();
		request.setAttribute("listTop3Product", listSP);
	}
}
