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
