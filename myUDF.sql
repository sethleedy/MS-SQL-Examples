use "NORTHWND";
GO

CREATE FUNCTION dbo.Employee_Name(@eID int)
RETURNS @eDetails TABLE (
	firstName varchar(20) NOT NULL,
	lastName varchar(10) NOT NULL,
	HomePhone varchar(24) NULL
)
AS

BEGIN

	INSERT INTO @eDetails
		SELECT firstName, lastName, HomePhone
		FROM Employees
		WHERE EmployeeID=@eID


	RETURN
END
GO

SELECT * FROM dbo.Employee_Name(5);
GO