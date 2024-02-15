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
create procedure procedureName (optional parameter)
 begin
   
   
   end newDelemitter
*/

Delimiter ££
create procedure allEmployee()
   begin
    select * from employee;
   
   end ££   
   call allEmployee();
   
   -- will have a parameter for first name
   delimiter $$
   create procedure employee(IN firstName Varchar(20))
    begin
      select * from employee where fname=firstName;
	end $$
   
call employee('James');