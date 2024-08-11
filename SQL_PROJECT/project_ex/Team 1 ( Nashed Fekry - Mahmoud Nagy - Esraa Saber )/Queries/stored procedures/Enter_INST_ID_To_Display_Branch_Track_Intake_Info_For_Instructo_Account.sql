CREATE OR ALTER PROCEDURE Enter_INST_ID_To_Display_Branch_Track_Intake_Info
    @Indtructor_ID INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT i.[Inst_Name] AS Instructor, b.[Branch_Name] AS Branch, it.[Intake_Name] AS Intake , t.[Track_Name] AS Track
    FROM dbo.Instructor i
    INNER JOIN dbo.Instructor_Teach_Course itc ON i.[Ins_ID] = itc.[Inst_ID]
    INNER JOIN dbo.Course c ON itc.[Course_ID] = c.[Course_ID]
    LEFT JOIN dbo.Course_Branch cb ON c.[Course_ID] = cb.[Course_ID]
    LEFT JOIN dbo.Branch b ON cb.[Branch_ID] = b.[Branch_ID]
    LEFT JOIN dbo.Course_Intake ci ON c.[Course_ID] = ci.[Course_ID]
    LEFT JOIN dbo.Intake it ON ci.[Intake_ID] = it.[Intake_ID]
    LEFT JOIN dbo.Course_Track ct ON c.[Course_ID] = ct.[Course_ID]
    LEFT JOIN dbo.Track t ON ct.[Track_ID] = t.[Track_ID]
    WHERE i.[Ins_ID] = @Indtructor_ID;
END;
GO
EXEC Enter_INST_ID_To_Display_Branch_Track_Intake_Info
    @Indtructor_ID = 1;
	GO