-- 32. Mitme avaldisega tabeliväärtusega funktsioonid
----------------------------------------------------

CREATE TABLE tblEmployees(
    Id INT PRIMARY KEY,
    Name NVARCHAR(50),
    DateOfBirth DATETIME,
    Gender NVARCHAR(10),
    DepartmentId INT
);

INSERT INTO tblEmployees VALUES
(1, 'Sam', '1980-12-30', 'Male', 1),
(2, 'Pam', '1982-09-01', 'Female', 2),
(3, 'John', '1985-08-22', 'Male', 1),
(4, 'Sara', '1979-11-29', 'Female', 3),
(5, 'Todd', '1978-11-29', 'Male', 1);
-- Inline Table-Valued Function (ILTVF)
CREATE FUNCTION fn_ILTVF_GetEmployees()
RETURNS TABLE
AS
RETURN (
    SELECT Id, Name, CAST(DateOfBirth AS DATE) AS DOB
    FROM tblEmployees
);
GO

-- Multi-Statement Table-Valued Function (MSTVF)
IF OBJECT_ID('dbo.fn_MSTVF_GetEmployees', 'TF') IS NOT NULL
    DROP FUNCTION dbo.fn_MSTVF_GetEmployees;
GO

CREATE FUNCTION dbo.fn_MSTVF_GetEmployees()
RETURNS @Table TABLE
(
    Id INT,
    Name NVARCHAR(50),
    Gender NVARCHAR(10),
    DepartmentId INT
)
AS
BEGIN
    INSERT INTO @Table
    SELECT Id, Name, Gender, DepartmentId
    FROM tblEmployees;
    RETURN;
END;
GO

-- Näide funktsioonide kasutamisest
SELECT * FROM fn_ILTVF_GetEmployees();
SELECT * FROM fn_MSTVF_GetEmployees();
GO

-- Katse muuta andmeid ILTVF abil
UPDATE fn_ILTVF_GetEmployees()
SET Name = 'Sam1'
WHERE Id = 1;
GO


----------------------------------------------------
-- 33. Funktsiooniga seotud tähtsad kontseptsioonid
----------------------------------------------------

-- 1. Lihtne skaleeritav funktsioon
IF OBJECT_ID('dbo.fn_GetEmployeeNameById', 'FN') IS NOT NULL
    DROP FUNCTION dbo.fn_GetEmployeeNameById;
GO

CREATE FUNCTION dbo.fn_GetEmployeeNameById(@Id INT)
RETURNS NVARCHAR(50)
AS
BEGIN
    DECLARE @Name NVARCHAR(50);

    SELECT @Name = Name
    FROM tblEmployees
    WHERE Id = @Id;

    RETURN @Name;
END;
GO

-- Funktsiooni sisu vaatamine
EXEC sp_helptext fn_GetEmployeeNameById;
GO

-- 2. Sama funktsioon krüpteerituna
ALTER FUNCTION fn_GetEmployeeNameById(@Id INT)
RETURNS NVARCHAR(20)
WITH ENCRYPTION
AS
BEGIN
    RETURN (SELECT Name FROM tblEmployees WHERE Id = @Id);
END;
GO

-- Proovime uuesti vaadata (ei kuvata sisu, kuna krüpteeritud)
EXEC sp_helptext fn_GetEmployeeNameById;
GO

-- 3. Funktsioon WITH SCHEMABINDING
ALTER FUNCTION fn_GetEmployeeNameById(@Id INT)
RETURNS NVARCHAR(20)
WITH SCHEMABINDING
AS
BEGIN
    RETURN (SELECT Name FROM dbo.tblEmployees WHERE Id = @Id);
END;
GO