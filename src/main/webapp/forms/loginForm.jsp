<%-- 
    Document   : loginForm
    Created on : Apr 19, 2023, 2:29:45 PM
    Author     : 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="../styles/loginFormStyles.css">
        <title>Login</title>

    </head>
    <style>
        .error-message {
            color: red;
            font-weight: bold;
            margin-bottom: 10px;
        }
    </style>
    <body>
        <iframe src="../components/navbar.jsp" frameborder="0" height="50" style='width: 100%'></iframe>

        <div class="container">
            <h1>Login Form</h1>
            <form action="/mavenproject1/login" method="post">
                <%
                    // Check if the error parameter is present in the URL
                    String error = request.getParameter("error");
                    if (error != null && error.equals("1")) {
                %>
                <p class="error-message">Incorrect Firstname or password. Please try again.</p>
                <%
                    }
                %>
                <label for="firstname">Firstname</label>
                <input type="text" id="firstname" name="firstname" required>

                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>

                <input type="submit" value="Login">
            </form>
            <a class="admin-link"href="./adminLoginForm.jsp">Login as administrator</a>
        </div>

        <iframe src="../components/footer.jsp" frameborder="0" height="50" style='width: 100%'></iframe>
    </body>
</html>
