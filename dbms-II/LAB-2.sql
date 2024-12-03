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
	@