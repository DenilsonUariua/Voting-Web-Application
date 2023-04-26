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
         <link rel="stylesheet" href="../styles/homePageStyles.css">
        <title>Home</title>
    </head>
    <body>
        <iframe src="../components/navbar.jsp" frameborder="0" height="50" style='width: 100%'></iframe>
        <div align="center">
            <h1><p>Welcome <%= session.getAttribute("firstname")%>!</p></h1>
            <div class="card">
                <a href="./votingPage.jsp">
                    <div class="card-image">
                        <img src="../assets/images/ballot.png" alt="Election Card Image" class="election-card-image">
                    </div>
                    <div class="card-content">
                        <h2>Election Day</h2>
                        <p>Click here to cast your vote and make your voice heard!</p>
                    </div>
                </a>
            </div>
        </div>
        

        <iframe src="../components/footer.jsp" frameborder="0" height="50" style='width: 100%'></iframe>
    </body>
</html>
