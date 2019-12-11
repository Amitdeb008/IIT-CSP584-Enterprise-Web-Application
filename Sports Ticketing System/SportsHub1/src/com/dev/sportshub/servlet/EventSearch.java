package com.dev.sportshub.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.sportshub.beans.Event;
import com.dev.sportshub.dao.EventsDao;
import com.google.gson.Gson;

/**
 * Servlet implementation class EventSearch
 */
@WebServlet("/EventSearch")
public class EventSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("query") != null) {

			response.setContentType("application/json");
			try {
				String searchQuery = request.getParameter("query");
				System.out.println("Data from ajax call " + searchQuery);
				
				EventsDao eventsDao = new EventsDao();
				List<Event> list = eventsDao.getEventBySearch(searchQuery);
				List<String> eventNames = new ArrayList<>();
				for (Event event : list) {
					eventNames.add(event.getEventName());
				}
				String searchList = new Gson().toJson(eventNames);
				response.getWriter().write(searchList);
			} catch (Exception e) {
				System.err.println(e.getMessage());
			}
		}else {
			String searchQuery = request.getParameter("eventname");
			List<Event> events = new EventsDao().getEventBySearch(searchQuery) ;
			String searchList = new Gson().toJson(events.get(0));
			response.getWriter().write(searchList);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
