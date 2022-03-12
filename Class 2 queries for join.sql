CREATE DATABASE db_university_join;

USE db_university_join;

CREATE TABLE students(
id INT AUTO_INCREMENT,
student_id VARCHAR(15),
studentselect /_name VARCHAR(50),
student_dob DATEstudebt,
course_id VARCHAR(15),
PRIMARY KEY(id),
FOREIGN KEY(course_id) REFERENCES courses(course_id)
);

INSERT INTO students(student_id, student_name, student_dob, course_id) VALUES
('SWE001-145','Abdur Rahim','1995-09-02', '101'),
('SWE001-145','Abdur Rahim','1995-09-02', '102'),
('SWE001-145','Abdur Rahim','1995-09-02', '103'),
('CSE005-001','Sazid Noor','1991-06-12', '101'),
('CSE005-001','Sazid Noor','1991-06-12', '103'),
('CSE005-001','Sazid Noor','1991-06-12', '104'),
('ETE009-027','Misuk Nayem','1992-03-11','101'),
('ETE009-027','Misuk Nayem','1992-03-11','102'),
('ETE009-027','Misuk Nayem','1992-03-11','103'),
('ETE009-027','Misuk Nayem','1992-03-11','104');

CREATE TABLE teachers(
teacher_id VARCHAR(15),
teacher_name VARCHAR(50),
PRIMARY KEY(teacher_id)
);

INSERT INTO teachers VALUES
('CSE-1035','Abdul Wadud Sarker'),
('SWE-1198','Golam Rabbaney'),
('EEE-1245','Yousuf Ali'),
('ETE-1339','Sayef Mortoza'),
('CSE-1076','Muaz Ibne Jabal');

CREATE TABLE courses(
course_id VARCHAR(15),
course_name VARCHAR(50),
course_teacher VARCHAR(15),
PRIMARY KEY(course_id),
FOREIGN KEY(course_teacher) REFERENCES teachers(teacher_id)
);

INSERT INTO courses VALUES
('101','Computer Fundamental','CSE-1035'),
('102','Physics','EEE-1245'),
('103','English','CSE-1076'),
('104','Basic Networking','ETE-1339'),
('105','Troubleshooting','SWE-1198');

SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM teachers;

-- Join/Inner Join
SELECT * FROM courses c JOIN teachers t ON c.`course_teacher`=t.`teacher_id`;

-- Join/Inner Join
SELECT * FROM students s JOIN courses c ON c.`course_id`=s.`course_id`;

-- Join/Inner Join on Specific columns
SELECT c.`course_id`,c.`course_name`,t.`teacher_name` FROM courses c INNER JOIN teachers t ON c.`course_teacher`=t.`teacher_id`;

-- Left Join
SELECT * FROM students s LEFT JOIN courses c ON s.`course_id` = c.`course_id`;

-- Right Join
SELECT * FROM students s RIGHT JOIN courses c ON s.`course_id` = c.`course_id`;

-- Joining Students, Courses and Teachers table
SELECT id, student_id, student_name,course_name,teacher_name FROM students s JOIN courses c ON s.`course_id`=c.`course_id`
JOIN teachers t ON c.`course_teacher`=t.`teacher_id`
ORDER BY s.`id`;

-- Union
SELECT * FROM students s LEFT JOIN courses c ON s.`course_id` = c.`course_id`
UNION
SELECT * FROM students s RIGHT JOIN courses c ON s.`course_id` = c.`course_id`;

-- Union all
SELECT * FROM students s LEFT JOIN courses c ON s.`course_id` = c.`course_id`
UNION ALL
SELECT * FROM students s RIGHT JOIN courses c ON s.`course_id` = c.`course_id`;

-- Union/Union All will only work if both the table have same column
SELECT * FROM students
UNION ALL
SELECT * FROM courses;
