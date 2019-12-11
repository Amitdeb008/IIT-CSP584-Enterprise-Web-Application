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
import com.dev.sportshub.dao.EventsDao;

/**
 * Servlet implementation class Events
 */
@WebServlet("/Events")
public class Events extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Events() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Event> events = null;
		if(request.getParameter("sport") != null) {
			events = new EventsDao().getEventsBySport(request.getParameterValues("sport")[0]);
		}else if(request.getParameter("city") != null) {
			events = new EventsDao().getEventsByCity(request.getParameterValues("city")[0]);
		}
		HttpSession session = request.getSession();
		session.setAttribute("events", events);
		getServletContext().getRequestDispatcher("/events.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Event details = new Event(request.getParameterValues("eventId")[0], request.getParameterValues("eventName")[0],
				request.getParameterValues("sportName")[0], request.getParameterValues("groupName")[0],
				request.getParameterValues("eventDate")[0], request.getParameterValues("eventPlace")[0],
				request.getParameterValues("eventCity")[0], request.getParameterValues("eventState")[0],
				request.getParameterValues("eventZip")[0], "");
		new EventsDao().saveEvent(details);
		List<Event> events = new EventsDao().getAllEvents();
		HttpSession session = request.getSession();
		session.setAttribute("data", details);
		session.setAttribute("events", events);
		response.sendRedirect("adminhome.jsp");
	}

}
