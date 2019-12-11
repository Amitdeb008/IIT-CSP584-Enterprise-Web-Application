package com.dev.sportshub.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dev.sportshub.beans.Booking;
import com.dev.sportshub.utils.MySQLConnUtils;

public class BookingDao {

	private final String selectBookingByUser = "select * from booking where user_id=?";
	private final String insertQuery = "Insert into booking (listing_id, user_id, event_id,event_name,event_date, seats, bookingDate, bookingPrice) VALUES (?,?,?,?,?,?,?,?)";

	public int saveBooking(Booking booking) {
		try (Connection connection = MySQLConnUtils.getMySQLConnection();
				PreparedStatement prSt = connection.prepareStatement(insertQuery);) {
			prSt.setString(1, booking.getListingId());
			prSt.setString(2, booking.getUserId());
			prSt.setString(3, booking.getEventId());
			prSt.setString(4, booking.getEventName());
			prSt.setString(5, booking.getEventDate());
			prSt.setString(6, booking.getSeats());
			prSt.setString(7, booking.getBookingDate());
			prSt.setString(8, booking.getBookingPrice());
			return prSt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public List<Booking> getBookingByUser(String userId) {
		try (Connection connection = MySQLConnUtils.getMySQLConnection();
				PreparedStatement stmt = connection.prepareStatement(selectBookingByUser)) {
			stmt.setString(1, userId);
			ResultSet rs = stmt.executeQuery();
			List<Booking> list = new ArrayList<>();
			while (rs.next()) {
				Booking booking = new Booking(rs.getInt("booking_id"),rs.getString("listing_id"), rs.getString("user_id"), rs.getString("event_id"),
						rs.getString("event_name"),rs.getString("event_date"),rs.getString("seats"), rs.getString("bookingDate"), rs.getString("bookingPrice"));
				list.add(booking);
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
