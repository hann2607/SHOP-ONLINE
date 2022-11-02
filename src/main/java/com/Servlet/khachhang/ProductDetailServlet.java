package com.Servlet.khachhang;

import java.io.IOException;
import java.util.List;

import com.DAO.store.ProductDAO;
import com.Model.Product;
import com.Model.Specification;
import com.Utils.PageInfo;
import com.Utils.PageType;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/ProductServlet")
public class ProductDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProductDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    ProductDAO productDAO = new ProductDAO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PageInfo.prepareAndForwardSite(request, response, PageType.SITE_PRODUCT);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productID = request.getParameter("productID");
		Product product = productDAO.findProductByID(productID);
		Specification specification = productDAO.findSpecificationByID(product.getSpecification().getSpecificationId());
		List<Product> lsProduct = productDAO.findProductByCategory(product.getCategory());
		
		request.setAttribute("product", product);
		request.setAttribute("specification", specification);
		request.setAttribute("lsProduct", lsProduct);
		PageInfo.prepareAndForwardSite(request, response, PageType.SITE_PRODUCT);
	}

}
