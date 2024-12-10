CREATE TABLE Departments (
 DepartmentID INT PRIMARY KEY,
 DepartmentName VARCHAR(100) NOT NULL UNIQUE,
 ManagerID INT NOT NULL,
 Location VARCHAR(100) NOT NULL
);
CREATE TABLE Employee (
 EmployeeID INT PRIMARY KEY,
 FirstName VARCHAR(100) NOT NULL,
 LastName VARCHAR(100) NOT NULL,
 DoB DATETIME NOT NULL,
 Gender VARCHAR(50) NOT NULL,
 HireDate DATETIME NOT NULL,
 DepartmentID INT NOT NULL,
 Salary DECIMAL(10, 2) NOT NULL,
 FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
-- Create Projects Table
CREATE TABLE Projects (
 ProjectID INT PRIMARY KEY,
 ProjectName VARCHAR(100) NOT NULL,
 StartDate DATETIME NOT NULL,
 EndDate DATETIME NOT NULL,
 DepartmentID INT NOT NULL,
 FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
INSERT INTO Departments (DepartmentID, DepartmentName, ManagerID, Location)
VALUES
 (1, 'IT', 101, 'New York'),
 (2, 'HR', 102, 'San Francisco'),
 (3, 'Finance', 103, 'Los Angeles'),
 (4, 'Admin', 104, 'Chicago'),
 (5, 'Marketing', 105, 'Miami');
INSERT INTO Employee (EmployeeID, FirstName, LastName, DoB, Gender, HireDate, DepartmentID,
Salary)
VALUES
 (101, 'John', 'Doe', '1985-04-12', 'Male', '2010-06-15', 1, 75000.00),
 (102, 'Jane', 'Smith', '1990-08-24', 'Female', '2015-03-10', 2, 60000.00),
 (103, 'Robert', 'Brown', '1982-12-05', 'Male', '2008-09-25', 3, 82000.00),
 (104, 'Emily', 'Davis', '1988-11-11', 'Female', '2012-07-18', 4, 58000.00),
 (105, 'Michael', 'Wilson', '1992-02-02', 'Male', '2018-11-30', 5, 67000.00);
INSERT INTO Projects (ProjectID, ProjectName, StartDate, EndDate, DepartmentID)
VALUES
 (201, 'Project Alpha', '2022-01-01', '2022-12-31', 1),
 (202, 'Project Beta', '2023-03-15', '2024-03-14', 2),
 (203, 'Project Gamma', '2021-06-01', '2022-05-31', 3),
 (204, 'Project Delta', '2020-10-10', '2021-10-09', 4),
 (205, 'Project Epsilon', '2024-04-01', '2025-03-31', 5);




-- 1.Create Stored Procedure for Employee table As User enters either First Name or Last Name and based
--on this you must give EmployeeID, DOB, Gender & Hiredate.
CREATE PROCEDURE PR_PERSON_FNAME_OR_LNAME
	@Name VARCHAR(100)
	AS
	BEGIN
		SELECT EmployeeID, DoB, Gender, HireDate FROM Employee
		WHERE FirstName = @Name OR LastName = @Name
	END

	EXEC PR_PERSON_FNAME_OR_LNAME 'Doe'

--2. Create a Procedure that will accept Department Name and based on that gives employees list who
--belongs to that department. 

CREATE PROCEDURE PR_DEPARTMENT_LIST
	@DEPARTMENT_NAME VARCHAR(100)
	AS
BEGIN
	SELECT Employee.* FROM Employee JOIN Departments ON Employee.DepartmentID = Departments.DepartmentID
	WHERE Departments.DepartmentName = @DEPARTMENT_NAME
END
	
EXEC PR_DEPARTMENT_LIST 'HR'

--3.Create a Procedure that accepts Project Name & Department Name and based on that you must give
--all the project related details.

CREATE PROCEDURE PR_DEPT_PRO_DETAILS
	@PROJECT_NAME VARCHAR(50),
	@DEPARTMENT_NAME VARCHAR(50)
	AS 
	BEGIN
	SELECT * FROM Projects JOIN Departments ON Projects.DepartmentID = Departments.DepartmentID
	WHERE Projects.ProjectName = @PROJECT_NAME AND Departments.DepartmentName = @DEPARTMENT_NAME
	END

--4. Create a procedure that will accepts any integer and if salary is between provided integer, then those
--employee list comes in output.

CREATE PROCEDURE PR_EMPLOYEE_INT
	@SALARY1 INT,
	@SALARY2 INT
	AS
	BEGIN
		SELECT FirstName + ' ' + LastName, Salary FROM Employee WHERE Salary BETWEEN @SALARY1 AND @SALARY2
	END

--5. Create a Procedure that will accepts a date and gives all the employees who all are hired on that date. 

CREATE PROCEDURE PR_EMPLOYEE_JOINBETWEEN
	@DATE_TIME DATETIME
	AS
	BEGIN
		SELECT * FROM Employee WHERE HireDate = @DATE_TIME
	END

	exec PR_EMPLOYEE_JOINBETWEEN '2015-03-10'


