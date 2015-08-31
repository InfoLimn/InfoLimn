package com.pictter.infolimn.service;

import java.sql.*;
import java.util.ArrayList;

public class CategoryService {

	// JDBC driver name and database URL
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://localhost/mysql";

	// Database credentials
	static final String USER = "root";
	static final String PASS = "";

	ArrayList<String> categories = new ArrayList<String>();

	public ArrayList<String> callService() {

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

			sql = "SELECT Category_Name FROM InfoLimn.Category;";
			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {

				categories.add(rs.getString("Category_Name"));

			}
			System.out.println(categories);
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

		return categories;
	}

}
