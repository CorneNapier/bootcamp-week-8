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