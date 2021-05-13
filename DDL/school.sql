SHOW DATABASES;
CREATE DATABASE school;
USE school;

CREATE TABLE students(
    student_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(60) NOT NULL,
    last_name VARCHAR(60) NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY(student_id)
);

CREATE TABLE classes(
   class_id INT NOT NULL AUTO_INCREMENT,
   subject VARCHAR(100) NOT NULL,
   description VARCHAR(500) NOT NULL,
   level INT NOT NULL,
   PRIMARY KEY (class_id)
);

CREATE TABLE enrollment(
    enrollment_id INT NOT NULL AUTO_INCREMENT,
    fk_student_id INT NOT NULL,
    fk_class_id INT NOT NULL,
    PRIMARY KEY(enrollment_id),
    FOREIGN KEY(fk_student_id) REFERENCES students(student_id),
    FOREIGN KEY(fk_class_id) REFERENCES classes(class_id)
);

INSERT INTO students(first_name, last_name, age)
VALUES ("Alice", "Clark", 24), ("Joey", "Cearc", 23), ("Sam", "Demarco", 21), ("Kelsey", "Kiplar", 20);

SELECT * FROM students;

INSERT INTO classes(subject, description, level)
VALUES("Alegbra", "Learning key concepts to math equations", 2), 
("History of Western America", "History leaders, and their contributions to the nation", 3), 
("Introduction to the Internet", "Learning the basics on how to use the internet", 1);

SELECT * FROM classes;

INSERT INTO enrollment(fk_student_id, fk_class_id)
VALUES(1, 2), (1, 1), (2, 1), (2, 3), (3, 3), (3, 1), (4, 2), (4, 1);

SELECT s.first_name, s.last_name, c.subject FROM students s 
JOIN enrollment e ON e.fk_student_id = s.student_id 
JOIN classes c ON c.class_id = e.fk_class_id 
ORDER BY s.last_name;