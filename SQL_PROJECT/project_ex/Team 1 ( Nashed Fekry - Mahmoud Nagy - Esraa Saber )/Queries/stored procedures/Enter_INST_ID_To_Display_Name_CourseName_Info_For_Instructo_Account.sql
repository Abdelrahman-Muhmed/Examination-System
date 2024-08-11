CREATE OR ALTER PROCEDURE Enter_INST_ID_To_Display_Name_CourseName_Info
    @Insructor_ID INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT i.[Inst_Name] AS Instructor, c.[Name] AS Course
    FROM dbo.Instructor i
     JOIN dbo.Instructor_Teach_Course itc ON i.[Ins_ID] = itc.[Inst_ID]
	 JOIN dbo.Course c ON itc.[Course_ID] = c.[Course_ID]
    WHERE i.[Ins_ID] = @Insructor_ID;
END;
Go
EXEC Enter_INST_ID_To_Display_Name_CourseName_Info
   @Insructor_ID = 5;
Go