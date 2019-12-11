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
import com.dev.sportshub.beans.Tickets;
import com.dev.sportshub.dao.EventsDao;
import com.dev.sportshub.dao.TicketsDao;

/**
 * Servlet implementation class TicketsServlet
 */
@WebServlet("/TicketsServlet")
public class TicketsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TicketsServlet() {
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
		List<Tickets> tickets = new TicketsDao().getTicketsByEvent(request.getParameterValues("eventId")[0]);
		Event event = new EventsDao().getEventsById(request.getParameterValues("eventId")[0]);
		HttpSession session = request.getSession();
		session.setAttribute("event", event);
		session.setAttribute("tickets", tickets);
		response.sendRedirect("buytickets.jsp");

	}

}
