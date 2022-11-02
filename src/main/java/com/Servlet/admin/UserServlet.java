package com.Servlet.admin;

import java.io.IOException;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;

import com.DAO.user.userDAO;
import com.Model.User;
import com.Utils.PageInfo;
import com.Utils.PageType;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/admin/UserServlet", "/admin/UserServlet/create", "/admin/UserServlet/update", "/admin/UserServlet/delete",
		"/admin/UserServlet/edit", "/admin/UserServlet/reset" })
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	userDAO userDAO = new userDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = request.getRequestURL().toString();
		User user = new User();
		try {
			BeanUtils.populate(user, request.getParameterMap());
			if (url.contains("edit")) {
				String username = request.getParameter("username");
				user = new User();
				user = userDAO.findUserByUsername(username);
				request.setAttribute("user", user);
			} else if (url.contains("create")) {
				userDAO.insert(user);
				request.setAttribute("user", new User());
			} else if (url.contains("update")) {
				userDAO.update(user);
				request.setAttribute("user", new User());
			} else if (url.contains("delete")) {
				userDAO.delete(user.getUsername());
				request.setAttribute("user", new User());
			} else if (url.contains("reset")) {
				request.setAttribute("user", new User());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		List<User> lsUser = userDAO.findAll();
		request.setAttribute("lsUser", lsUser);
		request.setAttribute("NavAdminSelected", "active");
		PageInfo.prepareAndForwardSite(request, response, PageType.ADMIN_CUSTOMER);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
