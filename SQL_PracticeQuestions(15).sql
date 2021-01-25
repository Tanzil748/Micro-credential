/*
CREATE TABLE Addresses(
	AddressesID int  NOT NULL,
	EmployeeID int NULL,
	AddressLine1 varchar(60) NOT NULL,
	AddressLine2 varchar(60) NULL,
	City varchar(50) NOT NULL,
	State char(2) NOT NULL,
	Zip1 char(5) NOT NULL,
	Zip2 char(4) NULL,
    ModifiedDate date NULL,
 CONSTRAINT PK_ADDRESSES PRIMARY KEY 
(AddressesID ))

CREATE TABLE Departments(
	DepartmentID smallint NOT NULL,
	DepartmentName varchar(50) NOT NULL,
	GroupName varchar(50) NOT NULL,
	ModifiedDate date NULL,
 CONSTRAINT PK_Departments PRIMARY KEY (DepartmentID))

CREATE TABLE EmployeesDepartments(
	EmployeeID int NOT NULL,
	DepartmentID smallint NOT NULL,
	StartDate date NOT NULL,
	EndDate date NULL,
	ModifiedDate date NULL,
 CONSTRAINT PK_EmployeesDepartments PRIMARY KEY 
(
	EmployeeID ,
	DepartmentID 
))
*/

--1.Create a list of employee names and their full addresses using the INNER JOIN.
select E.firstname, E.lastname, AD.addressline1
from employees E
inner join addresses AD on E.employeeid = AD.employeeid

--2. Create a list of employee names and their full addresses using the INNER JOIN for employees who live either in Massachusetts or California.
select E.firstname, E.lastname, AD.addressline1, AD.city, AD.state, AD.zip1
from employees E
inner join addresses AD on E.employeeid = AD.employeeid
where state = 'MA' or state = 'CA'

--3.	Create an example of a Cartesian product using the Employees and Addresses table.
select * from employees 
cross join addresses

--4.	Use a LEFT OUTER JOIN to list all employee first and last names as well as the gender and birthdates of their dependents if they have any.
select E.firstname, E.lastname, D.firstname, D.lastname, D.birthdate, D.gender
from employees E
left outer join dependents D on E.employeeid = D.employeeid

--5.	Use a RIGHT OUTER JOIN to list all employee first and last names as well as the gender and birthdates of their dependents if they have any (Same as above but change location of tables).
select E.firstname, E.lastname, D.firstname, D.lastname, D.birthdate, D.gender
from dependents D
right outer join employees E on E.employeeid = D.employeeid

--6.	Use a SELF JOIN to select the employee first name, last name, title as well as the manager's first name, last name and title.
select E.employeeid, E.firstname, E.lastname, E.title, M.firstname, E.managerid
from employees E
inner join employees M on M.employeeid = E.managerid
order by E.employeeid

select E.employeeid, E.firstname, E.lastname, E.managerid
from employees E
/* (I was updating one of the values as one of employees in table didnt have a boss)
update employees
set managerid = '11'
where employeeid = '6'
*/

--7.	Retrieve the employee first name, last name, department name and group name for the employee named Gail Erickson.
select E.firstname, E.lastname, DEPT.departmentname, DEPT.groupname
from employees E
inner join employeesdepartments EDEPT on E.employeeid = EDEPT.employeeid
inner join departments DEPT on DEPT.departmentid = EDEPT.departmentid
where E.firstname = 'Gail' and E.lastname = 'Erickson'

--8.	Retrieve the employee first name, last name, address, city, state, zip, department name and group name for the employee named David Bradley.
select E.firstname, E.lastname, AD.addressline1, AD.city, AD.state, AD.zip1, DEPT.departmentname, DEPT.groupname
from employees E
inner join addresses AD on AD.employeeid = E.employeeid
inner join employeesdepartments EDEPT on E.employeeid = EDEPT.employeeid
inner join departments DEPT on DEPT.departmentid = EDEPT.departmentid
where E.firstname = 'David' and E.lastname = 'Bradley'

--9.	Retrieve the employee first name, last name, dependent first name, last name and gender for female dependents.
select E.firstname, E.lastname, D.firstname, D.lastname, D.gender
from employees E
inner join dependents D on E.employeeid = D.employeeid
where D.gender = 'F'

--10.	Retrieve the employee first name, last name, dependent first name, last name, birth date for dependents who have birth dates less than or equal to 11/02/2008. 
select E.firstname, E.lastname, D.firstname, D.lastname, D.birthdate
from employees E
inner join dependents D on E.employeeid = D.employeeid
where D.birthdate <= '11/02/2008'

--11.	Use LEFT OUTER JOINS to list all Employees, their Department Names, and their dependent names, if any.
select E.firstname, E.lastname, DEPT.departmentname, D.firstname, D.lastname
from employees E 
left outer join dependents D on E.employeeid = D.employeeid
left outer join employeesdepartments EDEPT on E.employeeid = EDEPT.employeeid
left outer join departments DEPT on DEPT.departmentid = EDEPT.departmentid

--12.	Use RIGHT OUTER JOINS to list all Employees, their Department Names, and their dependent names, like you did in the question above.
select E.firstname, E.lastname, DEPT.departmentname, D.firstname, D.lastname
from dependents D
right outer join employees E on E.employeeid = D.employeeid
right outer join employeesdepartments EDEPT on E.employeeid = EDEPT.employeeid
right outer join departments DEPT on DEPT.departmentid = EDEPT.departmentid

--13.	Retrieve the employee first name, last name, dependent first name, last name and gender for dependents who were born in or before 1998.
select E.firstname, E.lastname, D.firstname, D.lastname, D.gender, D.birthdate
from employees E
inner join dependents D on E.employeeid = D.employeeid
where D.birthdate <= '1998-01-01'

--14.	Retrieve all employees belonging to the department “Marketing” using INNER JOINS.
select E.firstname, E.lastname, DEPT.departmentname
from employees E
inner join employeesdepartments EDEPT on E.employeeid = EDEPT.employeeid
inner join departments DEPT on DEPT.departmentid = EDEPT.departmentid
where DEPT.departmentname = 'Marketing'

--15.	Retrieve the first name, last name, and title of the manager responsible for the Employee with the first name “Ben” and last name “Miller”.
select M.title, M.firstname, M.lastname, E.managerid
from employees E
inner join employees M on M.employeeid = E.managerid
where E.firstname = 'Ben' and E.lastname = 'Miller'
