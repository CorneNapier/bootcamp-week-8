-- Stored Procedure
/* Pre-compiled mysql statement stored into the database similar like table stored in the database.
A stored procedure is a precomplied and stored database object that consists of one or more SQL statements.
Stored procedures can be called and executed from application code or directly from the database management system*/

-- Advantages
/* Code reusability, enhanced security, reduce network traffic*/

-- Disadvantages
/* resource usage*/

/* change delemiter
delimiter is the end of code statment think (;)
unless command line is closed you will need to change the delimiter back to (;), whereas in workbench it will revert back by itself
create procedure procedureName (optional parameter)
 begin
   
   
   end newDelemiter
*/

Delimiter ££
create procedure allEmployee()
   begin
    select * from employee;
   
   end ££   
   call allEmployee();
   
   -- will have a parameter for first name (IN, OUT, INOUT)
   delimiter $$
   create procedure employee(IN firstName Varchar(20))
    begin
      select * from employee where fname=firstName;
	end $$
   
call employee('James');

-- create a procedure which will delete an employee whos name you are passing as arg
    -- show the table after changes
use uniondb;
delimiter $$
create procedure deleteEmployee (IN firstname varchar(20))
 begin
    delete from employee where name=firstname;
    select * from employee;
 end $$
 
 call deleteEmployee('Adam');

-- create a procedure which will display employee record whose first name and last name you are passing as args
use company1;
delimiter $$
create procedure displayFullName (IN firstName varchar(20), IN lastName varchar(20))
  begin
    select * from employee where fname=firstName and lname=lastName;
  end $$
  
  select * from employee;
call displayFullName('Ahmad', 'Jabbar');


