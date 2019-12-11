package com.dev.sportshub.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.sportshub.beans.Event;
import com.dev.sportshub.beans.User;
import com.dev.sportshub.dao.EventsDao;
import com.dev.sportshub.dao.UserDao;

/**
 * Servlet implementation class AdminHome
 */
@WebServlet("/AdminHome")
public class AdminHome extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminHome() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User details = new UserDao().login(request.getParameterValues("emailId")[0],
				request.getParameterValues("password")[0], "admin");
		if (details == null) {
			response.addHeader("status", "Invalid Login Details");
			response.sendRedirect("adminlogin.jsp");
		} else {
			List<Event> events = new EventsDao().getAllEvents();
			HttpSession session = request.getSession();
			session.setAttribute("adminid", details.getId());
			session.setAttribute("data", details);
			session.setAttribute("events", events);
			response.sendRedirect("adminhome.jsp");
		}
	}

}
