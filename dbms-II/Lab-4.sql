--1. Write a function to print "hello world".

CREATE OR ALTER FUNCTION FN_PRINT_HELLOWORLD()
	RETURNS VARCHAR(50)
	AS
	BEGIN
		RETURN 'HELLO WORLD'
	END
SELECT DBO.FN_PRINT_HELLOWORLD()
--2. Write a function which returns addition of two numbers.
CREATE OR ALTER FUNCTION FN_ADD_TWO_NUMBER(
	@NUM1 INT,
	@NUM2 INT
)
RETURNS INT
AS
BEGIN 
	RETURN @NUM1 + @NUM2
END

SELECT DBO.FN_ADD_TWO_NUMBER(2,3)

--3. Write a function to check whether the given number is ODD or EVEN.

CREATE OR ALTER FUNCTION FN_CHECK_ODD_EVEN(
	@NUM1 INT
)
RETURNS VARCHAR(5)
AS
BEGIN
	DECLARE @ANS AS VARCHAR(10)
	IF @NUM1 % 2 = 0 
		SET @ANS = 'EVEN'
	ELSE 
		SET @ANS = 'ODD'
	RETURN @ANS
END

SELECT DBO.FN_CHECK_ODD_EVEN(2)
--4. Write a function which returns a table with details of a person whose first name starts with B.

CREATE OR ALTER FUNCTION FN_FINDBYB()
	RETURNS TABLE
RETURN (SELECT FIRSTNAME FROM Person WHERE FirstName LIKE 'B%')

SELECT * from dbo.FN_FINDBYB()

--5. Write a function which returns a table with unique first names from the person table.

CREATE OR ALTER FUNCTION FN_RETURN_DISTINCT_FIRSTNAME()
RETURNS TABLE
RETURN (SELECT DISTINCT FirstName FROM Person)

SELECT * FROM DBO.FN_RETURN_DISTINCT_FIRSTNAME()

--6. Write a function to print number from 1 to N. (Using while loop)

CREATE OR ALTER FUNCTION FU_PRINT_1_TO_N(
	@NUM1 INT
)
RETURNS VARCHAR(500)
AS
BEGIN 
	DECLARE @I AS INT 
	DECLARE @ANS AS VARCHAR(500)
	SET @ANS = ' '
	SET @I = 0
	WHILE (@I <= @NUM1)
		BEGIN
			SET @ANS = @ANS + CONVERT(VARCHAR,@I) + ','
			SET @I = @I + 1
		END
	
	RETURN @ANS
	END

SELECT DBO.FU_PRINT_1_TO_N(5)


--7. Write a function to find the factorial of a given integer.

CREATE OR ALTER FUNCTION FN_FAC(
	@NUM1 INT
)
RETURNS INT
AS
BEGIN
	DECLARE @ANS AS INT
	SET @ANS = 1
	DECLARE @I AS INT
	SET @I = 1
	WHILE ( @I <= @NUM1 )
		BEGIN
			SET @ANS = @ANS * @I
			SET @I = @I + 1
		END
		RETURN @ANS
END 

SELECT DBO.FN_FAC(4)


-------------------------------  Part – B
--8. Write a function to compare two integers and return the comparison result. (Using Case statement)
CREATE OR ALTER FUNCTION FN_COMPARE(
	@NUM1 INT,
	@NUM2 INT
)
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @ANS AS VARCHAR(100)
	SET @ANS = ' '
	RETURN CASE
	WHEN @NUM1 = @NUM2 THEN 'EQAL'
	WHEN @NUM1 > @NUM2 THEN 'NUMBER1 IS GREATER'
	WHEN @NUM1 < @NUM2 THEN 'NUMBER1 IS LESS'
	END;
END

SELECT DBO.FN_COMPARE(2,3)

--9. Write a function to print the sum of even numbers between 1 to 20.

CREATE OR ALTER FUNCTION FN_PRINT_SUM_1_TO_20()
RETURNS INT
AS
BEGIN
	DECLARE @NUM1 AS INT
	SET @NUM1 = 20
	DECLARE @I AS INT
	SET @I = 1
	DECLARE @ANS AS INT
	SET @ANS = 0
	WHILE (@I <= @NUM1) 
	BEGIN
		IF(@I % 2 = 0) SET @ANS = @ANS + @I
		SET @I = @I + 1
	END
	RETURN @ANS
END

SELECT DBO.FN_PRINT_SUM_1_TO_20()

--10. Write a function that checks if a given string is a palindrome

CREATE OR ALTER FUNCTION FN_CHECK_PLINDROME(
	@STR VARCHAR(100)
)
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @ANS AS VARCHAR(100)
	SET @ANS = ' '
	RETURN (
		CASE 
		WHEN @STR = REVERSE(@STR) THEN 'PLINDROM'
		ELSE 'NOT PALINDROM'
		END
	)
END 

SELECT DBO.FN_CHECK_PLINDROME('NAYAN')

------------------------------- Part – C
--11. Write a function to check whether a given number is prime or not.

CREATE OR ALTER FUNCTION FN_CHECK_PRIME_OR_NOT(
	@NUM1 INT
)
RETURNS VARCHAR(100)
AS
BEGIN
	DECLARE @ANS AS VARCHAR(100)
	SET @ANS = 'PRIME'
	DECLARE @I AS INT
	SET @I = 2
	WHILE @I<=FLOOR(@NUM1/2)
	BEGIN
		IF @NUM1 % @I = 0
			SET @ANS = 'NOT PRIME' 
		SET @I = @I + 1
	END
	RETURN @ANS
END

SELECT DBO.FN_CHECK_PRIME_OR_NOT(20)

--12. Write a function which accepts two parameters start date & end date, and returns a difference in days.

CREATE OR ALTER FUNCTION FN_GET_DIFF
(
	@DATEONE DATE,
	@DATETWO DATE
)
RETURNS INT
AS
BEGIN
	RETURN DATEDIFF(DAY,@DATEONE,@DATETWO)
END

SELECT DBO.FN_GET_DIFF('2005-02-12','2005-02-14')
--13. Write a function which accepts two parameters year & month in integer and returns total days each
--year.



--14. Write a function which accepts departmentID as a parameter & returns a detail of the persons.
--15. Write a function that returns a table with details of all persons who joined after 1-1-1991.