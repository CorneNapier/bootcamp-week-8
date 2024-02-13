use course;
select * from Instructor;
select * from trainer;
-- only match data will be retrive from both table
select * from instructor inner join trainer on instructorname = trainername;
-- CROSS JOIN, is used to join data from all records/row in multiple tables, repeats data.(rarely used)
-- inner join and cross join results are the same when we use a condition.
select * from instructor cross join trainer on instructorname = trainername;

-- SELF JOIN - when joining a table to itself
-- in self join we should temporary rename the table, SQL Alias
use company1;
select concat(e.fname, ' ', e.lname) as 'Employee',
    concat(m.fname, ' ', m.lname) as 'Manager' FROM employee e left join employee m
    on e.SUPERSSN = m.SSN;

-- String Methods

-- display full name of all employees in upper case
SELECT UPPER(CONCAT(fname, ' ', lname)) AS 'Full Name'
FROM employee;

select current_user(); -- who inserted the data, deleted, updated data

select substring('Database', 1, 4); -- used to extract text from a string

-- Date Methods
/* NOW()/CURRENT_TIMESTAMP()
CURDATE()/CURRENT_DATE()
CURTIME()/CURRENT_TIME()
MONTHNAME()
DAYNAME()
DAY()
YEAR() */

 -- shows current time and date stamp
 select now();
 select current_timestamp();

-- shows only current date stamp
select curdate();
select current_date();

-- shows only current time stamp
select curtime();
select current_time();

-- displays the name of month for a given date
select monthname('2024-05-03');

-- displays the day name for a given date
select dayname('2024-05-03');

-- displays the day for a given date
select day('2024-05-03');

-- displays the year for a given date
select year('2024-05-03');

-- displays monthname for the current date
select monthname(current_date());





