-- Assignment
/* The purpose of this database is to model data for a breakdown company.  Members must be registered with the company and each member can have multiple vehicles.*/

-- Task 1
create database breakdownCompany;
use breakdownCompany;

create table Member
(
  MemberID varchar(10) primary key,
  MemberFName varchar(20),
  MemberLName varchar(20),
  MemberLoc varchar(20)
);

create table Vehicle
(
  VehicleReg varchar(10) primary key,
  VehicleMake varchar(10),
  VehicleModel varchar(10),
  MemberID varchar(10)
);

create table Engineer
(
  EngineerID int primary key,
  EngineerFName varchar(20),
  EngineerLName varchar(20)
);

create table Breakdown
(
  BreakdownID int primary key,
  VehicleReg varchar(10),
  EngineerID int,
  BreakdownDATE date,
  BreakdownTIME time,
  BreakdownLoc varchar(50)
);

alter table Breakdown add foreign key(VehicleReg) references Vehicle(VehicleReg);
alter table Breakdown add foreign key(EngineerID) references Engineer(EngineerID);
alter table vehicle add foreign key(MemberID) references Member(MemberID);

-- Task 2
insert into Member values
('A301YT569A','Sarah','Smith','Manchester'),
('B365PT980D','Peter','Parker','Liverpool'),
('C398CZ320B','Sally','Sue','Portsmouth'),
('D271QR007C','Dave','Dominic','Southampton'),
('E665OI232E','James','Johnson','London');

insert into Vehicle values
('MS08RBC','BMW','M140i','E665OI232E'),
('WP66XJF','Mercedes','AMG C63','E665OI232E'),
('VB34PUG','Nissan','Silvia S15','E665OI232E'),
('BC06EJE','Toyota','Supra MK4','D271QR007C'),
('GF28BCL','Ford','Fiesta ST','C398CZ320B'),
('VU06IHG','Vauxhall','Astra VXR','A301YT569A'),
('WA08TEN','Honda','Civic','B365PT980D'),
('LK62LTK','Volkswagen','Golf R34','D271QR007C');

insert into Engineer values
(01, 'Carl', 'Constantine'),
(02, 'Bob', 'Builder'),
(03, 'Sue', 'Stewart');

insert into Breakdown values
(1001, 'MS08RBC', 02, '2023-01-05', '13:15:12', 'London'),
(1002, 'BC06EJE', 01, '2023-01-05', '15:20:16', 'Manchester'),
(1003, 'GF28BCL', 01, '2023-01-20', '10:30:14', 'Portsmouth'),
(1004, 'VU06IHG', 03, '2023-03-15', '11:10:05', 'Southampton'),
(1005, 'LK62LTK', 01, '2023-04-20', '17:20:10', 'Liverpool'),
(1006, 'WP66XJF', 02, '2023-06-25', '19:45:15', 'Newcastle'),
(1007, 'BC06EJE', 03, '2023-08-30', '20:24:27', 'London'),
(1008, 'WA08TEN', 02, '2023-09-05', '21:50:36', 'Southampton'),
(1009, 'GF28BCL', 03, '2023-11-12', '14:00:50', 'Liverpool'),
(1010, 'MS08RBC', 02, '2023-12-14', '17:30:33', 'Manchester'),
(1011, 'VU06IHG', 01, '2024-01-26', '18:35:59', 'Newcastle'),
(1012, 'GF28BCL', 03, '2024-02-22', '19:49:09', 'Portsmouth');

-- task 3

-- The names of members who live in a location
select * from member where MemberLoc='London';

-- All cars registered with the company e.g. all nissan cars
select * from vehicle where vehiclemake = 'Ford';

-- number of engineers that work for the company
select count(*) from engineer;

-- number of members registered
select count(*) from member;

-- all the breakdowns after a particular date
SELECT *
FROM breakdown
WHERE breakdowndate > '2023-04-01';

-- all the breakdowns beteen 2 dates
SELECT *
FROM breakdown
WHERE breakdowndate between '2023-03-01' and '2023-11-05';

