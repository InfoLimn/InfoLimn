package com.pictter.infolimn.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

public class InfoLimnService {

	// JDBC driver name and database URL
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://localhost/mysql";

	// Database credentials
	static final String USER = "root";
	static final String PASS = "";

	ArrayList<HashMap<String, String>> infolimns = new ArrayList<HashMap<String, String>>();
	

	public ArrayList<HashMap<String, String>> callService() {

		Connection conn = null;
		Statement stmt = null;
		System.out.println("In callService");
		try {

			Class.forName("com.mysql.jdbc.Driver");

			System.out.println("Connecting to database...");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);

			System.out.println("Creating statement...");
			stmt = conn.createStatement();
			String sql;

			sql = "SELECT * FROM InfoLimn.InfoLimns RIGHT JOIN InfoLimn.Category ON InfoLimns.Category=Category.Category_ID";
			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				HashMap<String, String> infolimn = new HashMap<String, String>();
				infolimn.put("InfoLimnId", rs.getString("InfoLimn_ID"));
				infolimn.put("Title", rs.getString("Title"));
				infolimn.put("Description", rs.getString("Description"));
				infolimn.put("URL", rs.getString("URL"));
				infolimn.put("Category", rs.getString("Category_Name"));
				infolimn.put("UpLoadedTimeStamp",
						rs.getString("UpLoadedTimeStamp"));

				infolimns.add(infolimn);
			}

			rs.close();
			stmt.close();
			conn.close();
		} catch (SQLException se) {
			// Handle errors for JDBC
			se.printStackTrace();
		} catch (Exception e) {
			// Handle errors for Class.forName
			e.printStackTrace();
		} finally {
			// finally block used to close resources
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException se2) {
			}// nothing we can do
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}// end finally try
		}// end try

		return infolimns;
	}
}
