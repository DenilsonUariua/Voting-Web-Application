<%-- 
    Document   : homePage
    Created on : Apr 19, 2023, 12:20:34 PM
    Author     : denilson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>
        <h1><p>Welcome <%= session.getAttribute("firstname") %>!</p></h1>
    </body>
</html>
