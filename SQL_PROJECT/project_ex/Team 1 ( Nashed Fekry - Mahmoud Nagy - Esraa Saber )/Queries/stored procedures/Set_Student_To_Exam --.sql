--Insert Into Instructor's_Selected_Students Table

CREATE OR ALTER PROCEDURE Set_Student_To_Exam
    @StudentID INT,
    @InstructorID INT,
    @ExamID INT
AS
BEGIN
 BEGIN TRY
    INSERT INTO [dbo].[Instructor's_Selected_Students] (Std_ID,Inst_ID,[Exam_Id])
    VALUES (@StudentID, @InstructorID, @ExamID);
 END TRY
 BEGIN CATCH
	SELECT  ERROR_MESSAGE()
			RAISERROR('Inser Valid A Data',16,1)
 END CATCH
END;
GO
--TEST

DECLARE @Instructor_ID INT = 6;
DECLARE @Student_ID INT = 5;
DECLARE @Exam_ID INT = 7;
EXEC Set_Student_To_Exam @Student_ID, @Instructor_ID, @Exam_ID;

SELECT* FROM [dbo].[Instructor's_Selected_Students]

