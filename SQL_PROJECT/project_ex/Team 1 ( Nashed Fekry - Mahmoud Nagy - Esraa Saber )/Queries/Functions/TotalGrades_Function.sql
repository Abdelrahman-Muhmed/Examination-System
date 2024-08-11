CREATE FUNCTION TotalGrades(@studentID INT)
RETURNS INT
AS
BEGIN
    DECLARE @Total INT;
    
    SELECT @Total = SUM(Questions_result)
    FROM Students_take_Exam
    WHERE Std_ID = @studentID;
    
    RETURN @Total;
END;
GO
--test
DECLARE @StudentID INT = 1; 
SELECT dbo.TotalGrades(@StudentID) AS TotalGrades;
Go