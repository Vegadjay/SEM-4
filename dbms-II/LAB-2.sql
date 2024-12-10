CREATE TABLE Department (
 DepartmentID INT PRIMARY KEY,
 DepartmentName VARCHAR(100) NOT NULL UNIQUE
)

CREATE TABLE Designation (
 DesignationID INT PRIMARY KEY,
 DesignationName VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Person (
 PersonID INT PRIMARY KEY IDENTITY(101,1),
 FirstName VARCHAR(100) NOT NULL,
 LastName VARCHAR(100) NOT NULL,
 Salary DECIMAL(8, 2) NOT NULL,
 JoiningDate DATETIME NOT NULL,
 DepartmentID INT NULL,
 DesignationID INT NULL,
 FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
 FOREIGN KEY (DesignationID) REFERENCES Designation(DesignationID)
);


-- create procedures

CREATE PROCEDURE Pr_Person_Insert
	@FirstName varchar(100),
	@LastName varchar(100),
	@Salary decimal(8,2),
	@JoiningDate Datetime,
	@DepartmentID int,
	@DesignationID int
	AS
BEGIN
	INSERT INTO Person 
		(FirstName, LastName, Salary, JoiningDate, DepartmentID, DesignationID)
	VALUES 
		(@FirstName, @LastName, @Salary, @JoiningDate, @DepartmentID, @DesignationID)
END

exec Pr_Person_Insert 'Neha', 'Trivedi', 18000, '2014-02-20', 3,15

CREATE PROCEDURE Pr_Department_Insert
	@DepartmentID int,
	@DepartmentName varchar(100)
	AS
BEGIN
	INSERT INTO Department 
		(DepartmentID,DepartmentName)
	VALUES 
		(@DepartmentID, @DepartmentName)
END

CREATE PROCEDURE Pr_Designation_Insert
	@DesignationID int,
	@DesignationName varchar(100)
	AS
BEGIN
	INSERT INTO Designation 
		(DesignationID, DesignationName )
	VALUES 
		(@DesignationID, @DesignationName )
END


-- update procedure

CREATE PROCEDURE Pr_Person_Update 
	@PersonId int,
	@Fname varchar(100),
	@Lname varchar(100),
	@Salary decimal(8,2),
	@Jdate Datetime,
	@Deptid int,
	@Desiid int
	AS
	BEGIN
		UPDATE PERSON SET FirstName = @Fname, LastName = @Lname, Salary = @Salary, JoiningDate = @Jdate,DepartmentID = @Deptid, DesignationID = @Desiid
		where PersonID = @PersonId
end

CREATE PROCEDURE Pr_Designation_Update 
	@Designation_id int,
	@Designation_name varchar(100)
	AS
	BEGIN
		UPDATE Designation SET DesignationID = @Designation_id, DesignationName = @Designation_name
		where DesignationID = @Designation_id
end

CREATE PROCEDURE Pr_Department_Update 
	@Department_id int,
	@Department_name varchar(100)
	AS
	BEGIN
		UPDATE Department SET DepartmentID = @Department_id, DepartmentName  = @Department_name
		where DepartmentID = @Department_name
end

--2) Department, Designation & Person Table’s SELECTBYPRIMARYKEY


CREATE PROCEDURE PR_DESIGNATION_SELECTBYPRIMARYKEY
	@Designation_Id INT
	AS
	BEGIN
		SELECT * FROM Designation 
		WHERE DesignationID = @Designation_Id
	end

-- GOT ALL DETAILS USING DEPARTMENT ID AS PRIMARY KEY

CREATE PROCEDURE PR_DEPARTMENT_SELECTBYPRIMARYKEY
	@Department_id int
	AS 
	BEGIN
		SELECT * FROM Department
		WHERE DepartmentID = @Department_id
	END

-- GOT ALL DETAILS USING PERSON ID AS PRIMARY KEY

CREATE PROCEDURE PR_PERSON_SELECTBYPRIMARYKEY
	@Person_id int
	AS 
BEGIN
		SELECT * FROM Person
		WHERE PersonID = @Person_id
END

-- Department, Designation & Person Table’s (If foreign key is available then do write join and take
-- columns on select list)

CREATE PROCEDURE PR_DEPTARTMENT_DEPT
	AS 
BEGIN
		SELECT * FROM Person
		JOIN Department ON Person.DepartmentID = Department.DepartmentID
		JOIN Designation ON Person.DesignationID = Designation.DesignationID
END
 EXEC PR_DEPTARTMENT_DEPT


CREATE PROCEDURE PR_Dept 
	AS 
BEGIN
		SELECT * FROM Department
END

CREATE PROCEDURE PR_Designation 
	AS 
BEGIN
		SELECT * FROM Designation
END

exec PR_Designation


--4. Create a Procedure that shows details of the first 3 persons.

CREATE PROCEDURE PR_Person_Top_3
as
begin
	select top 3 * from Person
end