# Voting Web Application
This is a simple web application that allows users to vote on various topics. It is built using Java and deployed using Apache Tomcat.

### Features
1. Allows users to vote on various topics
2. Keeps track of the number of votes for each topic
3. Provides real-time updates when new votes are cast

### Technology Stack
1. Java
2. Apache Tomcat
3. HTML/CSS
4. JavaScript

### Getting Started
1. Clone the repository to your local machine
2. Open the project in Netbeans
3. Build the project to generate the WAR file
4. Deploy the WAR file to Apache Tomcat
5. Access the application through a web browser using the URL http://localhost:8080/VotingWebApp

### Contributing
Contributions are welcome! If you would like to contribute to this project, please follow these steps:

### Fork the repository
Create a new branch (git checkout -b new-feature)
Make your changes and commit them (git commit -am 'Add new feature')
Push to the branch (git push origin new-feature)
Create a new pull request

### License
This project is licensed under the MIT License. See the LICENSE file for details.

### Contact
If you have any questions or comments about this project, please feel free to contact me at [your email address].

#### Tables
##### Table name: canditates
###### fields
1. firstname
2. lastname
3. age
4. password
5. political_party
6. identificationnumber
7.votes
###### query
CREATE TABLE candidates (
    id SERIAL PRIMARY KEY,
    firstname VARCHAR(150) NOT NULL,
    lastname VARCHAR(150) NOT NULL,
    password VARCHAR(150) NOT NULL,
    age INTEGER NOT NULL,
    identificationnumber INTEGER UNIQUE NOT NULL,
    political_party VARCHAR(50) NOT NULL,
    votes INTEGER DEFAULT 0
);

##### Table name: voters
###### fields
1. firstname
2. lastname
3. age
4. password
5. id_number
6. voted
###### query
CREATE TABLE voters (
    id SERIAL PRIMARY KEY,
    firstname VARCHAR(150),
    lastname VARCHAR(150),
    password VARCHAR(150),
    age INTEGER,
    id_number INTEGER UNIQUE,
    voted BOOLEAN DEFAULT false
);

##### Table name: votes
###### fields
1. candidate_id
2. voter_id
3. vote_time
###### query
CREATE TABLE votes (
    id SERIAL PRIMARY KEY,
    candidate_id INTEGER NOT NULL,
    voter_id INTEGER NOT NULL,
    vote_time TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (candidate_id) REFERENCES candidates(id),
    FOREIGN KEY (voter_id) REFERENCES voters(id_number)
);

##### Table name: administrators
###### fields
1. username
2. password
###### query
1. CREATE TABLE administrators (
    id SERIAL PRIMARY KEY,
    username VARCHAR(150) NOT NULL,
    password VARCHAR(150) NOT NULL
);
2. INSERT INTO administrators (username, password) VALUES 
('admin1', 'password1'),
('admin2', 'password2'),
('admin3', 'password3');


