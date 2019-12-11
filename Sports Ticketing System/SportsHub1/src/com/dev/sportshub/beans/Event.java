package com.dev.sportshub.beans;

public class Event {

	private String eventId;
	private String eventName;
	private String sportName;
	private String groupName;
	private String eventDate;
	private String eventPlace;
	private String eventCity;
	private String eventState;
	private String eventZip;
	private String discount;
	public String getEventId() {
		return eventId;
	}
	public void setEventId(String eventId) {
		this.eventId = eventId;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public String getSportName() {
		return sportName;
	}
	public void setSportName(String sportName) {
		this.sportName = sportName;
	}
	public String getEventDate() {
		return eventDate;
	}
	public void setEventDate(String eventDate) {
		this.eventDate = eventDate;
	}
	public String getEventPlace() {
		return eventPlace;
	}
	public void setEventPlace(String eventPlace) {
		this.eventPlace = eventPlace;
	}
	public String getEventCity() {
		return eventCity;
	}
	public void setEventCity(String eventCity) {
		this.eventCity = eventCity;
	}
	public String getEventState() {
		return eventState;
	}
	public void setEventState(String eventState) {
		this.eventState = eventState;
	}
	public String getEventZip() {
		return eventZip;
	}
	public void setEventZip(String eventZip) {
		this.eventZip = eventZip;
	}
	public String getDiscount() {
		return discount;
	}
	public void setDiscount(String discount) {
		this.discount = discount;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public Event(String eventId, String eventName, String sportName, String groupName, String eventDate, String eventPlace,
			String eventCity, String eventState, String eventZip, String discount) {
		super();
		this.eventId = eventId;
		this.eventName = eventName;
		this.sportName = sportName;
		this.groupName = groupName;
		this.eventDate = eventDate;
		this.eventPlace = eventPlace;
		this.eventCity = eventCity;
		this.eventState = eventState;
		this.eventZip = eventZip;
		this.discount = discount;
	}
	public Event() {
		super();
	}
	
}
