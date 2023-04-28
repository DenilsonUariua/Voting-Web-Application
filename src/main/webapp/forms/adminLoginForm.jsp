<%-- 
    Document   : adminLoginForm
    Created on : Apr 28, 2023, 11:16:15 AM
    Author     : 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../styles/adminLoginFormStyles.css">
        <title>Admin Login</title>
    </head>
    <style>
        .error-message {
            color: red;
            font-weight: bold;
            margin-bottom: 10px;
        }

        body{
            margin: 0;
        }
    </style>
    <body>
        <iframe src="../components/adminNavbar.jsp" frameborder="0" height="100" style='width: 100%'></iframe>
        <h1>Admin Login</h1>
        <form action="/mavenproject1/adminLogin" method="post">
            <%
                // Check if the error parameter is present in the URL
                String error = request.getParameter("error");
                if (error != null && error.equals("1")) {
            %>
            <p class="error-message">Incorrect username or password. Please try again.</p>
            <%
                }
            %>

            <label for="username">Username:</label>
            <input type="text" id="username" name="username" placeholder="Enter username" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Enter password" required>

            <button type="submit">Login</button>
        </form>
    </body>
</html>
