--- ########################################  Database  ######################################## ---
use master
create database ArtGallery
use ArtGallery

--- ########################################  Tables  ######################################## ---
create table Users(
Id int not null primary key,
Name varchar(50) not null,
Role varchar(50) not null,
Points int not null,
Status varchar(50) not null
)
insert into Users(Id, Name, Role, Points, Status)
values(1, 'Hassaan', 'Admin', 50, 'Active'),
(2, 'Zia', 'Visitor', 5, 'Active'),
(3, 'Qasim', 'Artist', 30, 'Active'),
(4, 'Mahnoor', 'Customer', 15, 'Active'),
(5, 'Zain', 'Customer', 0, 'Deactivated'),
(6, 'Ahmad', 'Artist', 20, 'Active'),
(7, 'Alina', 'Artist', 25, 'Active')

create table Artworks(
Id int not null primary key,
Title varchar(50) not null,
Artist int not null foreign key references Users(Id),
Quantity int not null,
Price int not null
)
insert into Artworks(Id, Title, Artist, Quantity, Price)
values(1, 'Abstraction Odyssey', 3, 5, 900),
(2, 'Fluid Euphoria', 7, 7, 700),
(3, 'Beyond Boundaries', 3, 10, 1500),
(4, 'Art of Abandon', 6, 3, 1000),
(5, 'Unveiled Intuition', 7, 4, 5000)

create table Log(
Id int not null primary key,
Name int not null foreign key references Users(Id),
Role int not null foreign key references Users(Id),
Act varchar(100) not null,
Time varchar(50) not null
)
insert into Log(Id, Name, Role, Act, Time)
values(1, 1, 1, 'Updated Settings', '30 mins ago'),
(2, 3, 3, 'Uploaded a new Art', '1 hour ago'),
(3, 4, 4, 'Ordered a new item', '5 hours ago'),
(4, 5, 5, 'Ordered a new item', '23 hours ago'),
(5, 7, 7, 'Sent a new message', '2 days ago')

--- ########################################  Queries  ######################################## ---
SELECT count(*) AS 'Total Users' FROM dbo.Users
Select * from dbo.Users where Id=1
SELECT count(*) AS 'Total Artworks' FROM dbo.Artworks
SELECT a.Id, a.Title, u.Name AS 'Artist', a.Quantity, a.Price FROM dbo.Artworks a INNER JOIN dbo.Users u ON a.Artist = u.Id WHERE u.Role = 'Artist' AND a.Id = 1
SELECT count(*) AS 'Total Logs' FROM dbo.Log
SELECT l.Id, u.Name, u.Role, l.Act, l.Time FROM dbo.Log l INNER JOIN dbo.Users u ON l.Name = u.Id WHERE l.Id = 1