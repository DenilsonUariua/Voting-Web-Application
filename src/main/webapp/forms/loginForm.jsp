<%-- 
    Document   : loginForm
    Created on : Apr 19, 2023, 2:29:45 PM
    Author     : denilson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="../styles/loginFormStyles.css">
        <title>Login</title>
    </head>
    <body>
        <iframe src="../components/navbar.jsp" frameborder="0" height="50" style='width: 100%'></iframe>
        
        <div class="container">
            <h1>Login Form</h1>
            <form action="/mavenproject1/login" method="post">
                <label for="username">Firstname</label>
                <input type="text" id="firstname" name="firstname" required>

                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>

                <input type="submit" value="Login">
            </form>
        </div>

        <iframe src="../components/footer.jsp" frameborder="0" height="50" style='width: 100%'></iframe>
    </body>
</html>
