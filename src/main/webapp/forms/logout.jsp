<%-- 
    Document   : logout
    Created on : Apr 26, 2023, 9:00:00 AM
    Author     : denilson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Logout</title>
    </head>
    <body>
        <%            
            // If the session exists, invalidate it to logout the user
            if(session != null) {
                session.invalidate();
            }
            // Redirect the user to the login page
            response.sendRedirect(request.getContextPath() + "/forms/loginForm.jsp");
        %>
    </body>
</html>