-- The number of times a particular vehicle has broken down
select vehicleReg, count(*) as 'Num of Breakdowns'
from breakdown
where vehicleReg = 'GF28BCL';

-- The number of vehicles broken down more than once
select vehicleReg, count(*) as 'Num of Breakdowns'
from breakdown
group by vehicleReg
Having count(*) > 1;

-- task 4
-- All the vehicles a member owns. For example, Matt
select vehicleMake from vehicle where memberID = 'E665OI232E';

-- The number of vehicles each member has – sort the data based on the number of car from highest to lowest.
SELECT M.MemberID, M.MemberFName, M.MemberLName, M.MemberLoc, COUNT(V.VehicleReg) AS num_vehicles
FROM Member M
LEFT JOIN Vehicle V ON M.MemberID = V.MemberID
GROUP BY M.MemberID, M.MemberFName, M.MemberLName, M.MemberLoc
ORDER BY num_vehicles DESC;

-- All vehicles that have broken down in a particular location along with member details.
SELECT V.*, M.*
FROM Vehicle V
INNER JOIN Breakdown B ON V.VehicleReg = B.VehicleReg
INNER JOIN Member M ON V.MemberID = M.MemberID
WHERE B.BreakdownLoc = 'London';

-- A list of all breakdown along with member and engineer details between two dates.
SELECT B.*, V.*, M.*, E.*
FROM Breakdown B
INNER JOIN Vehicle V ON B.VehicleReg = V.VehicleReg
INNER JOIN Member M ON V.MemberID = M.MemberID
INNER JOIN Engineer E ON B.EngineerID = E.EngineerID
WHERE B.BreakdownDATE BETWEEN '23-03-04' AND '2023-09-20';

-- A further 3 relational queries of your choice that are meaningful to the company.

-- total number of breakdowns for each location
SELECT BreakdownLoc, COUNT(*) AS total_breakdowns
FROM Breakdown
GROUP BY BreakdownLoc;

-- member with the most recent breakdown
SELECT M.*, V.*, B.*
FROM Breakdown B
INNER JOIN Vehicle V ON B.VehicleReg = V.VehicleReg
INNER JOIN Member M ON V.MemberID = M.MemberID
WHERE B.BreakdownDATE = (SELECT MAX(BreakdownDATE) FROM Breakdown);

-- total number of breakdowns for vehicle make
SELECT V.VehicleMake, COUNT(*) AS total_breakdowns
FROM Breakdown B
INNER JOIN Vehicle V ON B.VehicleReg = V.VehicleReg
GROUP BY V.VehicleMake;

-- Task 5
-- Using W3Schools or any other resource research the following functions – Avg, Max, Min, Sum.  Explain with examples how each one is used.

-- Avg
-- The AVG function calculates the average value of a numeric column.
SELECT AVG(num_cars_owned) AS average_cars_owned
FROM (
    SELECT COUNT(*) AS num_cars_owned
    FROM Vehicle
    GROUP BY MemberID
) AS car_counts;

-- Max
-- The MAX function returns the maximum value in a column.
SELECT MAX(num_breakdowns) AS max_breakdowns
FROM (
    SELECT V.VehicleMake, COUNT(*) AS num_breakdowns
    FROM Breakdown B
    INNER JOIN Vehicle V ON B.VehicleReg = V.VehicleReg
    GROUP BY V.VehicleMake
) AS breakdown_counts;

/* Min
The MIN function returns the minimum value in a column.*/
SELECT MIN(num_breakdowns) AS min_breakdowns
FROM (
    SELECT V.VehicleMake, COUNT(*) AS num_breakdowns
    FROM Breakdown B
    INNER JOIN Vehicle V ON B.VehicleReg = V.VehicleReg
    GROUP BY V.VehicleMake
) AS breakdown_counts;

/* Sum
The SUM function calculates the total sum of values in a column.*/
SELECT SUM(1) AS total_breakdowns
FROM Breakdown;


/* Task 6
If a member has more than one vehicle, then display multi-car policy
Create a stored procedure which will display number of cars for any member whose first name and last name you are passing as argument while calling the stored procedure!*/
