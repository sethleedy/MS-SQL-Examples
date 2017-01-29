USE NORTHWND;
GO

--https://msdn.microsoft.com/en-us/library/ms187926.aspx?f=255&MSPPError=-2147217396
--Avoid the use of the sp_ prefix when naming procedures. This prefix is used by SQL Server to designate system procedures. Using the prefix can cause application code to break if there is a system procedure with the same name.
CREATE PROC spInsertEmployee2 @lastName nvarchar(20), @firstName nvarchar(10), @title nvarchar(30), @birthDate datetime, @hireDate datetime, @homePhone nvarchar(24) = '', @titleOfCur nvarchar(25) = '', @address nvarchar(60) = '', @city nvarchar(60) = '', @region nvarchar(15) = '', @postalCode nvarchar(10) = ''
AS
	DECLARE @tE_INSERT varchar(10) = 'tE_INSERT';
	BEGIN TRANSACTION @tE_INSERT;

	INSERT INTO Employees
		(LastName, FirstName, HireDate, BirthDate, Title, TitleOfCourtesy, Address, City, Region, PostalCode, HomePhone)
		VALUES (@lastName, @firstName, @hireDate, @birthDate, @title, @titleOfCur, @address, @city, @region, @postalCode, @homePhone);

	IF @@ERROR <> 0 
		BEGIN
			ROLLBACK TRAN @tE_INSERT;
			RETURN 1;
		END

	COMMIT TRANSACTION;
GO

DECLARE @currDate AS datetime = CONVERT(date, GETDATE());
EXEC spInsertEmployee2 'Halbert', 'Jim', 'Sales', '4-2-1971', @currDate, '330-555-5555', 'Receptionist', '','','','';
GO