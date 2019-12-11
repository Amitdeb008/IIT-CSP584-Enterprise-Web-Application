package com.dev.sportshub.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import com.dev.sportshub.beans.Tickets;
import com.dev.sportshub.utils.MySQLConnUtils;

public class TicketsDao {

	private final String insertQuery = "Insert into tickets (listing_id, event_id, pricePerProduct, ticket_row, sectionName) VALUES (?,?,?,?,?)";
	private final String selectTicketsByEventQuery = "select * from tickets where event_id =?";
	
	public int saveTicket(Tickets ticket) {
		try (Connection connection = MySQLConnUtils.getMySQLConnection();
				PreparedStatement prSt = connection.prepareStatement(insertQuery);) {
			prSt.setString(1, ticket.getListingId());
			prSt.setString(2, ticket.getEventId());
			prSt.setDouble(3, ticket.getPricePerProduct());
			prSt.setString(4, ticket.getRow());
			prSt.setString(5, ticket.getSectionName());
			return prSt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public List<Tickets> getTicketsByEvent(String eventId) {
		try (Connection connection = MySQLConnUtils.getMySQLConnection();
				PreparedStatement stmt = connection.prepareStatement(selectTicketsByEventQuery)) {
			stmt.setString(1, eventId);
			ResultSet rs = stmt.executeQuery();
			List<Tickets> list = new ArrayList<>();
			while (rs.next()) {
				Tickets ticket = new Tickets(rs.getString("listing_id"), rs.getString("event_id"), rs.getDouble("pricePerProduct"), 
						rs.getString("ticket_row"), rs.getString("sectionName"));
				list.add(ticket);
			}
			return list;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<Tickets> getTicketsByticketIds(Set<String> ticketIds) {
		StringBuilder builder = new StringBuilder();
		for( int i = 0 ; i < ticketIds.size(); i++ ) {
			builder.append("?,");
		}
		String query = "select * from tickets where listing_id in (" 
	               + builder.deleteCharAt( builder.length() -1 ).toString() + ")";
		
		try (Connection connection = MySQLConnUtils.getMySQLConnection();
				PreparedStatement stmt = connection.prepareStatement(query)) {
			int index = 1;
			for( String o : ticketIds ) {
			   stmt.setString(  index++, o );
			}
			ResultSet rs = stmt.executeQuery();
			List<Tickets> list = new ArrayList<>();
			while (rs.next()) {
				Tickets ticket = new Tickets(rs.getString("listing_id"), rs.getString("event_id"), rs.getDouble("pricePerProduct"), 
						rs.getString("ticket_row"), rs.getString("sectionName"));
				list.add(ticket);
			}
			return list;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}


	

}
