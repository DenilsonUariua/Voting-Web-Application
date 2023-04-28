<%-- 
    Document   : adminLoginForm
    Created on : Apr 28, 2023, 11:16:15 AM
    Author     : denilson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../styles/adminLoginFormStyles.css">
        <title>Admin Login</title>
    </head>
    <body>
        <h1>Admin Login</h1>
        <form action="adminLoginServlet" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" placeholder="Enter username" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Enter password" required>

            <button type="submit">Login</button>
        </form>
    </body>
</html>
