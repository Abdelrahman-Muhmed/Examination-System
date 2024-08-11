CREATE FUNCTION dbo.TotalStudent()
RETURNS INT
AS
BEGIN
    DECLARE @TotalCount INT;
    
    SELECT @TotalCount = COUNT(*) FROM Students;
    
    RETURN @TotalCount;
END;
GO
SELECT dbo.TotalStudent() AS TotalStudents;
Go
----------------------------------------------------------------
