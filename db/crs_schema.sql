// Create CRS Database
CREATE DATABASE IF NOT EXISTS crs_db;
USE crs_db;

// Create Users table
CREATE TABLE IF NOT EXISTS Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('Admin', 'Faculty', 'Student') NOT NULL
);


// create Students table
CREATE TABLE IF NOT EXISTS Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    program_of_study VARCHAR(100) NOT NULL,
    year INT NOT NULL,
    contact_info VARCHAR(255),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);


// Create Courses table
CREATE TABLE IF NOT EXISTS Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    department VARCHAR(100) NOT NULL,
    credit_hours INT NOT NULL,
    max_enrollment INT NOT NULL,
    prerequisites VARCHAR(255) DEFAULT NULL
);


// Create Enrollments table
CREATE TABLE IF NOT EXISTS Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    department VARCHAR(100) NOT NULL,
    credit_hours INT NOT NULL,
    max_enrollment INT NOT NULL,
    prerequisites VARCHAR(255) DEFAULT NULL
);


//  Insert Users
INSERT INTO Users (username, password, role, user_id) 
VALUES 
    ('admin_sri', 'admin123', 'Admin', 1),               -- User ID 1 (Admin)
    ('prof_perera', 'perera456', 'Faculty',2),          -- User ID 2 (Faculty)
    ('prof_fernando', 'fernando789', 'Faculty',3),      -- User ID 3 (Faculty)
   
    
// Insert Students
INSERT INTO Students (first_name, last_name, date_of_birth, program_of_study, year, contact_info, user_id)
VALUES 
    ('Shanika', 'Perera', '2000-04-15', 'Computer Science', 3, 'shanika.perera@university.lk', 4),
    ('Kasun', 'Silva', '2001-02-10', 'Electrical Engineering', 2, 'kasun.silva@university.lk', 5),
    ('Nisha', 'Wickramasinghe', '2000-11-30', 'Mechanical Engineering', 3, 'nisha.wickramasinghe@university.lk', 6),
    ('Dimuth', 'Gunawardena', '1999-07-22', 'Civil Engineering', 4, 'dimuth.gunawardena@university.lk', 7),
    ('Ayesha', 'Rajapaksha', '2001-08-12', 'Biotechnology', 2, 'ayesha.rajapaksha@university.lk', 8),
    ('Nirasha', 'Kumarasinghe', '2001-01-15', 'Law', 2, 'nirasha.kumarasinghe@university.lk', 9),
    ('Rohan', 'De Silva', '2000-05-28', 'Architecture', 3, 'rohan.desilva@university.lk', 10),
    ('Chathura', 'Mendis', '2001-03-05', 'Computer Science', 2, 'chathura.mendis@university.lk', 11),
    ('Haritha', 'Rajapaksha', '1999-09-18', 'Civil Engineering', 4, 'haritha.rajapaksha@university.lk', 12),
    ('Buddhika', 'Fernando', '2000-06-25', 'Mechanical Engineering', 3, 'buddhika.fernando@university.lk', 13),
    ('Yasitha', 'Fernando', '2001-02-19', 'Electrical Engineering', 2, 'yasitha.fernando@university.lk', 14),
    ('Jeevani', 'Rathnayake', '2000-04-03', 'Biotechnology', 3, 'jeevani.rathnayake@university.lk', 15),
    ('Tharindu', 'Seneviratne', '2000-08-29', 'Computer Science', 3, 'tharindu.seneviratne@university.lk', 16),
    ('Thilina', 'Bandara', '2001-07-14', 'Mechanical Engineering', 2, 'thilina.bandara@university.lk', 17),
    ('Anushka', 'Perera', '1999-11-10', 'Architecture', 4, 'anushka.perera@university.lk', 18),
    ('Akhila', 'Mudalige', '2000-02-07', 'Law', 3, 'akhila.mudalige@university.lk', 19),
    ('Sachini', 'De Silva', '2001-09-22', 'Civil Engineering', 2, 'sachini.desilva@university.lk', 20),
    ('Kavindi', 'Rajapaksha', '2000-01-12', 'Electrical Engineering', 3, 'kavindi.rajapaksha@university.lk', 21),
    ('Nimanthi', 'Jayasuriya', '1999-05-18', 'Computer Science', 4, 'nimanthi.jayasuriya@university.lk', 22),
    ('Asanka', 'Perera', '2001-03-13', 'Civil Engineering', 2, 'asanka.perera@university.lk', 23),
    ('Chandima', 'Pathirana', '2000-08-01', 'Biotechnology', 3, 'chandima.pathirana@university.lk', 24),
    ('Samanthi', 'Kumari', '2001-04-27', 'Mechanical Engineering', 2, 'samanthi.kumari@university.lk', 25),
    ('Heshan', 'Dissanayake', '2000-10-08', 'Electrical Engineering', 3, 'heshan.dissanayake@university.lk', 26),
    ('Sithum', 'Rajapaksha', '1999-12-25', 'Law', 4, 'sithum.rajapaksha@university.lk', 27),
    ('Ishara', 'Fernando', '2001-01-30', 'Architecture', 2, 'ishara.fernando@university.lk', 28),
    ('Vishmitha', 'Wijesinghe', '2000-03-17', 'Biotechnology', 3, 'vishmitha.wijesinghe@university.lk', 29),
    ('Janaka', 'Wickramasinghe', '2001-06-05', 'Civil Engineering', 2, 'janaka.wickramasinghe@university.lk', 30),
    ('Damith', 'Kumara', '2000-11-11', 'Mechanical Engineering', 3, 'damith.kumara@university.lk', 31),
    ('Lavanya', 'Rajapaksha', '2001-04-02', 'Electrical Engineering', 2, 'lavanya.rajapaksha@university.lk', 32),
    ('Rajith', 'Perera', '2000-07-09', 'Computer Science', 3, 'rajith.perera@university.lk', 33),
    ('Dinesh', 'Seneviratne', '2001-10-16', 'Civil Engineering', 2, 'dinesh.seneviratne@university.lk', 34),
    ('Madhavi', 'Liyanage', '2000-05-20', 'Biotechnology', 3, 'madhavi.liyanage@university.lk', 35),
    ('Pavithra', 'Bandara', '2001-08-03', 'Law', 2, 'pavithra.bandara@university.lk', 36),
    ('Dinithi', 'Mendis', '2000-02-21', 'Architecture', 3, 'dinithi.mendis@university.lk', 37),
    ('Tania', 'Wickramasinghe', '2000-06-06', 'Mechanical Engineering', 3, 'tania.wickramasinghe@university.lk', 38),
    ('Sahan', 'Rajapaksha', '1999-10-27', 'Electrical Engineering', 4, 'sahan.rajapaksha@university.lk', 39),
    ('Chamod', 'Perera', '2001-05-05', 'Computer Science', 2, 'chamod.perera@university.lk', 40),
    ('Kasuni', 'Rathnayake', '2000-12-12', 'Civil Engineering', 3, 'kasuni.rathnayake@university.lk', 41),
    ('Dulani', 'Gunarathna', '2001-07-19', 'Biotechnology', 2, 'dulani.gunarathna@university.lk', 42),
    ('Samadhi', 'Rajapaksha', '1999-03-23', 'Mechanical Engineering', 4, 'samadhi.rajapaksha@university.lk', 43),
    ('Pasan', 'Silva', '2001-09-17', 'Electrical Engineering', 2, 'pasan.silva@university.lk', 44),
    ('Ariya', 'Wickramasinghe', '2000-04-05', 'Architecture', 3, 'ariya.wickramasinghe@university.lk', 45),
    ('Kasuni', 'Mendis', '2001-11-20', 'Biotechnology', 2, 'kasuni.mendis@university.lk', 46),
    ('Sanjeewa', 'Perera', '2000-07-10', 'Law', 3, 'sanjeewa.perera@university.lk', 47),
    ('Chathura', 'Gunawardena', '2001-12-15', 'Civil Engineering', 2, 'chathura.gunawardena@university.lk', 48),
    ('Lihini', 'Fernando', '2000-09-03', 'Mechanical Engineering', 3, 'lihini.fernando@university.lk', 49),
    ('Anuradha', 'De Silva', '2001-01-02', 'Electrical Engineering', 2, 'anuradha.desilva@university.lk', 50);


