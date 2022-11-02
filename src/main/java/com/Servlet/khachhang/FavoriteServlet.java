package com.Servlet.khachhang;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import com.DAO.favorites.favoritesDAO;
import com.DAO.store.ProductDAO;
import com.DAO.user.userDAO;
import com.Model.Like;
import com.Model.Product;
import com.Model.User;
import com.Utils.PageInfo;
import com.Utils.PageType;
import com.Utils.SendMail;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.jsp.tagext.BodyContent;

@WebServlet(urlPatterns = { "/FavoriteServlet", "/FavoriteServlet/Favorite", "/FavoriteServlet/Like",
		"/FavoriteServlet/Share", "/FavoriteServlet/Watch" })
public class FavoriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FavoriteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	favoritesDAO favoritesDAO = new favoritesDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = request.getRequestURL().toString();
		String action = null;
		if (request.getParameter("action") != null) {
			action = request.getParameter("action");
		}

		request.setAttribute("quantityPage", 1);

		HttpSession session = request.getSession();
		String username = null;

		if (session.getAttribute("username") != null) {
			username = session.getAttribute("username").toString();
			if (username != null && !username.equals("")) {
				if (action == null || action.equals("")) {
					if (url.contains("Favorite")) {
						fillListFavoriteProduct(request, response);
						double quantityProduct = favoritesDAO.countFavoriteProduct(username);
						int quantityPage = (int) Math.ceil((double) quantityProduct / 9);
						request.setAttribute("quantityPage", quantityPage);
						request.setAttribute("NavFavoritesSelected", "active");
						PageInfo.prepareAndForwardSite(request, response, PageType.SITE_FAVORITES);
					}
				} else {
					if (action.contains("Like")) {
						Like like = null;
						if (request.getParameter("proID") != null) {
							try {
								like = favoritesDAO.findLikeByUser(request.getParameter("proID"), username);
							} catch (Exception e) {
								e.printStackTrace();
							}

							if (like != null) {
								try {
									favoritesDAO.delete(like.getLikeid());
									System.out.println("unlike thanh cong!");
								} catch (Exception e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}
							} else {
								like = new Like();
								ProductDAO productDAO = new ProductDAO();
								Product product = productDAO.findProductByID(request.getParameter("proID"));

								userDAO userDAO = new userDAO();
								User user = userDAO.findUserByUsername(username);

								like.setProduct(product);
								like.setUser(user);
								like.setLikedate(new Date(System.currentTimeMillis()));

								favoritesDAO.insert(like);
								System.out.println("like thanh cong!");
							}
						}

						// Đổ lại trang Yêu thích
						fillListFavoriteProduct(request, response);
						double quantityProduct = favoritesDAO.countFavoriteProduct(username);
						int quantityPage = (int) Math.ceil((double) quantityProduct / 9);
						request.setAttribute("quantityPage", quantityPage);

						// Chuyển hướng về Trang cũ hoặc về index
						if (session.getAttribute("pageUrl") != null && !session.getAttribute("pageUrl").equals("")) {
							String Link = (String) session.getAttribute("pageUrl");
							if (session.getAttribute("pageUrl").toString().contains("Favorite")) {
								PageInfo.prepareAndForwardSite(request, response, PageType.SITE_FAVORITES);
							} else {
								PageInfo.prepareAndForwardSite(request, response, PageType.SITE_STORE);
							}
						} else {
							PageInfo.prepareAndForwardSite(request, response, PageType.SITE_STORE);
						}
					} else if (action.contains("Share")) {
						String email = null;

						if (session.getAttribute("emailUser") != null
								&& !session.getAttribute("emailUser").equals("")) {
							if (request.getParameter("SenderMail") != null
									&& !request.getParameter("SenderMail").toString().equals("")
									&& request.getParameter("SenderPass") != null
									&& !request.getParameter("SenderPass").toString().equals("")
									&& request.getParameter("to") != null
									&& !request.getParameter("to").toString().equals("")
									&& request.getParameter("proID") != null
									&& !request.getParameter("proID").toString().equals("")) {

								SendMail mail = new SendMail();
								String subject = "Xin chào " + request.getParameter("to") + "!";
								String proID = request.getParameter("proID");

								ProductDAO productDAO = new ProductDAO();
								Product product = productDAO.findProductByID(proID);

								String Body = product.getName();
								try {
									mail.sendmail(request.getParameter("SenderMail"),
											request.getParameter("SenderPass"), request.getParameter("to"), subject,
											Body);
								} catch (Exception e) {
									// TODO: handle exception
								}

								request.getRequestDispatcher("/StoreServlet").forward(request, response);
							}
						} else {
							request.getRequestDispatcher("/views/signin-signup.jsp").forward(request, response);
						}

					}
				}

			}
		} else {
			request.getRequestDispatcher("/views/signin-signup.jsp").forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private void fillListFavoriteProduct(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String username = session.getAttribute("username").toString();

		List<Product> listSP;
		if (request.getParameter("page") != null && !request.getParameter("page").equals("")) {
			int pageNum = Integer.valueOf(request.getParameter("page"));
			listSP = favoritesDAO.findPage(pageNum - 1, 9, username);
		} else {
			listSP = favoritesDAO.findPage(0, 9, username);
		}

		if (!listSP.isEmpty()) {
			request.setAttribute("quantityProductOnPageNow", listSP.size());
			request.setAttribute("listSP", listSP);
		}
	}

}
