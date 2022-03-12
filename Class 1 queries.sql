-- creating a database
CREATE DATABASE db_students;

-- deleting a database
DROP DATABASE db_students;

-- before working on a database, you need to select it
USE db_students;

-- creating a table
CREATE TABLE students(
id INT AUTO_INCREMENT,
student_id VARCHAR(15) NOT NULL,
student_name VARCHAR(50) NOT NULL,
student_dob DATE NOT NULL,
student_dept VARCHAR(15) NOT NULL,
student_course VARCHAR(200) NOT NULL,
PRIMARY KEY(id)
);

-- showing the table
SELECT * FROM students;

-- deleting the table
DROP TABLE students;

-- renaming a table
ALTER TABLE students RENAME TO student_info;

-- adding a column into the table
ALTER TABLE students ADD COLUMN test VARCHAR(15);

-- deleting a column from the table
ALTER TABLE students DROP COLUMN test;

-- modifying a column name from the table
ALTER TABLE students CHANGE COLUMN test INT;

-- modifying a column data type
ALTER TABLE students MODIFY COLUMN testing VARCHAR(5);

-- inserting data/record into a table
INSERT INTO students(student_id, student_name, student_dob, student_dept, student_course) VALUES
('SWE001-145','Abdur Rahim','1995-09-02','SWE','Computer Fundamental, Physics, English'),
('SWE001-146', 'Abdul Karim','1993-08-18','SWE','Computer Fundamental, Physics, English'),
('CSE005-001','Sazid Noor','1991-06-12','CSE','Computer Fundamental, Basic Networking, English'),
('CSE005-002','Abul Mia','1994-04-05','CSE','Computer Fundamental, Basic Networking, English'),
('CSE005-003','Tamim Sayed','1993-07-22','CSE','Computer Fundamental, Basic Networking, English'),
('EEE007-033','Baten Sarker','1994-01-20','EEE','Troubleshooting, Physics, English'),
('EEE007-034','Ebne Arabi','1995-11-19','EEE','Troubleshooting, Physics, English'),
('EEE007-035','Abu Sayem','1992-12-15','EEE','Troubleshooting, Physics, English')
;

-- showing limited numbers of data/record
SELECT * FROM students LIMIT 5;

-- deleting a data/record from a table
DELETE FROM students WHERE id = 51;

-- deleting all data/record from a table
TRUNCATE TABLE students;

-- defining a defferent value for auto increment
ALTER TABLE students AUTO_INCREMENT = 50;

INSERT INTO students(student_id, student_name, student_dob, student_dept, student_course) VALUES
('ETE009-025','Saad Abdullah','1990-12-29','ETE','Computer Fundamental, Physics, Basic Networking, English'),
('ETE009-026','Mahfuz Alam','1991-10-27','ETE','Computer Fundamental, Physics, Basic Networking, English'),
('ETE009-027','Misuk Nayem','1992-03-11','ETE','Computer Fundamental, Physics, Basic Networking, English'),
('ETE009-028','Dipto Ahsan','1993-02-09','ETE','Computer Fundamental, Physics, Basic Networking, English')
;

-- using WHERE clause for applying conditions
SELECT * FROM students WHERE student_dept = 'SWE';
SELECT * FROM students WHERE student_dept = 'CSE';
SELECT * FROM students WHERE student_dept = 'EEE';
SELECT * FROM students WHERE student_dept = 'ETE';

-- getting specific column data/record
SELECT student_id, student_name, student_dept FROM students WHERE student_dept = 'ETE';

-- using BETWEEN for getting data between two data/record
-- using and
SELECT * FROM students WHERE student_dob BETWEEN '1990-01-01' AND '1991-12-30'; 
SELECT * FROM students WHERE student_dept = 'CSE' AND student_dob BETWEEN '1990-01-01' AND '1991-12-30';

-- using AND & OR
SELECT * FROM students WHERE student_dept = 'EEE' AND student_dept = 'CSE';
SELECT * FROM students WHERE student_dept = 'EEE' OR student_dept='CSE';
SELECT * FROM students WHERE student_dept = 'BBA' AND student_dept = 'SWE';
SELECT * FROM students WHERE student_dept = 'BBA' OR student_dept = 'SWE';

