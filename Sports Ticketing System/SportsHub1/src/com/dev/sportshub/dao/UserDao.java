package com.dev.sportshub.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.dev.sportshub.beans.User;
import com.dev.sportshub.utils.MySQLConnUtils;

public class UserDao {

	
	private final String insertQuery = "insert into userdetails(name,emailAddress,password,type) values(?,?,?,?)";
//	private final String updateQuery = "update userdetails set firstName=?,lastName=?,resume=?,mobile=?,company=?,profileimage=?,location=? where id=?";
	private final String retrieveQuery = "select id,name,emailAddress,password from userdetails where type='user'";
	private final String retrieveUserById = "select id,name,emailAddress,password from userdetails where id=?";
	private final String loginQuery = "select id,name,emailAddress,password from userdetails where emailAddress=? and password=? and type=?";
	
	public int saveUserDetails(User userDetails) {
		try(Connection connection = MySQLConnUtils.getMySQLConnection(); PreparedStatement prSt = connection.prepareStatement(insertQuery);){
            prSt.setString(1, userDetails.getName());
            prSt.setString(2, userDetails.getEmailAddress());
            prSt.setString(3, userDetails.getPassword());
            prSt.setString(4, "user");
            return prSt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
        }
		return 0;
	}
	
	public User login(String emailAddress,String password,String type){
		
		User userDetails =null;
		try(Connection connection = MySQLConnUtils.getMySQLConnection();PreparedStatement stmt = connection.prepareStatement(loginQuery)) {
			stmt.setString(1, emailAddress);
			stmt.setString(2, password);
			stmt.setString(3, type);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()){
				userDetails = new User(rs.getInt("id"), rs.getString("name"), rs.getString("emailAddress"), rs.getString("password"));
			}
			return userDetails;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<User> getUserDetails(){
		try(Connection connection = MySQLConnUtils.getMySQLConnection();Statement stmt = connection.createStatement();) {
			ResultSet rs = stmt.executeQuery(retrieveQuery);
			List<User> list = new ArrayList<>();
			while(rs.next()){
				User userDetails = new User(rs.getInt("id"), rs.getString("name"),rs.getString("emailAddress"),
						rs.getString("password"));
				list.add(userDetails);
			}
			return list;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public User getUserDetailsById(Integer id) {
		User userDetails =null;
		try(Connection connection = MySQLConnUtils.getMySQLConnection();PreparedStatement stmt = connection.prepareStatement(retrieveUserById)) {
			stmt.setInt(1, id);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()){
				userDetails = new User(rs.getInt("id"), rs.getString("name"), rs.getString("emailAddress"),
						rs.getString("password"));
			}
			return userDetails;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

}
