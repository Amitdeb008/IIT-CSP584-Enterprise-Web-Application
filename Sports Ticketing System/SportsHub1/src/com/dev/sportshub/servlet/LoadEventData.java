package com.dev.sportshub.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.sportshub.beans.Event;
import com.dev.sportshub.beans.Tickets;
import com.dev.sportshub.dao.EventsDao;
import com.dev.sportshub.dao.TicketsDao;
import com.dev.sportshub.utils.StubHubAPIHelper;

/**
 * Servlet implementation class LoadEventData
 */
@WebServlet("/LoadEventData")
public class LoadEventData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoadEventData() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(null != request.getParameter("data") && request.getParameter("data").equals("events")) {
			List<Event> events = new StubHubAPIHelper().getEventDataFromAPI();
			for(Event event : events) {
				new EventsDao().saveEvent(event);
			}
		}else {
			List<Tickets> tickets = new StubHubAPIHelper().getTicketsListDataOfEvents();
			for (Tickets ticket : tickets) {
				new TicketsDao().saveTicket(ticket);
			}
		}
		
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
