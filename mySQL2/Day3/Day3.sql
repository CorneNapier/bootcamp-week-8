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




