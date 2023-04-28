<%-- 
    Document   : adminPage
    Created on : Apr 28, 2023, 11:15:55 AM
    Author     : 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../styles/adminPageStyles.css">
        <title>Administrator</title>
    </head>
    <style>
        body{
            margin: 0;
        }
    </style>
    <body>
        <iframe src="../components/adminNavbar.jsp" frameborder="0" height="100" style='width: 100%'></iframe>
        <%@ page import="java.sql.*" 
                 import= "com.votingapp.mavenproject1.*"%>
        <h1>Table of Candidates and the number of votes they received</h1>
        <table>
            <tr>
                <th>Candidate Name</th>
                <th>Number of Votes</th>
            </tr>
            <%
                // Establish a connection to the PostgreSQL database
                Connection conn = DBConnection.getConnection();
                try {

                    Statement stmt = null;
                    ResultSet rs = null;
                    stmt = conn.createStatement();

                    // Retrieve the data from the candidates table
                    String sql = "SELECT * FROM candidates";
                    rs = stmt.executeQuery(sql);

                    // Display the data in a table
                    while (rs.next()) {
                        String name = rs.getString("firstname") + " " + rs.getString("lastname");
                        int votes = rs.getInt("votes");
            %>
            <tr>
                <td><%=name%></td>
                <td><%=votes%></td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    conn.close();
                }
            %>
        </table>
    </body>
</html>
