----------------------------------------
-- Insert & Update & Delete Instructor
CREATE PROCEDURE add_New_Instructor
    @ID INT,
	@age INT,
    @Name VARCHAR(50)
    
AS
BEGIN
    INSERT INTO Instructor (Ins_ID,Age,Inst_Name)
    VALUES (@ID, @age, @Name)
END

select * from [dbo].[Instructor]
exec add_New_Instructor 7,29,'Mostafa'

go 

CREATE PROCEDURE Update_Instructor_Name
    @ID INT,
    @Name VARCHAR(50)
AS
BEGIN
    UPDATE Instructor
    SET Inst_Name = @Name
    WHERE Ins_ID = @ID
END

select * from [dbo].[Instructor]
exec Update_Instructor_Name 7,'Mostafaaa'

CREATE PROCEDURE Update_Instructor_Age
    @ID INT,
    @age int
AS
BEGIN
    UPDATE Instructor
    SET Age = @age
    WHERE Ins_ID = @ID
END

select * from [dbo].[Instructor]
exec Update_Instructor_Age 7,30 




CREATE PROCEDURE delete_Instructor
    @InstructorID INT
AS
BEGIN
	        -- Delete instructor data
            DELETE FROM [dbo].[Instructor_Sets_Exam]
            WHERE [Inst_ID] = @InstructorID
            DELETE FROM [dbo].[Instructor_Choose_Questions]
            WHERE [Instructor_ID] = @InstructorID
			DELETE  FROM [dbo].[Instructor_Teach_Course]
            WHERE [Inst_ID] = @InstructorID
			DELETE FROM [dbo].[Instructor]
            WHERE [Mgr_ID] = @InstructorID
			DELETE FROM instructor
            WHERE [Ins_ID] = @InstructorID;
    END

Go

--Exec
EXEC delete_Instructor
    @InstructorID = 7

	select* from Instructor