package com.Servlet.admin;

import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;

import com.DAO.store.ProductDAO;
import com.DAO.store.SpecificationDAO;
import com.Model.Product;
import com.Model.Specification;
import com.Utils.PageInfo;
import com.Utils.PageType;
import com.Utils.UploadFileHelper;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/WarehouseServlet", "/admin/WarehouseServlet/create", "/admin/WarehouseServlet/update",
		"/admin/WarehouseServlet/edit", "/admin/WarehouseServlet/delete", "/admin/WarehouseServlet/reset", "/admin/WarehouseServlet/preview" })
@MultipartConfig
public class WarehouseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIR = "views/khachhang//img/product";

	public WarehouseServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	ProductDAO productDAO = new ProductDAO();
	SpecificationDAO specificationDAO = new SpecificationDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = request.getRequestURL().toString();
		Product product = new Product();
		Specification specification = new Specification();
		try {
			DateConverter converter = new DateConverter(null);
			converter.setPattern("dd/mm/yyyy");
			ConvertUtils.register(converter, Date.class);
			BeanUtils.populate(product, request.getParameterMap());
			BeanUtils.populate(specification, request.getParameterMap());
			if (request.getParameterValues("color") != null) {
				StringBuilder strinbuilder = new StringBuilder();
				for (String string : request.getParameterValues("color")) {
					strinbuilder.append(string);
					strinbuilder.append(',');
				}
				String CheckedColor = strinbuilder.toString().substring(0, strinbuilder.toString().length() - 1);
				product.setColor(CheckedColor);
			}
			product = getFileToForm(request, response, product);

			if (url.contains("edit")) {
				String productID = request.getParameter("productid");
				product = new Product();
				specification = new Specification();

				product = productDAO.findProductByID(productID);
				specification = productDAO.findSpecificationByID(product.getSpecification().getSpecificationId());
				request.setAttribute("product", product);
				request.setAttribute("specification", specification);

			} else if (url.contains("create")) {
				specification.setSpecificationId(randomSpecificationID());

				product.setProductid(randomPoductID());
				product.setSpecification(specification);
				product.setDate(new java.sql.Date(System.currentTimeMillis()));
				productDAO.insert(product, specification);
				request.setAttribute("product", new Product());
				request.setAttribute("specification", new Specification());
			} else if (url.contains("update")) {
				Product product1 = productDAO.findProductByID(product.getProductid());
				if (product.getImageMain() == null || product.getImageMain().equals("")) {
					product.setImageMain(product1.getImageMain());
				}

				if (product.getImage1() == null || product.getImage1().equals("")) {
					product.setImage1(product1.getImage1());
				}

				if (product.getImage2() == null || product.getImage2().equals("")) {
					product.setImage2(product1.getImage2());
				}

				if (product.getImage3() == null || product.getImage3().equals("")) {
					product.setImage3(product1.getImage3());
				}

				if (product.getImage4() == null || product.getImage4().equals("")) {
					product.setImage4(product1.getImage4());
				}

				if (product.getVideo() == null || product.getVideo().equals("")) {
					product.setVideo(product1.getVideo());
				}

				if (product.getDate() == null || product.getDate().equals("")) {
					product.setDate(product1.getDate());
				}
				product.setSpecification(specification);
				productDAO.update(product, specification);
				request.setAttribute("product", new Product());
				request.setAttribute("specification", new Specification());
			} else if (url.contains("delete")) {
				productDAO.delete(product.getProductid());
				request.setAttribute("product", new Product());
				request.setAttribute("specification", new Specification());
			} else if (url.contains("reset")) {
				request.setAttribute("product", new Product());
				request.setAttribute("specification", new Specification());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		request.setAttribute("url", request.getRequestURI());
		List<Product> lsproduct = productDAO.findAll();
		request.setAttribute("lsProduct", lsproduct);
		request.setAttribute("NavAdminSelected", "active");
		PageInfo.prepareAndForwardSite(request, response, PageType.ADMIN_WAREHOUSE);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = request.getRequestURL().toString();
		if (url.contains("preview")) {
			Product product = new Product();
			Specification specification = new Specification();
			try {
				DateConverter converter = new DateConverter(null);
				converter.setPattern("dd/mm/yyyy");
				ConvertUtils.register(converter, Date.class);
				BeanUtils.populate(product, request.getParameterMap());
				BeanUtils.populate(specification, request.getParameterMap());
				if (request.getParameterValues("color") != null) {
					StringBuilder strinbuilder = new StringBuilder();
					for (String string : request.getParameterValues("color")) {
						strinbuilder.append(string);
						strinbuilder.append(',');
					}
					String CheckedColor = strinbuilder.toString().substring(0, strinbuilder.toString().length() - 1);
					product.setColor(CheckedColor);
				}

				product = getFileToForm(request, response, product);

				request.setAttribute("product", product);
				request.setAttribute("specification", specification);
				ShowFormPreview(request, response);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		doGet(request, response);
	}

	private void ShowFormPreview(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("bodyStyle", "style='padding-right: 17px;'");
		request.setAttribute("bodyClass", "modal-open");
		request.setAttribute("showModal", "in");
		request.setAttribute("styleModal", "style='display: block; padding-right: 17px;'");
		request.setAttribute(UPLOAD_DIR, "<div class=\"modal-backdrop fade in\"></div>");
	}

	private Product getFileToForm(HttpServletRequest request, HttpServletResponse response, Product product)
			throws ServletException, IOException {
		List<String> images = UploadFileHelper.uploadFile(UPLOAD_DIR, request, "images");
		List<String> imageMain = UploadFileHelper.uploadFile(UPLOAD_DIR, request, "imageMain");
		List<String> video = UploadFileHelper.uploadFile(UPLOAD_DIR, request, "video");
		if (images != null) {
			if (images.size() >= 4) {
				product.setImage1(images.get(0));
				product.setImage2(images.get(1));
				product.setImage3(images.get(2));
				product.setImage4(images.get(3));
			}
		}

		if (imageMain != null) {
			product.setImageMain(imageMain.get(0));
		}
		if (video != null) {
			product.setVideo(video.get(0));
		}
		return product;
	}

	private String randomPoductID() {
		while (true) {
			int ranNum = ThreadLocalRandom.current().nextInt(1, 1000000000);
			String productID = "SP" + ranNum;
			if (productDAO.findProductByID(productID) == null) {
				return productID;
			}
		}
	}

	private int randomSpecificationID() {
		while (true) {
			int ranNum = ThreadLocalRandom.current().nextInt(1, 1000000000);
			if (specificationDAO.findspecificationByID(ranNum) == null) {
				return ranNum;
			}
		}
	}
}
