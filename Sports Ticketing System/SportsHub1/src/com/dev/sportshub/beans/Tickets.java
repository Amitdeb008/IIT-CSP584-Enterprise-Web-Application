package com.dev.sportshub.beans;

public class Tickets {

	private String listingId;
	private String eventId;
	private Double pricePerProduct;
	private String row;
	private String sectionName;

	public String getListingId() {
		return listingId;
	}

	public void setListingId(String listingId) {
		this.listingId = listingId;
	}

	public String getEventId() {
		return eventId;
	}

	public void setEventId(String eventId) {
		this.eventId = eventId;
	}

	public Double getPricePerProduct() {
		return pricePerProduct;
	}

	public void setPricePerProduct(Double pricePerProduct) {
		this.pricePerProduct = pricePerProduct;
	}

	public String getRow() {
		return row;
	}

	public void setRow(String row) {
		this.row = row;
	}

	public String getSectionName() {
		return sectionName;
	}

	public void setSectionName(String sectionName) {
		this.sectionName = sectionName;
	}

	public Tickets(String listingId, String eventId, Double pricePerProduct, String row, String sectionName) {
		super();
		this.listingId = listingId;
		this.eventId = eventId;
		this.pricePerProduct = pricePerProduct;
		this.row = row;
		this.sectionName = sectionName;
	}

	public Tickets() {
		super();
		// TODO Auto-generated constructor stub
	}
}
