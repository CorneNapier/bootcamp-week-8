-- select all information from the employee table and sort them by thier firstName? 
SELECT * FROM employee ORDER BY fname;

-- select all employees who's name start with A and ends with a? 
SELECT * FROM employee WHERE fname LIKE 'A%' AND fname LIKE '%a';

-- select all employees who's name contain oh?
SELECT * FROM employee WHERE fname LIKE '%oh%';

-- select all maximum, minimum, and average salary for all female and male employees seperately? 
SELECT
    sex,
    MAX(salary) AS max_salary,
    MIN(salary) AS min_salary,
    AVG(salary) AS avg_salary
FROM
    employee
    where sex is not null
GROUP BY
    sex;
    
-- select all different salaries? 
SELECT DISTINCT salary FROM employee where salary is not null;

-- select female employee who is receiving highest salary? 
SELECT *
FROM employee
WHERE sex= 'f'
AND salary = (
    SELECT MAX(salary)
    FROM employee
    WHERE sex = 'f'
);

-- display full name and salary of all employees and sort them by thier first and then last name from A to Z? 
SELECT CONCAT(fName, ' ', lName) AS fullName, salary
FROM employee where salary is not null
ORDER BY fName ASC, lName ASC;

-- display all employees who's first Name start with J and should be at least 5 characters in lenght?
SELECT *
FROM employee
WHERE fName LIKE 'J%'
AND LENGTH(fName) >= 5;

-- display all employees fname, lname and salary with 10% increase
SELECT fName, lName, salary * 1.1 AS increased_salary
FROM employee where salary is not null;

-- UNION is used to combine the result-set of two or more SELECT queries
-- e.g generate yearly report
-- e.g quarterly report
-- UNION doesnt show duplicated data
-- UNION ALL will have duplicated data
select id, name from employee
union
select id, name from manager;

select id, name from employee
union All
select id, name from manager;
-- when using union, the number of columns in the select queries should be the same
-- make sure columns are in the correct order when selecting

-- JOIN in mySQL
-- inner join will only selects data which is available(common) in both tables
-- left join will  select all the data which is available in the left table and the common data in the right table
-- right join will select all the data which is available in the right table and the common data in the left table

use company1;
-- display all employees and their department name
select concat(fname, ' ', lname) as 'Full Name', Dname as 'Department' from employee inner join department on DNO=dnumber;
-- display all departments and their location
select dname as 'Department', dlocation as 'Location' from department d inner join dept_locations dl on d.dnumber=dl.DNUMBER;

create table Employee 
(
  EmpNo int primary key,
  EmpName varchar(30) not null,
  DepNo int
);

create table Department
(
   DepNo int primary key,
   Dname varchar(30) not null,
   Location varchar(50) not null
);

insert into employee (EmpNo, EmpName, DepNo) values
(1001, 'Sahil', 101),
(1004, 'Kavish', 102),
(1006, 'Aditya', 103),
(1005, 'Atul', 104);

insert into department (DepNo, Dname, Location) values
(101, 'HR', 'Delhi'),
(102, 'Sales', 'Bangalore'),
(103, 'Marketing Executive', 'Hyderabad'),
(104, 'Technical Engineer', 'Chennai');

alter table employee add foreign key(DepNo) references Department(DepNo);

-- display employees and their department name
select empname as 'Employee Name', dname as 'Department' from employee inner join department on employee.depno=department.depno;

-- left join
select empname, dname FROM employee left join department on department.depno=employee.depno;

-- right join
select empname, dname FROM employee right join department on department.depno=employee.depno;

create database course;
use course;

create table Instructor
(
  InstructorId int primary key,
  InstructorName varchar(50) not null
);

Create table Trainer
( 
   trainerId int primary key,
   trainerName varchar(30),
   trainerAge int
);

insert into instructor (InstructorId, InstructorName) values
(2, 'Mark'),
(1, 'Abdul'),
(3, 'Matt'),
(4, 'Sandra');

insert into trainer (trainerId, trainerName, trainerAge) values
(1, 'Abdul', 32),
(2, 'Zak', 26),
(3, 'Waqas', 36);

select * from trainer inner join instructor on instructorName = trainername;
select * from trainer left join instructor on instructorName = trainername;
select * from trainer right join instructor on instructorName = trainername;



