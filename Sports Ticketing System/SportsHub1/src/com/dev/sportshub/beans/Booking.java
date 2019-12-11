package com.dev.sportshub.beans;

public class Booking {

	private Integer bookingId;
	private String listingId;
	private String userId;
	private String eventId;
	private String eventName;
	private String eventDate;
	private String seats;
	private String bookingDate;
	private String bookingPrice;

	
	public String getListingId() {
		return listingId;
	}

	public void setListingId(String listingId) {
		this.listingId = listingId;
	}

	public Integer getBookingId() {
		return bookingId;
	}

	public void setBookingId(Integer bookingId) {
		this.bookingId = bookingId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getEventId() {
		return eventId;
	}

	public void setEventId(String eventId) {
		this.eventId = eventId;
	}

	public String getSeats() {
		return seats;
	}

	public void setSeats(String seats) {
		this.seats = seats;
	}

	public String getBookingDate() {
		return bookingDate;
	}

	public void setBookingDate(String bookingDate) {
		this.bookingDate = bookingDate;
	}

	public String getBookingPrice() {
		return bookingPrice;
	}

	public void setBookingPrice(String bookingPrice) {
		this.bookingPrice = bookingPrice;
	}

	public String getEventName() {
		return eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	public String getEventDate() {
		return eventDate;
	}

	public void setEventDate(String eventDate) {
		this.eventDate = eventDate;
	}

	public Booking(Integer bookingId, String listingId, String userId, String eventId, String eventName,
			String eventDate, String seats, String bookingDate, String bookingPrice) {
		super();
		this.bookingId = bookingId;
		this.listingId = listingId;
		this.userId = userId;
		this.eventId = eventId;
		this.eventName = eventName;
		this.eventDate = eventDate;
		this.seats = seats;
		this.bookingDate = bookingDate;
		this.bookingPrice = bookingPrice;
	}

	public Booking() {
		super();
		// TODO Auto-generated constructor stub
	}

}
