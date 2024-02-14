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