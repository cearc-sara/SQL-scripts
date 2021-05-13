SHOW DATABASES;
CREATE DATABASE school;
USE school;

CREATE TABLE students(
    student_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(60) NOT NULL,
    last_name VARCHAR(60) NOT NULL,
    age INT NOT NULL
);

CREATE TABLE classes(
    
)