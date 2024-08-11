CREATE FUNCTION dbo.TotalInstructors()
RETURNS INT
AS
BEGIN
    DECLARE @TotalCount INT;
    
    SELECT @TotalCount = COUNT(*) FROM[Instructor] ;
    
    RETURN @TotalCount;
END;
GO
SELECT dbo.TotalInstructors() AS TotalInstructors;