CREATE DATABASE db_university;
USE db_university;

CREATE TABLE students(
student_id INT AUTO_INCREMENT,
student_name VARCHAR(50) NOT NULL,
student_dob DATE NOT NULL,
PRIMARY KEY(student_id)
);

SELECT * FROM students;

TRUNCATE TABLE students;

INSERT INTO students(student_name,student_dob) VALUES
('Abdur Rahim','1995-09-02'),
('Abdul Karim','1993-08-18'),
('Abul Mia','1994-04-05'),
('Sazid Noor','1991-06-12'),
('Tamim Sayed','1993-07-22'),
('Baten Sarker','1994-01-20'),
('Ebne Arabi','1995-11-19'),
('Abu Sayem','1992-12-15'),
('Saad Abdullah','1990-12-29'),
('Mahfuz Alam','1991-10-27'),
('Misuk Nayem','1992-03-11'),
('Dipto Ahsan','1993-02-09')
;

CREATE TABLE departments(
department_id INT AUTO_INCREMENT NOT NULL,
department_name VARCHAR(5),
PRIMARY KEY(department_id)
);

INSERT INTO departments(department_name) VALUES ('SWE'),('CSE'),('EEE'),('ETE');

CREATE TABLE department_students(
student_id INT,
department_id INT,
FOREIGN KEY(student_id) REFERENCES students(student_id),
FOREIGN KEY(department_id) REFERENCES departments(department_id)
);

INSERT INTO department_students VALUES
(1,1),
(2,1),
(3,2),
(4,2),
(5,2),
(6,3),
(7,3),
(8,3),
(9,4),
(10,4),
(11,4),
(12,4);

CREATE TABLE courses(
course_id INT AUTO_INCREMENT NOT NULL,
course_name VARCHAR(50),
PRIMARY KEY(course_id)
);

INSERT INTO courses(course_name) VALUES('Computer Fundamental'),('Physics'), ('English'),('Basic Networking'),('Troubleshooting');

CREATE TABLE student_courses(
student_id INT,
course_id INT,
FOREIGN KEY(student_id) REFERENCES students(student_id),
FOREIGN KEY(course_id) REFERENCES courses(course_id)
);

INSERT INTO student_courses VALUES
(1,1),(1,2),(1,3),
(2,1),(2,2),(2,3),
(3,1),(3,3),(3,4),
(4,1),(4,3),(4,4),
(5,1),(5,3),(5,4),
(6,2),(6,3),(6,5),
(7,2),(7,3),(7,5),
(8,2),(8,3),(8,5),
(9,1),(9,2),(9,3),(9,4),
(10,1),(10,2),(10,3),(10,4),
(11,1),(11,2),(11,3),(11,4),
(12,1),(12,2),(12,3),(12,4);

SELECT s.`student_id`,s.`student_name`,c.`course_name` FROM students s JOIN student_courses sc ON s.`student_id`=sc.`student_id`
JOIN courses c ON sc.`course_id`=c.`course_id` ORDER BY s.`student_id`;


SELECT * FROM courses;

SELECT * FROM student_courses;