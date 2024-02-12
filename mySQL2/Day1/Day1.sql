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
