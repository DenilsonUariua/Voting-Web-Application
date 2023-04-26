<%-- 
    Document   : registrationForm
    Created on : Apr 20, 2023, 7:50:49 AM
    Author     : denilson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
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
            <form action="/mavenproject1/voterRegistration" method="post" onsubmit="return validateForm()">
                <h1>Voter Registration Form</h1>
                <label for="firstname">First Name:</label>
                <input type="text" id="firstname" name="firstname" required>
                <label for="lastname">Last Name:</label>
                <input type="text" id="lastname" name="lastname" required>
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
                <label for="age">Age:</label>
                <input type="number" id="age" name="age" required>
                <div id="age-error" style="display:none;color:red;">Age must be 18 or older</div>
                <label for="id">ID:</label>
                <input type="text" id="id" name="id" required>
                <input type="submit" value="Submit">
            </form>
        </div>
        <script>
            function validateForm() {
                var age = document.getElementById("age").value;
                if (age < 18) {
                    document.getElementById("age-error").style.display = "block";
                    return false;
                }
                return true;
            }
        </script>
        <div id="candidate" class="tabcontent">
            <!-- Candidate registration form here -->
            <form action="/mavenproject1/candidateRegistration" method="post">
                <h1>Candidate Registration Form</h1>
                <label for="firstname">First Name:</label>
                <input type="text" id="firstname" name="firstname" required>
                <label for="lastname">Last Name:</label>
                <input type="text" id="lastname" name="lastname" required>
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
                <label for="age">Age:</label>
                <input type="number" id="age" name="age" required>
                <label for="id">ID:</label>
                <input type="number" id="id" name="id" required>
                <label for="political-party">Political Party:</label>
                <select id="political-party" name="political-party">
                    <option value="SWAPO">SWAPO</option>
                    <option value="NEEF">NEEF</option>
                    <option value="NUDO">NUDO</option>
                    <option value="PDM">PDM</option>
                </select><br>

                <input type="submit" value="Submit">
            </form>
        </div>

        <iframe src="../components/footer.jsp" frameborder="0" height="50" style='width: 100%'></iframe>
    </body>
</html>

