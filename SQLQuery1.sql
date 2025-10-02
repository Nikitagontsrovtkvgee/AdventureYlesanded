SELECT * from DimEmployee

CREATE FUNCTION fn_ILTVF_GetEmployees()
Returns Table
as
Return (Select EmployeeKey, FirstName,
Cast(BurthDate as Date) as DOB
From dbo.DimEployee);

Select * From fn_ILTVF_GetEmployees();