use master

CREATE DATABASE DotNet

use DotNet

CREATE TABLE login(
id int NOT NULL PRIMARY KEY,
name nchar(50) NOT NULL,
password nchar(50) NOT NULL
)

INSERT INTO login(id, name, password)
VALUES(1, 'Hassaan', 123),
(2, 'Usama', 321),
(3, 'Zia', 321),
(4, 'Asad', 321),
(5, 'Ahmad', 321)

SELECT * FROM login
Select id, name from dbo.login where id='1' and password='123'
SELECT count(*) AS 'totalUsers' FROM dbo.login
SELECT id, name from dbo.login
Select id, name from dbo.login where id='0'