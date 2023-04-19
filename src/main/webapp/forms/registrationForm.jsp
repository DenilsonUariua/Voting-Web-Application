<%-- 
    Document   : registrationForm
    Created on : Apr 19, 2023, 12:18:48 PM
    Author     : denilson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../styles/registrationFormStyles.css">
        <title>Registration</title>
    </head>
    <body>
        <iframe src="../components/navbar.jsp" frameborder="0" height="50" style='width: 100%'></iframe>
        <form>
            <h1>Registration Form</h1>
            <label for="firstname">First Name:</label>
            <input type="text" id="firstname" name="firstname" required>
            <label for="lastname">Last Name:</label>
            <input type="text" id="lastname" name="lastname" required>
            <label for="age">Age:</label>
            <input type="number" id="age" name="age" required>
            <label for="id">ID:</label>
            <input type="text" id="id" name="id" required>
            <label for="political-party">Political Party:</label>
            <select id="political-party" name="political-party">
                <option value="democratic">SWAPO</option>
                <option value="republican">NEEF</option>
                <option value="green">NUDO</option>
                <option value="libertarian">PDM</option>
            </select><br>

            <input type="submit" value="Submit">
        </form>
        
        <iframe src="../components/footer.jsp" frameborder="0" height="50" style='width: 100%'></iframe>
    </body>
</html>
