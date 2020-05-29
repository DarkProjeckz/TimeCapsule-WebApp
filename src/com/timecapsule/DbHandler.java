package com.timecapsule;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

public class DbHandler {

	//Remote database connection
	private static final String HOST = "localhost";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "";
	private static final String DATABASE = "timecapsule";
	private static final String DB_URL = "jdbc:mysql://"+HOST+":3306/"+DATABASE;
	private static Connection conn=null;
	
	public static Connection getConnection(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			try {
				 conn = DriverManager.getConnection(DB_URL,USERNAME,PASSWORD);	
			}
			catch(Exception e)
			{
				System.out.println("Connection error");
				e.printStackTrace();
			}
		}
		catch(Exception e1)
		{
			System.out.println("Driver loading error");
			e1.printStackTrace();
		}	
		return conn;
	}
	
	public int getEventCount(int id){
		int count=0;
		Connection con = getConnection();
		try {
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery("SELECT count(*) FROM EVENTS WHERE user_id="+id+";");
			rs.next();
			count = rs.getInt(1);
			System.out.println("Getting event count.....!!");
			con.close();
		}catch(Exception e){
			System.out.println("Error in fetching count !!");e.printStackTrace();
		}
		return count;
	}
	
	public int userInsert(String username,String password,String confirmPassword,String email,String dateOfBirth,String mobileNumber,String gender){
		int result = 0;
		Connection con = getConnection();
		try {
			Statement state = con.createStatement();
			result = state.executeUpdate("INSERT INTO USERS (uname,passwd,cpass,email,dob,phno,gender) values('"+username+"','"+password+"','"+confirmPassword+"','"+email+"','"+dateOfBirth+"',"+mobileNumber+",'"+gender+"')");
			System.out.println("Adding new user.....!!");
			con.close();
		}catch(Exception e){
			System.out.println("Error in inserting user data !!");e.printStackTrace();
		}
		return result;
	}

	public boolean checkUniqueUser(String username){
		boolean result = false;
		Connection con = getConnection();
		try {
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery("SELECT uname from USERS where uname='"+username+"'");
			if(rs.next())	result = true;
			System.out.println("Checking unique user.....!!");
			con.close();
		}catch(Exception e){
			System.out.println("Error in checking unique user!!");e.printStackTrace();
		}
		return result;
	}
	
	public int authenticateUser(String username,String password){
		int result = 0;
		Connection con = getConnection();
		try {
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery("SELECT id from USERS where uname='"+username+"' and passwd='"+password+"'");
			if(rs.next())	result = rs.getInt("id");
			System.out.println("Authenticating user.....!!");
			con.close();
		}catch(Exception e){
			System.out.println("Error in authenticating user!!");e.printStackTrace();
		}
		return result;
	}
	
	public Map<String,String> getUserData(int id){
		Map<String,String> userData = new HashMap<String,String>();
		Connection con = getConnection();
		try {
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery("SELECT uname,email,dob,phno FROM USERS WHERE id="+id+"");
			rs.next();
			userData.put("name",rs.getString("uname"));
			userData.put("mail", rs.getString("email"));
			userData.put("dobs",rs.getString("dob"));
			userData.put("phnos",""+rs.getLong("phno"));
			System.out.println("Getting user data.....!!");
			con.close();
		}catch(Exception e){
			System.out.println("Error in getting user data!!");e.printStackTrace();
		}
		return userData;
	}
	
	public boolean checkDataExistence(int id,String title, String date){
		boolean result = false;
		Connection con = getConnection();
		try {
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery("SELECT id from EVENTS WHERE USER_ID="+id+" AND title='"+title+"' AND dat='"+date+"';");
			if(rs.next()) result = true;
			System.out.println("Checking For data existence!!");
			con.close();
		}catch(Exception e){
			System.out.println("Error in checking data existence!!");e.printStackTrace();
		}
		return result;
	}
	
	public boolean addEvent(int id,String title, String date,String data){
		boolean result = false;
		Connection con = getConnection();
		try {
			Statement state = con.createStatement();
			state.executeUpdate("INSERT INTO EVENTS (user_id,title,dat,cont) values("+id+",'"+title+"','"+date+"','"+data+"')");
			result = true;
			System.out.println("Adding event.....!!");
			con.close();
		}catch(Exception e){
			System.out.println("Error in adding event!!");e.printStackTrace();
		}
		return result;
	}
	
	public boolean modifyEvent(int id,String title, String date,String data){
		boolean result = false;
		Connection con = getConnection();
		try {
			Statement state = con.createStatement();
			state.executeUpdate("UPDATE EVENTS set cont='"+data+"' where title='"+title+"' and dat='"+date+"' and USER_ID="+id+"");
			result = true;
			System.out.println("Modifying event.....!!");
			con.close();
		}catch(Exception e){
			System.out.println("Error in modifying event!!");e.printStackTrace();
		}
		return result;
	}
	
	public String displayEvent(int id,String title, String date){
		String result = "";
		Connection con = getConnection();
		try {
			Statement state = con.createStatement();
			ResultSet rs = state.executeQuery("SELECT cont FROM EVENTS where title='"+title+"' and dat='"+date+"'and USER_ID="+id+"");
			if(rs.next()) {
			result = rs.getString("cont");
			System.out.println("Displaying event.....!!"); }
			con.close();
		}catch(Exception e){
			System.out.println("Error in displaying event!!");e.printStackTrace();
		}
		return result;
	}
}