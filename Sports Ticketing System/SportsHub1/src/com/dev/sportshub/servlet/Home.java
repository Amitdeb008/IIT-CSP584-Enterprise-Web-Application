package com.dev.sportshub.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.sportshub.beans.User;
import com.dev.sportshub.dao.EventsDao;
import com.dev.sportshub.dao.UserDao;

/**
 * Servlet implementation class Home
 */
@WebServlet("/Home")
public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Home() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<String> cities = new EventsDao().getEventCities();
		HttpSession session = request.getSession();
		session.setAttribute("cities", cities);
		getServletConfig().getServletContext().getRequestDispatcher("/home.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User details = new UserDao().login(request.getParameterValues("emailId")[0],
				request.getParameterValues("password")[0], "user");
		List<String> cities = new EventsDao().getEventCities();
		if (details == null) {
			response.addHeader("status", "Invalid Login Details");
			response.sendRedirect("login.jsp");
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("data", details);
			session.setAttribute("cities", cities);
			session.setAttribute("userid", details.getId());
			response.sendRedirect("home.jsp");
		}
	}

}
