package com.dev.sportshub.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.dev.sportshub.beans.Event;
import com.dev.sportshub.utils.MySQLConnUtils;

public class EventsDao {

	private final String insertQuery = "Insert into eventscatalog (eventId, eventName, sportName, groupName, eventDate, eventPlace, eventCity, eventState, eventZip, discount) VALUES (?,?,?,?,?,?,?,?,?,?)";
	private final String selectEventsBySportQuery = "select * from eventscatalog where sportName =?  order by eventDate";
	private final String selectEventsBySearchQuery = "select * from eventscatalog where eventName like ? order by eventDate";
	private final String selectEventByIdQuery = "select * from eventscatalog where eventId =?";
	private final String selectQuery = "select * from eventscatalog order by eventDate";
	private final String selectEventByCityQuery = "select * from eventscatalog where eventCity =?  order by eventDate";
	private final String selectCityQuery = "SELECT distinct eventCity FROM sportshub.eventscatalog order by eventCity asc";

	public int saveEvent(Event event) {
		try (Connection connection = MySQLConnUtils.getMySQLConnection();
				PreparedStatement prSt = connection.prepareStatement(insertQuery);) {
			prSt.setString(1, event.getEventId());
			prSt.setString(2, event.getEventName());
			prSt.setString(3, event.getSportName());
			prSt.setString(4, event.getGroupName());
			prSt.setString(5, event.getEventDate());
			prSt.setString(6, event.getEventPlace());
			prSt.setString(7, event.getEventCity());
			prSt.setString(8, event.getEventState());
			prSt.setString(9, event.getEventZip());
			prSt.setString(10, event.getDiscount());
			return prSt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public List<Event> getEventsBySport(String sport) {
		try (Connection connection = MySQLConnUtils.getMySQLConnection();
				PreparedStatement stmt = connection.prepareStatement(selectEventsBySportQuery)) {
			stmt.setString(1, sport);
			ResultSet rs = stmt.executeQuery();
			List<Event> list = new ArrayList<>();
			while (rs.next()) {
				Event event = new Event(rs.getString("eventId"), rs.getString("eventName"), rs.getString("sportName"),
						rs.getString("groupName"), rs.getString("eventDate"), rs.getString("eventPlace"),
						rs.getString("eventCity"), rs.getString("eventState"), rs.getString("eventZip"), "");
				list.add(event);
			}
			return list;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<Event> getEventsByCity(String city) {
		try (Connection connection = MySQLConnUtils.getMySQLConnection();
				PreparedStatement stmt = connection.prepareStatement(selectEventByCityQuery)) {
			stmt.setString(1, city);
			ResultSet rs = stmt.executeQuery();
			List<Event> list = new ArrayList<>();
			while (rs.next()) {
				Event event = new Event(rs.getString("eventId"), rs.getString("eventName"), rs.getString("sportName"),
						rs.getString("groupName"), rs.getString("eventDate"), rs.getString("eventPlace"),
						rs.getString("eventCity"), rs.getString("eventState"), rs.getString("eventZip"), "");
				list.add(event);
			}
			return list;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public Event getEventsById(String id) {
		try (Connection connection = MySQLConnUtils.getMySQLConnection();
				PreparedStatement stmt = connection.prepareStatement(selectEventByIdQuery)) {
			stmt.setString(1, id);
			ResultSet rs = stmt.executeQuery();
			Event event = null;
			while (rs.next()) {
				event = new Event(rs.getString("eventId"), rs.getString("eventName"), rs.getString("sportName"),
						rs.getString("groupName"), rs.getString("eventDate"), rs.getString("eventPlace"),
						rs.getString("eventCity"), rs.getString("eventState"), rs.getString("eventZip"), "");
			}
			return event;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<String> getEventCities() {
		try (Connection connection = MySQLConnUtils.getMySQLConnection();
				Statement stmt = connection.createStatement();) {
			ResultSet rs = stmt.executeQuery(selectCityQuery);
			List<String> list = new ArrayList<>();
			while (rs.next()) {
				list.add(rs.getString("eventCity"));
			}
			return list;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;

	}

	public List<Event> getAllEvents() {
		try (Connection connection = MySQLConnUtils.getMySQLConnection();
				Statement stmt = connection.createStatement();) {
			ResultSet rs = stmt.executeQuery(selectQuery);
			List<Event> list = new ArrayList<>();
			while (rs.next()) {
				Event event = new Event(rs.getString("eventId"), rs.getString("eventName"), rs.getString("sportName"),
						rs.getString("groupName"), rs.getString("eventDate"), rs.getString("eventPlace"),
						rs.getString("eventCity"), rs.getString("eventState"), rs.getString("eventZip"), "");
				list.add(event);
			}
			return list;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<Event> getEventBySearch(String searchQuery) {
		try (Connection connection = MySQLConnUtils.getMySQLConnection();
				PreparedStatement stmt = connection.prepareStatement(selectEventsBySearchQuery)) {
			stmt.setString(1, "%"+searchQuery+"%");
			ResultSet rs = stmt.executeQuery();
			List<Event> list = new ArrayList<>();
			while (rs.next()) {
				Event event = new Event(rs.getString("eventId"), rs.getString("eventName"), rs.getString("sportName"),
						rs.getString("groupName"), rs.getString("eventDate"), rs.getString("eventPlace"),
						rs.getString("eventCity"), rs.getString("eventState"), rs.getString("eventZip"), "");
				list.add(event);
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
