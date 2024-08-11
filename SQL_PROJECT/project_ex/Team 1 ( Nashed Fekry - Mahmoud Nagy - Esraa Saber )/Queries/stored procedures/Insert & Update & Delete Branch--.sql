----------------------------------------
-- Insert & Update & Delete Branch

CREATE PROCEDURE add_New_Branch
    @Name VARCHAR(50)
AS
BEGIN
    INSERT INTO Branch (Branch_Name)
    VALUES (@Name)
END

SELECT * FROM [dbo].[Branch]
EXEC add_New_Branch 'Minya'

go

Create PROCEDURE Branch_Action_Update_Or_Delete
    @BranchID INT,
    @BranchName NVARCHAR(max)=NULL,
    @Action NVARCHAR(10)
AS
BEGIN
   
    IF @Action = 'UPDATE'
    BEGIN
        -- Update Branch data
        UPDATE [dbo].[Branch]
        SET [Branch_Name] = @BranchName
        WHERE [Branch_ID] = @BranchID;
    END
    ELSE IF @Action = 'DELETE'
    BEGIN
	 -- Delete Branch data
           DELETE FROM [dbo].[Course_Branch]
            WHERE  [Branch_ID]= @BranchID
            DELETE FROM [dbo].[Student_Branch]
            WHERE  [Branch_ID]= @BranchID
			 DELETE FROM [dbo].[Branch]
            WHERE [Branch_ID] = @BranchID;       

    END
END
GO


SELECT * FROM [dbo].[Branch]


EXEC Branch_Action_Update_Or_Delete
   @BranchID = 6,
   @BranchName='Minya',
   @Action = 'UPDATE';


EXEC Branch_Action_Update_Or_Delete
   @BranchID = 5,
	@Action = 'DELETE';
	GO


