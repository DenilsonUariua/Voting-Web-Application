<%-- 
    Document   : votingPage
    Created on : Apr 26, 2023, 11:07:44 AM
    Author     : 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../styles/votingPageStyles.css">
        <title>Vote</title>
    </head>
    <style>
        body {
            margin: 0;
        }
    </style>
    <body>
        <iframe src="../components/navbar.jsp" frameborder="0" height="50" style='width: 100%'></iframe>
            <%@ page import="java.sql.*" 
                     import= "com.votingapp.mavenproject1.*"%>
        <div class="voting-cards-container">
            <%
                // Establish a connection to the PostgreSQL database
                Connection conn = DBConnection.getConnection();

                // Retrieve candidate data from the database
                String sql = "SELECT * FROM candidates";
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);

                // Display each candidate in a card
                while (rs.next()) {
                    String name = rs.getString("firstname") + " " + rs.getString("lastname");
                    String party = rs.getString("political_party");
                    int id = rs.getInt("id");
            %>
            <div class="card">
                <div class="card-header">Candidate name: <%= name%></div>
                <div class="card-body">
                    <p>Political Party: <%= party%></p>
                    <!-- Add any other relevant information about the candidate -->
                </div>
                <div class="card-footer">
                    <form method="post" action="/mavenproject1/processVote">
                        <input type="hidden" name="candidateId" value="<%= id%>">
                        <input type="hidden" name="voterId" value="<%= session.getAttribute("idNumber")%>">
                        <% if ((Boolean) session.getAttribute("voted")) {%>
                        <p>You Already Voted!!!</p>
                        <% } else { %>
                        <button type="submit" class="btn btn-primary">Vote</button>
                        <% }%>
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
        </div>
        <iframe src="../components/footer.jsp" frameborder="0" height="50" style='width: 100%'></iframe>
    </body>
</html>
