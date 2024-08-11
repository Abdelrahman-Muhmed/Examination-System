CREATE FUNCTION dbo.TotalCourse()
RETURNS INT
AS
BEGIN
    DECLARE @TotalCount INT;
    
    SELECT @TotalCount = COUNT(*) FROM Course;
    
    RETURN @TotalCount;
END;
GO
SELECT dbo.TotalCourse() AS Total_Course_In_Our_System;
Go