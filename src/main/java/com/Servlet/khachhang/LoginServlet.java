package com.Servlet.khachhang;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import org.apache.commons.beanutils.BeanUtils;

import com.DAO.signin_signup.Signin_SignupDAO;
import com.Model.User;
import com.Utils.PageInfo;
import com.Utils.PageType;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(urlPatterns = { "/LoginServlet", "/LoginServlet/Login" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	Signin_SignupDAO signin_SignupDAO = new Signin_SignupDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("user", new User());
		request.getRequestDispatcher("/views/signin-signup.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = request.getRequestURL().toString();
		if (url.contains("Login")) {
			login(request, response);
		} else if (url.contains("Register")) {
			Register(request, response);
		}
	}

	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		User user = new User();
		user.setUsername(request.getParameter("usernameLogin"));
		user.setPassword(request.getParameter("passwordLogin"));
		if (validationLogin(request, response)) {
			if (signin_SignupDAO.findUser(user.getUsername(), user.getPassword()) != null) {
				User us = new User();
				us = signin_SignupDAO.findUser(user.getUsername(), user.getPassword());
				if (us != null) {
					HttpSession session = request.getSession();
					session.setAttribute("username", us.getUsername());
					session.setAttribute("role", us.getAdmin());
					session.setAttribute("emailUser", us.getEmail());
					if (us.getAdmin()) {
						if (session.getAttribute("pageUrl") != null && !session.getAttribute("pageUrl").equals("")) {
							String Link = (String) session.getAttribute("pageUrl");
							request.getRequestDispatcher("/" + Link).forward(request, response);
						} else {
							request.getRequestDispatcher("/StoreServlet").forward(request, response);
						}
					} else {
						if (session.getAttribute("pageUrl") != null && !session.getAttribute("pageUrl").equals("")) {
							String Link = (String) session.getAttribute("pageUrl");
							if (Link.contains("admin")) {
								request.getRequestDispatcher("/StoreServlet").forward(request, response);
							} else {
								request.getRequestDispatcher("/" + Link).forward(request, response);
							}
						} else {
							request.getRequestDispatcher("/StoreServlet").forward(request, response);
						}
					}

				}
			} else {
				request.setAttribute("userLogin", user);
				request.setAttribute("errorLogin", "Tên đăng nhập hoặc mật khẩu sai!");
				request.getRequestDispatcher("/views/signin-signup.jsp").forward(request, response);
			}
		}
	}

	private boolean validationLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		User user = new User();
		user.setUsername(request.getParameter("usernameLogin"));
		user.setPassword(request.getParameter("passwordLogin"));
		if (user.getUsername() != null && user.getPassword() != null && !user.getUsername().equals("")
				&& !user.getPassword().equals("")) {
			return true;
		} else {
			if (user.getUsername().equals("")) {
				request.setAttribute("errorUsernameLogin", "Tên đăng nhập không được để trống!");
			}

			if (user.getPassword().equals("")) {
				request.setAttribute("errorPasswordLogin", "Mật khẩu không được để trống!");
			}
			request.setAttribute("userLogin", user);
			request.getRequestDispatcher("/views/signin-signup.jsp").forward(request, response);
			return false;
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
				if (signin_SignupDAO.findUser(user.getUsername(), user.getPassword()) != null) {
					User us = new User();
					us = signin_SignupDAO.findUser(user.getUsername(), user.getPassword());
					if (us != null) {
						if (us.getAdmin()) {
							PageInfo.prepareAndForwardSite(request, response, PageType.SITE_STORE);
						} else {
							request.getRequestDispatcher("/views/khachhang/index.jsp").forward(request, response);
						}
					}
				} else {
					request.setAttribute("user", user);
					request.setAttribute("changeSignUpForm", "sign-up-mode");
					request.setAttribute("rePassword", request.getParameter("rePassword"));
					request.setAttribute("errorLogin", "Tên đăng nhập hoặc mật khẩu sai!");
					request.getRequestDispatcher("/views/signin-signup.jsp").forward(request, response);
				}
			}
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
			request.setAttribute("user", user);
			request.setAttribute("changeSignUpForm", "sign-up-mode");
			request.setAttribute("rePassword", request.getParameter("rePassword"));
			request.setAttribute("errorLogin", "Tên đăng nhập hoặc mật khẩu sai!");
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
					request.setAttribute("errorRePasswordRegister", "Xác nhận mật khẩu và mật khẩu không khớp!");
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
