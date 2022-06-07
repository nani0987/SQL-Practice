
/* Easy Queries */

Select * From employeeinfo;

-- Employee first name in upper case with alias name
Select Upper(EmpFname) As EmpName From employeeinfo;

-- Query to fetch number of employees working in HR dept
Select Count(ï»¿EmpID) From employeeinfo
Where Department = 'HR';

-- Query to get current date
SELECT Curdate();

-- Query to retrieve first four character of employee name
Select Substring(EmpFname, 1, 4) From employeeinfo;

-- Query to copy structure from one table to new table
Create Table NewTable As Select * From employeeinfo;

-- Salary between 50000 to 100000
Select * From employeeposition Where Salary Between 50000 And 100000;

-- Employee name start with 'S'
Select * From employeeinfo
Where EmpFname Like '%S%';

-- Query to fetch top N resords
Select * From employeeposition
Order By Salary Desc;

-- Employee first name and last name as a full name
Select Concat(EmpFname,' ',EmpLname)As full_name From employeeinfo;

-- DOB between 02/05/1970 to 31/12/1975 and are grouped according to gender
Select Count(*), Gender From employeeinfo
Where DOB Between '1970-05-02' And '1975-12-31'
Group By Gender;

-- Order by emp last name in desc and department asc
Select * From employeeinfo
Order By EmpLname Desc, Department Asc;

-- Query to fetch employee last name ending with 'A' and contains 5 alphabets
Select * From employeeinfo
Where Length(EmpLname) = 5 And EmpLname Like '%____A%';

-- Excluding fields
Select * From employeeinfo
Where EmpFname Not In ('Sanjay','Sonia');

-- Adress as DELHI(DEL)
Select * From employeeinfo
Where Address = 'Delhi(DEL)';

/* Intermidiate*/

-- All employees who also hold the managerial position
Select i.*, p.EmpPosition From employeeinfo i
Join employeeposition p On i.ï»¿EmpID = p.ï»¿EmpID
Where p.EmpPosition = 'Manager';

-- Query to fetch the department-wise count of employees sorted by department’s count in ascending order
Select Department, Count(ï»¿EmpID) From employeeinfo
Group By Department
Order By ï»¿EmpID Asc;

-- Calculate the even and odd records from a table
Select * From employeeinfo
Where Mod(ï»¿EmpID, 2) = 0;

Select * From employeeinfo
Where Mod(ï»¿EmpID, 2) <> 0;

-- Query to retrieve employee details from EmployeeInfo table who have a date of joining in the EmployeePosition table
Select i.*, p.EmpPosition, Cast(p.DateOfJoining As Date) As JoiningDate From employeeinfo i
Join employeeposition p On i.ï»¿EmpID = p.ï»¿EmpID;

-- Query to retrieve two minimum and maximum salaries from the EmployeePosition table
-- Two minimum salary
Select Distinct(Salary) From employeeposition e1
Where 2 >= (Select Count(Distinct(Salary)) From employeeposition e2
Where e1.Salary >= e2.Salary) Order By e1.Salary;

-- Two maximum salary
Select Distinct(Salary) From employeeposition e1
Where 2 >= (Select Count(Distinct(Salary)) From employeeposition e2
Where e1.Salary <= e2.Salary) Order By e1.Salary;

-- Nth (4th) highest salary
Select Distinct(Salary) From employeeposition e1
Where 4-1 = (Select Count(Distinct(Salary)) From employeeposition e2
Where e2.salary > e1.salary);

-- Second highest salary
Select Max(Salary) From employeeposition
Where Salary < (Select Max(Salary) From employeeposition);

-- Find duplicate records
Select Count(*) From employeeinfo
Group By ï»¿EmpID
Having Count(*) > 1;

-- Query to retrieve the list of employees working in the same department
Select e1.ï»¿EmpID, e1.EmpFname, e1.Department From employeeinfo e1, employeeinfo e2
Where e1.Department = e2.Department
And e1.ï»¿EmpID != e2.ï»¿EmpID
Order By Department;

-- Query to retrieve the last 3 records from the EmployeeInfo table
Select * From (Select * From employeeinfo
Order By ï»¿EmpID Desc Limit 3)
temp Order By ï»¿EmpID Asc;

-- Query to find the third-highest salary from the EmpPosition table
Select e1.ï»¿EmpID, e1.EmpPosition, e1.Salary From employeeposition e1
Where 3-1 = (Select Count(Distinct(e2.Salary)) From employeeposition e2
Where e2.Salary > e1.Salary);

-- Query to display the first and the last record from the EmployeeInfo table

-- First record
Select * From employeeinfo
Where ï»¿EmpID = (Select Min(ï»¿EmpID) From employeeinfo);

-- Last record
Select * From employeeinfo
Where ï»¿EmpID = (Select Max(ï»¿EmpID) From employeeinfo);

-- Query to retrieve Departments who have less than 2 employees working in it
Select EmpFname, Department, Count(ï»¿EmpID) As Emp_no From employeeinfo
Group By Department
Having Emp_no < 2;

-- Query to retrieve EmpPostion along with total salaries paid for each of them
Select EmpPosition, Sum(Salary) From employeeposition
Group By EmpPosition;

-- Query to fetch 50% records from the EmployeeInfo table
Select * From employeeposition
Where ï»¿EmpID <=
(Select Count(ï»¿EmpID)/2 From employeeinfo);

-- Query to display total salary on each employee after adding 10% increment
Select i.ï»¿EmpID, i.EmpFname, p.EmpPosition, p.Salary, p.Salary + (p.Salary/10) As IncrementSalary
From employeeinfo i 
Join employeeposition p On i.ï»¿EmpID = p.ï»¿EmpID
Group By i.ï»¿EmpID
Order By i.ï»¿EmpID;