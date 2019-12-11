package com.dev.sportshub.beans;

public class User {

	private Integer id;
	private String name;
	private String emailAddress;
	private String password;
	
	
	public User() {
		super();
	}
	public User(Integer id, String name, String emailAddress, String password) {
		super();
		this.id = id;
		this.name = name;
		this.emailAddress = emailAddress;
		this.password = password;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getEmailAddress() {
		return emailAddress;
	}
	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
