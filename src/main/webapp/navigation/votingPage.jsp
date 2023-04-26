<%-- 
    Document   : votingPage
    Created on : Apr 26, 2023, 11:07:44 AM
    Author     : denilson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vote</title>
    </head>
    <body>
        <iframe src="../components/navbar.jsp" frameborder="0" height="50" style='width: 100%'></iframe>
            <%@ page import="java.sql.*" %>

        <%
             Class.forName("org.postgresql.Driver");
            // Establish a connection to the PostgreSQL database
            String url = "jdbc:postgresql://localhost:5432/my_database";
            String user = "postgres";
            String password = "password";
            Connection conn = DriverManager.getConnection(url, user, password);

            // Retrieve candidate data from the database
            String sql = "SELECT * FROM candidates";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            // Display each candidate in a card
            while (rs.next()) {
                String name = rs.getString("firstname");
                String party = rs.getString("political_party");
                int id = rs.getInt("id");
        %>
        <div class="card">
            <div class="card-header"><%= name%></div>
            <div class="card-body">
                <img src="<%= party%>" alt="<%= name%>">
                <p><%= party%></p>
                <!-- Add any other relevant information about the candidate -->
            </div>
            <div class="card-footer">
                <form method="post" action="/mavenproject1/processVote">
                    <input type="hidden" name="candidateId" value="<%= id%>">
                    <input type="hidden" name="voterId" value="<%= session.getAttribute("userId")%>">
                    <button type="submit" class="btn btn-primary">Vote</button>
                </form>
            </div>
        </div>
        <%
            }

            // Close the database connection and resources
            rs.close();
            stmt.close();
            conn.close();
        %>

        <iframe src="../components/footer.jsp" frameborder="0" height="50" style='width: 100%'></iframe>
    </body>
</html>
