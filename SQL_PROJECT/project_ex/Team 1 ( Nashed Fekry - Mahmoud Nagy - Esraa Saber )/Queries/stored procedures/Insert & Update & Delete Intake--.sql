----------------------------------
-- Insert & Update & Delete Intake

CREATE PROCEDURE add_New_Intake
	@ID int,
    @Name VARCHAR(50)
AS
BEGIN
    INSERT INTO Intake(Intake_ID,Intake_Name)
    VALUES (@ID,@Name)
END

SELECT * FROM Intake
EXEC add_New_Intake 7,'C++'


Create PROCEDURE Intake_Action_Update_Or_Delete
    @IntakID INT,
    @IntakName NVARCHAR(max)=NULL,
    @Action NVARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;
    IF @Action = 'UPDATE'
    BEGIN
        -- Update Intake data
        UPDATE [dbo].[Intake]
        SET [Intake_Name] = @IntakName
        WHERE [Intake_ID] = @IntakID;
    END

    ELSE IF @Action = 'DELETE'
    BEGIN
	 -- Delete Intake data
           DELETE FROM [dbo].[Course_Intake]
            WHERE  [Intake_ID]= @IntakID
            DELETE FROM [dbo].[Student_Intake]
            WHERE  [Intake_ID]= @IntakID
			 DELETE FROM [dbo].[Intake]
            WHERE [Intake_ID] = @IntakID;       

    END
END
GO

SELECT * FROM [dbo].[Intake]

EXEC Intake_Action_Update_Or_Delete
    @IntakID = 7,
	 @IntakName='aya',
	@Action = 'UPDATE';
	GO

EXEC Intake_Action_Update_Or_Delete
    @IntakID = 7,
	@Action = 'DELETE';
	GO
