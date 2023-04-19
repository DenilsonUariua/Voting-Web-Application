<%-- 
    Document   : navbar
    Created on : Apr 19, 2023, 12:59:25 PM
    Author     : denilson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="../styles/navbarStyles.css">
    </head>
    <body>
        <nav class="navbar">
            <div class="navbar-brand">
                <img src="./icons/voting-icon.png" alt="Voting Icon" width="30" height="30">
                <span>Voting Application</span>
            </div>
            <div class="navbar-nav">
                <a class="nav-link" href="../navigation/aboutPage.jsp" target="content">About</a>
                <a class="nav-link" href="../forms/registrationForm.jsp" target="content">Register</a>
                <a class="nav-link" href="../forms/loginForm.jsp" target="content">Login</a>
            </div>
        </nav>
    </body>
</html>