// Insert Courses
INSERT INTO Courses (title, department, credit_hours, max_enrollment, prerequisites)
VALUES 
    ('Database Systems', 'Computer Science', 3, 60, 'None'),
    ('Algorithms and Data Structures', 'Computer Science', 3, 60, 'Database Systems'),
    ('Signal Processing', 'Electrical Engineering', 3, 50, 'None'),
    ('Fluid Mechanics', 'Mechanical Engineering', 4, 50, 'None'),
    ('Structural Analysis', 'Civil Engineering', 3, 40, 'None'),
    ('Bioprocess Engineering', 'Biotechnology', 3, 30, 'None'),
    ('Constitutional Law', 'Law', 4, 100, 'None'),
    ('Architectural Design I', 'Architecture', 3, 40, 'None');


// Insert Enrollments
INSERT INTO Enrollments (student_id, course_id, status, semester)
VALUES 
    (1, 1, 'enrolled', 'Spring 2025'),   
    (1, 2, 'enrolled', 'Spring 2025'),  
    (2, 3, 'enrolled', 'Spring 2025'),   
    (3, 4, 'enrolled', 'Spring 2025'),   
    (4, 5, 'enrolled', 'Spring 2025'),   
    (5, 6, 'enrolled', 'Spring 2025'),  
    (6, 7, 'enrolled', 'Spring 2025'),  
    (7, 8, 'enrolled', 'Spring 2025');   

