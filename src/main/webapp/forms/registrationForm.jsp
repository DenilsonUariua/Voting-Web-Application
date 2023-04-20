<%-- 
    Document   : registrationForm
    Created on : Apr 20, 2023, 7:50:49 AM
    Author     : denilson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="../styles/registrationFormStyles.css">
        <script src="../scripts/registrationScripts.js"></script>
        <title>Voter and Candidate Registration</title>
        <style>
            /* Style the tab buttons */
            .tab {
                display: inline-block;
                background-color: #ddd;
                border: 1px solid #ccc;
                border-radius: 4px 4px 0 0;
                padding: 10px;
                cursor: pointer;
                font-size: 18px;
                margin-right: 10px;
            }

            /* Style the active tab button */
            .active {
                background-color: #fff;
                border-bottom: none;
            }

            /* Style the tab content */
            .tabcontent {
                display: none;
                border: 1px solid #ccc;
                border-radius: 0 0 4px 4px;
                padding: 10px;
            }
        </style>
    </head>
    <body>
        <iframe src="../components/navbar.jsp" frameborder="0" height="50" style='width: 100%'></iframe>
        <div>
            <!-- Tab buttons -->
            <button class="tab active" onclick="openTab(event, 'voter')">Voter Registration</button>
            <button class="tab" onclick="openTab(event, 'candidate')">Candidate Registration</button>
        </div>

        <div id="voter" class="tabcontent" style="display: block;">
            <!-- Voter registration form here -->  
            <form>
                <h1>Voter Registration Form</h1>
                <label for="firstname">First Name:</label>
                <input type="text" id="firstname" name="firstname" required>
                <label for="lastname">Last Name:</label>
                <input type="text" id="lastname" name="lastname" required>
                <label for="age">Age:</label>
                <input type="number" id="age" name="age" required>
                <label for="id">ID:</label>
                <input type="text" id="id" name="id" required>
                <input type="submit" value="Submit">
            </form>
        </div>

        <div id="candidate" class="tabcontent">
            <!-- Candidate registration form here -->
            <form>
                <h1>Candidate Registration Form</h1>
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
        </div>

        <iframe src="../components/footer.jsp" frameborder="0" height="50" style='width: 100%'></iframe>
    </body>
</html>