-- using ORDER By for ordering data in ascending(ASC) or descending(DESC) order
SELECT * FROM students WHERE student_dob BETWEEN '1990-01-01' AND '2021-12-30' ORDER BY student_name;
SELECT * FROM students WHERE student_dob BETWEEN '1990-01-01' AND '2021-12-30' ORDER BY student_name ASC;
SELECT * FROM students WHERE student_dob BETWEEN '1990-01-01' AND '2021-12-30' ORDER BY student_name DESC;

-- SELECT * FROM students WHERE student_dob BETWEEN '1990-01-01' AND '1991-12-30' Group BY student_dept order by student_name asc; 

-- counting total number of students
SELECT COUNT(student_name) FROM students;

-- using GROUP By for goruping data into single group
SELECT student_dept, COUNT(student_name) FROM students GROUP BY student_dept;

-- removing duplicate values
SELECT DISTINCT student_dept FROM students;

-- counting distinct number of values
SELECT COUNT(DISTINCT student_dept) FROM students;
SELECT COUNT(DISTINCT student_dept) AS 'Total Department' FROM students;

-- finding department wise total student numbers
SELECT student_dept, COUNT(student_name) FROM students GROUP BY student_dept;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Like
--------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT * FROM students WHERE student_name LIKE '%m';
SELECT * FROM students WHERE student_name LIKE 'a%';
SELECT * FROM students WHERE student_name NOT LIKE 'a%';
SELECT * FROM students WHERE student_name LIKE '%a%';
SELECT * FROM students WHERE student_name LIKE '_a%';
SELECT * FROM students WHERE student_name LIKE '__m%';
SELECT * FROM students WHERE student_name LIKE '__a__%';

--------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Regexp (Regular Expression)
--------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT * FROM students WHERE student_name REGEXP 'alam';
SELECT * FROM students WHERE student_name REGEXP '^alam';
SELECT * FROM students WHERE student_name REGEXP 'alam$';
SELECT * FROM students WHERE student_name REGEXP 'alam|saad|sayed';
SELECT * FROM students WHERE student_name REGEXP '^.a';
SELECT * FROM students WHERE student_name REGEXP 'a.$';
SELECT * FROM students WHERE student_name REGEXP 'a[elb]';
SELECT * FROM students WHERE student_name REGEXP '[elb]a';
SELECT * FROM students WHERE student_name REGEXP 'a[a-z]';

--------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Difference between Like and Regexp
--------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Like
SELECT * FROM students WHERE 
student_name LIKE '__a%' OR 
student_name LIKE '__b%' OR 
student_name LIKE '__c%' OR 
student_name LIKE '__d%' OR 
student_name LIKE '__e%';

-- Regexp
SELECT * FROM students WHERE student_name REGEXP '^..[a-e]';

--------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Aggregate Functions
--------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Creating products table and incorporating with data to test aggregate function

CREATE DATABASE db_products;
USE db_products;

CREATE TABLE products(
product_id INT AUTO_INCREMENT,
product_name VARCHAR(30) NOT NULL,
product_quantity INT,
product_price INT NOT NULL,
PRIMARY KEY(product_id)
);

INSERT INTO products(product_name, product_quantity, product_price) VALUES
('Tomato', 30, 30),
('Cucumber', 15, 25),
('Potato', 30, 20),
('Radish', 10, 20),
('Carrot', 10, 25),
('Spinach', 15, 40),
('Cabbage', 25, 50),
('Brinjal', 18, 35)
;

SELECT * FROM products;

-- finding available product's total price
SELECT *, (product_price*product_quantity) AS 'Available Products Total Price' FROM products;

-- finding minimum price of a product
SELECT MIN(product_price) FROM products;

-- finding maximum price of a product
SELECT MAX(product_price) FROM products;

-- finding average price of a product
SELECT AVG(product_price) FROM products;

-- finding total price of a product
SELECT SUM(product_price*product_quantity) FROM products;

-- finding individual available product's price
SELECT product_name, (product_price*product_quantity) AS 'Available Product Price' FROM products WHERE product_name = 'spinach';

-- finding 2nd highest price of the product
SELECT MAX(product_price) FROM products WHERE product_price NOT IN (SELECT MAX(product_price) FROM products);
SELECT product_name FROM products WHERE product_price = (SELECT MAX(product_price) FROM products);
--------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CASE
--------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT  product_name, product_price,
CASE
	WHEN product_price<=20 THEN 'Product price is in peoples capability.'
	WHEN product_price>=30 THEN 'Product price is a bit high.'
	ELSE 'Product price is out of the peoples capability.'
END AS price_measurement FROM products;
