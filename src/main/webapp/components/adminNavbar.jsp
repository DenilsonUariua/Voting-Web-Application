<%--
Document : adminNavbar
Created on : Apr 28, 2023, 11:19:15 AM
Author : 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="../styles/adminNavbarStyles.css">
    </head>
    <body>
        <% if (session.getAttribute("username") != null) { %>
            <nav class="navbar">
                <div class="navbar-brand">
                    <img src="../assets/icons/voting-icon.png" alt="Voting Icon" width="30" height="30">
                    <span>Voting Application - Admin</span>
                </div>
                <div class="navbar-nav">
                    <a class="nav-link" href="../navigation/adminPage.jsp" target="_top">Dashboard</a>
                    <a class="nav-link" href="../forms/logout.jsp" target="_top">Logout</a>
                </div>
            </nav>
        <% } else { %>
            <nav class="navbar">
                <div class="navbar-brand">
                    <img src="../assets/icons/voting-icon.png" alt="Voting Icon" width="30" height="30">
                    <span>Voting Application - Admin</span>
                </div>
                <div class="navbar-nav">
                    <a class="nav-link" href="../forms/adminLoginForm.jsp" target="_top">Admin Login</a>
                </div>
            </nav>
        <% } %>
    </body>
</html>



