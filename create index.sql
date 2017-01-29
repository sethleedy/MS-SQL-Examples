 --Upload a script that will create a non-clustered index for HireDate on HumanResources.Employee in the Adventure Works database.
USE "AdventureWorks2012";

CREATE NONCLUSTERED INDEX iHireDate
ON HumanResources.Employee(HireDate)
--WITH (DROP_EXISTING = ON)
;