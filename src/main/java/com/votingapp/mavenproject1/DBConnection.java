/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.votingapp.mavenproject1;

/**
 *
 * @author 
 */
import java.sql.*;

public class DBConnection {
    private static final String url = "jdbc:postgresql://localhost:5432/my_database";
    private static final String user = "postgres";
    private static final String password = "password";
    private static Connection conn;

    public static Connection getConnection() {
        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection(url, user, password);
            System.out.println("Database connection successful.");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Database connection failed." + e);
        }
        return conn;
    }
}
