package com.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class MyConnexion {

	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/jlc";
    private static final String USERNAME = "dev";
    private static final String PASSWORD = "ainachelicoco";

 public static Connection getConnection() throws SQLException {
    	 Connection con;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
           con= DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
      
           PreparedStatement preparedStatement = con.prepareStatement(
        		    "CREATE TABLE IF NOT EXISTS locations(" +
        		    "id INT PRIMARY KEY AUTO_INCREMENT, " +
        		    "car_name VARCHAR(255), " +
        		    "color VARCHAR(50), " +
        		    "price DECIMAL(10,2), " +
        		    "stock INT" +
        		    ")");
 
           preparedStatement.execute();
        		   } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC Driver not found", e);
        }
        return con;
    }

    // Close the connection
    public static void closeConnection(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
