-- Refresher Task

-- Write a query that return the current logged-in user name -- 
select current_user();
-- Write a query which displays current month name -- 
select monthname(current_date());
-- Write a query which returns today name -- 
select dayname(current_date());
-- Write a query that returns the current date -- 
select current_date();
-- Write a query that returns current time -- 
select current_time();
-- Write a query that return the current year -- 
select year(current_date());
-- Write a query which returns current date and time -- 
select now();
-- Write a query that retruns employee FNAME in upper case --
select ucase(fname) as 'First Name' from employee;
-- -------------------------------------------------------------------------

-- on delete cascade
/* specify whether you want rows deleted in a child table when 
corresponding rows are deleted in the parent table.*/

-- on delete set null
/* if a record in the parent table (referenced table) is deleted 
then the corresponding entry or values in the child table (referencing table) will be set to NULL.*/

create database world;
use world;
create table country
(
 id int primary key,
 name varchar(20) not null
);

create table city
(
  cityId int primary key,
  cityName varchar(50) not null,
  countryId int
);
alter table city add foreign key(countryId) references country(id) on delete set null;

insert into country values 
(1, 'UK'),
(2, 'USA'),
(3, 'Germany');

insert into city values (1, 'London', 1), (2, 'Manchester', 1), (3, 'New York', 2), (4, 'Berlin', 3);

delete from country where name='uk';
select* from city;
select * from country;

use company2;

select * from department;
select * from employee;

delete from department where dname='Sales';

-- Rollback is used when you have accidently deleted data
rollback;
-- requires set autocommit=0;
set AUTOCOMMIT=0;
commit;
-- You can also Restore from backup
-- You can not rollback the data deleted with truncate
-- ----------------------------------------------------------------------
-- Case Expression
/* Used within queries to return a value based on specific conditions
within queries to return a value based on specific conditions.
The result of case expression will be a column(similar to if-else statements)*/
use company1;

-- Increase Salary
select fname, lname, salary,
case
  when Salary=25000 then salary + 2500
  else 'Not eligible for bonus'
  end as 'New Salary'
  from employee;
  
  -- Display full word for gender
  select fname, lname,
  case
    when sex='f' then 'Female'
    when sex='m' then 'Male'
    else 'Other'
    end as 'Gender'
    from employee;
    
-- Task
/*
Write a case expression that returns employee's full name salary with bonus as below:
	if salary is 1000 - 19000 increase 1000 
	if salary is 20000 - 29000 increase 2000
	if salary is 30000 - 39000 increase 3000
	if salary is 40000 - 49000 increase 4000
	if salary is 50000 - 59000 increase 5000
	if a person receive no salary then should display 'Not eligible for bonus'
*/
select concat(fname, ' ', lname) as 'Full Name', Salary,
    CASE
        WHEN salary BETWEEN 1000 AND 19000 THEN salary + 1000
        WHEN salary BETWEEN 20000 AND 29000 THEN salary + 2000
        WHEN salary BETWEEN 30000 AND 39000 THEN salary + 3000
        WHEN salary BETWEEN 40000 AND 49000 THEN salary + 4000
        WHEN salary BETWEEN 50000 AND 59000 THEN salary + 5000
        else 'Not eligible for bonus'
    END AS 'New Salary'
FROM 
    employee;

/*
I would like you to increase the salary of employees based on their departments
    for example, if an employee is working in the Research department increase it's salary
    by 5000 and for other departments as well any amount you want.
    research, admin, headquarters
*/

select concat(fname, ' ', lname) as 'Full Name', Salary,
    CASE
        WHEN dno = 1 THEN salary + 1000
        WHEN dno = 5  THEN salary + 5000
        WHEN dno = 4 THEN salary + 2000
        else 'Not eligible for bonus'
    END AS 'New Salary'
FROM 
    employee;
    
-- by department name
select concat(fname, ' ', lname) as 'Full Name', dname as 'Department', Salary, 
    CASE
        WHEN dname = 'Headquarters' THEN salary + 1000
        WHEN dname = 'Research'  THEN salary + 5000
        WHEN dname = 'Administration' THEN salary + 2000
        else 'Not eligible for bonus'
    END AS 'New Salary'
FROM 
    employee left join department on dno=dnumber;
