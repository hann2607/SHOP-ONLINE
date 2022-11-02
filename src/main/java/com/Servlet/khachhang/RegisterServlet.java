package com.Servlet.khachhang;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import org.apache.commons.beanutils.BeanUtils;

import com.DAO.signin_signup.Signin_SignupDAO;
import com.Model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/RegisterServlet", "/RegisterServlet/Register" })
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegisterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	Signin_SignupDAO signin_SignupDAO = new Signin_SignupDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("user", new User());
		request.setAttribute("changeSignUpForm", "sign-up-mode");
		request.getRequestDispatcher("/views/signin-signup.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = request.getRequestURL().toString();
		if (url.contains("Register")) {
			Register(request, response);
		}
	}

	private void Register(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		User user = new User();
		try {
			BeanUtils.populate(user, request.getParameterMap());
			if (validationRegister(request, response, user)) {
				if (signin_SignupDAO.findByUsername(user.getUsername()) == null) {
					try {
						signin_SignupDAO.insert(user);
						request.setAttribute("registerSuccess", "Đăng ký thành công!");
						request.setAttribute("changeSignUpForm", "sign-up-mode");
						request.getRequestDispatcher("/views/signin-signup.jsp").forward(request, response);
					} catch (Exception e) {
						request.setAttribute("registerSuccess", "Đăng ký thất bại!");
						request.setAttribute("changeSignUpForm", "sign-up-mode");
						request.getRequestDispatcher("/views/signin-signup.jsp").forward(request, response);
					}
				} else {
					request.setAttribute("user", user);
					request.setAttribute("changeSignUpForm", "sign-up-mode");
					request.setAttribute("rePassword", request.getParameter("rePassword"));
					request.setAttribute("errorRegister", "Tên đăng nhập Đã tồn tại!");
					request.getRequestDispatcher("/views/signin-signup.jsp").forward(request, response);
				}
			}
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
			request.setAttribute("user", user);
			request.setAttribute("changeSignUpForm", "sign-up-mode");
			request.setAttribute("rePassword", request.getParameter("rePassword"));
			request.setAttribute("errorRegister", "Đăng ký thất bại!");
			request.getRequestDispatcher("/views/signin-signup.jsp").forward(request, response);
		}

	}

	private boolean validationRegister(HttpServletRequest request, HttpServletResponse response, User user)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		if (user.getUsername() != null && !user.getUsername().equals("") && user.getPassword() != null
				&& !user.getPassword().equals("") && !request.getParameter("rePassword").equals("")
				&& user.getFullname() != null && !user.getFullname().equals("") && user.getEmail() != null
				&& !user.getEmail().equals("")) {
			return true;
		} else {
			if (user.getUsername().equals("")) {
				request.setAttribute("errorUsernameRegister", "Tên đăng nhập không được để trống!");
			}

			if (user.getPassword().equals("")) {
				request.setAttribute("errorPasswordRegister", "Mật khẩu không được để trống!");
			} else {
				if (!user.getPassword().equalsIgnoreCase(request.getParameter("rePassword"))) {
					request.setAttribute("errorRePasswordRegister", "Xác nhận mật khẩu không khớp!");
				}
			}
			if (user.getFullname().equals("")) {
				request.setAttribute("errorFullNameRegister", "Họ và tên không được để trống!");
			}
			if (user.getEmail().equals("")) {
				request.setAttribute("errorEmailRegister", "Email không được để trống!");
			}
			request.setAttribute("user", user);
			request.setAttribute("changeSignUpForm", "sign-up-mode");
			request.setAttribute("rePassword", request.getParameter("rePassword"));
			request.getRequestDispatcher("/views/signin-signup.jsp").forward(request, response);
			return false;
		}
	}

}
