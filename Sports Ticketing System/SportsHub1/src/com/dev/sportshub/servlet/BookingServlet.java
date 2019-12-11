package com.dev.sportshub.servlet;

import java.io.IOException;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.sportshub.beans.Booking;
import com.dev.sportshub.beans.Event;
import com.dev.sportshub.beans.Tickets;
import com.dev.sportshub.beans.User;
import com.dev.sportshub.dao.BookingDao;
import com.dev.sportshub.dao.EventsDao;
import com.dev.sportshub.dao.TicketsDao;
import com.dev.sportshub.dao.UserDao;
import com.dev.sportshub.utils.MailUtil;

/**
 * Servlet implementation class Booking
 */
@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookingServlet() {
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
		HttpSession session = request.getSession();
		Set<String> ticketIds = (HashSet) session.getAttribute("ticketids");
		int userid = (Integer)session.getAttribute("userid");
		User user = new UserDao().getUserDetailsById(userid);
		List<Tickets> tickets = new TicketsDao().getTicketsByticketIds(ticketIds);
		String mailMessage = "Hello "+user.getName()+","
				+ "You tickets have been confirmed for the below events.";
		for (Tickets ticket : tickets) {
			Event event = new EventsDao().getEventsById(ticket.getEventId());
			Booking booking = new Booking(null, ticket.getListingId(), String.valueOf(userid), ticket.getEventId(),event.getEventName(),event.getEventDate(), "1", new Date().toString(), String.valueOf(ticket.getPricePerProduct()));
			new BookingDao().saveBooking(booking);
			mailMessage = event.getEventName() +" On - "+ event.getEventDate();
		}
		session.setAttribute("ticketids", null);
		MailUtil.sendMail(mailMessage, user.getEmailAddress());
		response.sendRedirect("bookings.jsp");
	}

}
