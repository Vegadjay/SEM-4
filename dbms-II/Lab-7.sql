CREATE TABLE Customers (
 Customer_id INT PRIMARY KEY,
 Customer_Name VARCHAR(250) NOT NULL,
 Email VARCHAR(50) UNIQUE
);

-- Create the Orders table
CREATE TABLE Orders (
 Order_id INT PRIMARY KEY,
 Customer_id INT,
 Order_date DATE NOT NULL,
 FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id)
);

--1. Handle Divide by Zero Error and Print message like: Error occurs that is - Divide by zero error.
begin try
	declare @ans decimal(5,2)
	set @ans = 1/0
end try
begin catch
	print error_message()
end catch


--2. Try to convert string to integer and handle the error using try…catch block.

begin try
	declare @ans1 decimal(5,2),@temp varchar(50)
	set @temp = 'jay'
	set @ans1 = cast(@temp as int)
end try
begin catch
	print error_message()
end catch


--3. Create a procedure that prints the sum of two numbers: take both numbers as integer & handle
--exception with all error functions if any one enters string value in numbers otherwise print result.

create procedure pr_two_number_sum
  @num1 varchar(50) ,@num2 varchar(50) 
as
begin 
	begin try
	declare @ans int
		set @ans = cast(@num1  as int ) + cast(@num2  as int )
		print @ans
	end try
	begin catch
		print error_message()
	end catch
end

exec pr_two_number_sum 12,'Jay'


--4. Handle a Primary Key Violation while inserting data into customers table and print the error details
--such as the error message, error number, severity, and state.

	begin try
	declare @ans2 int
		insert into Customers values
		(1,'jay','jay@gmail.com')
	end try
	begin catch
		print error_message()
		print error_number()
		print error_severity()
		print error_state()
	end catch

	select * from Customers

--5. Throw custom exception using stored procedure which accepts Customer_id as input & that throws
--Error like no Customer_id is available in database.


create procedure pr_find 
  @id int 
as
begin 
	begin try
	declare @ANS1 int
		if not exists (select Customer_id from Customers where Customer_id = @id)
			throw 50000,'Primary key available',0
	end try
	begin catch
		print error_message()
		print error_number()
		print error_state()
	end catch
end

exec pr_find 10


------------------------------------ Part – B --------------------------------------------------------
--6. Handle a Foreign Key Violation while inserting data into Orders table and print appropriate error
--message.

begin try
	declare @ans int
		insert into Orders values
		(1,2,'2007-03-31')
	end try
	begin catch
		print error_message()
		print error_number()
		print error_severity()
		print error_state()
	end catch

	select * from Orders

--7. Throw custom exception that throws error if the data is invalid.
create or alter procedure pr_data 
  @age int 
as
begin 
	begin try
		if @age<18
			throw 50000,'Age must be grater than 18',0
	end try
	begin catch
		print error_message()
		print error_number()
		print error_state()
	end catch
end

exec pr_data 19

--8. Create a Procedure to Update Customer’s Email with Error Handling
create or alter procedure pr_update 
  @email varchar(50) ,@id int
as
begin 
	begin try
		if not exists (select Customer_id from Customers where Customer_id = @id)
			throw 50002 , 'Not found' , 0
		if exists (select Email from Customers where Email = @email)
			throw 50001 , 'Email is already exists' , 0

		Update Customers
		set Email = @email
		where Customer_id = @id 
	end try
	begin catch
		print error_message()
		print error_number()
		print error_state()
	end catch
end
select * from Customers
exec pr_update 'john@gmail.com',1


------------------------------------- part-C ------------------
--9. Create a procedure which prints the error message that “The Customer_id is already taken. Try another
--one”.
create or alter procedure pr_id 
 @id int
as
begin 
	begin try
		if exists (select Customer_id from Customers where Customer_id = @id)
			throw 50002 , 'The Customer_id is already taken. Try another one' , 0
		
	end try
	begin catch
		print error_message()
		print error_number()
		print error_state()
	end catch
end

exec pr_id 2

--10. Handle Duplicate Email Insertion in Customers Table.

create or alter procedure pr_email_dup 
 @email varchar(50)
as
begin 
	begin try
		if exists (select Email from Customers where Email = @email)
			throw 50001 , 'Email is already exists in database' , 0
	end try
	begin catch
		print error_message()
		print error_number()
		print error_state()
	end catch
end

exec pr_email_dup 'jay@gmail.com'
select * from Customers