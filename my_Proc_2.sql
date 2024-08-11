--Create Proc Take Id from Instructor And Return Data Of Course And Instrctor 

  CREATE OR ALTER PROC get_Instructor_Data @id_Ins INT 
AS
BEGIN
    BEGIN TRY 
        IF EXISTS (
            SELECT *
            FROM [dbo].[Instructor] AS i
            WHERE i.INS_ID = @id_Ins 
        )
        BEGIN
            --The Select if my condation Right if the condition exists
            SELECT INS_Name , INS_PersonalData , INS_UserName , C_Name
            FROM [dbo].[Instructor] AS i
            JOIN [dbo].[Course] AS c ON i.INS_ID = c.Inst_Id
            WHERE i.INS_ID = @id_Ins AND @id_Ins != 0
			ORDER BY C_Name
        END
        ELSE
        BEGIN
            --The Select if my condation Rong if the condition exists
            THROW 5000, 'The Inst_Is  Not Found. Please try again.', 1;
        END
    END TRY 

    BEGIN CATCH
        --  logic for catching and handling errors
        SELECT ERROR_MESSAGE() AS ErrorMessage, ERROR_LINE() AS ErrorLine;
    END CATCH 
END;

EXECUTE get_Instructor_Data @id_Ins = 7; 

--Create Proc Take Id from Student And Return Data Of Course And Instrctor 
 CREATE OR ALTER PROC get_Student_Data @id_Student INT 
AS
BEGIN
    BEGIN TRY 
        IF EXISTS (
		              SELECT * 
                      FROM [Training_Manager].[Student] AS TMStudent
					  WHERE TMStudent.ST_ID = @id_Student

                    )
        BEGIN
            --The Select if my condation Right if the condition exists
                      SELECT TMStudent.ST_Name , TMStudent.ST_Personal_Data ,TMStudent.ST_Address , 
					  TMStudent.ST_Age , TMStudent.ST_UserName ,C_Name , BR_Name    
                      FROM [Training_Manager].[Student] AS TMStudent
                      INNER JOIN [Student].[Student_Takes_Course] AS StudentCourse
                      ON TMStudent.ST_ID = StudentCourse.St_ID
                      INNER JOIN [dbo].[Course]
                      ON C_ID = StudentCourse.Cour_ID 
					  INNER JOIN [Training_Manager].[Branch] AS TMBranch
					  ON TMStudent.ST_ID = TMBranch.BR_ID
					  WHERE TMStudent.ST_ID = @id_Student 
        END
        ELSE
        BEGIN
            --The Select if my condation Rong if the condition exists
            THROW 5000, 'The Student_Is Not Found. Please try again.', 1;
        END
    END TRY 

    BEGIN CATCH
        -- Your logic for catching and handling errors
        SELECT ERROR_MESSAGE() AS ErrorMessage, ERROR_LINE() AS ErrorLine;
    END CATCH 
END;

EXECUTE get_Student_Data @id_Student = 2; 

--Create Proc For Show Exame And Degree From Student Id 
CREATE OR ALTER PROC get_ExAndDegree @student_Id INT 
AS
BEGIN
    BEGIN TRY 
        IF EXISTS (
		              SELECT *
					  FROM [Training_Manager].[Student] 

                    )
        BEGIN

            --The Select if my condation Right if the condition exists 
                      SELECT s.ST_Name  , ex.EX_ID, ex.EX_Type , spe.Total_Result , c.C_Name
					  FROM [Training_Manager].[Student] s
					  INNER JOIN [Student].[Student_Perform_Exam] spe
					  ON ST_ID = Student_ID
					  INNER JOIN [Instructor].[Exam] ex
					  ON EX_ID = Exam_ID
					  INNER JOIN [dbo].[Course] c
					  ON ex.Cour_Id = c.C_ID
					  WHERE ST_ID = @student_Id
			

        END
        ELSE
        BEGIN
            --The Select if my condation Rong if the condition exists
            THROW 5000, 'The Student_Is Not Found. Please try again.', 1;
        END
    END TRY 

    BEGIN CATCH
        -- Your logic for catching and handling errors
        SELECT ERROR_MESSAGE() AS ErrorMessage, ERROR_LINE() AS ErrorLine;
    END CATCH 
END;

EXECUTE get_ExAndDegree @student_Id = 2


--Add Course Name ...........................................................................
--Create Proc For Show Data Of Exam From ExameId     
CREATE OR ALTER PROC get_ExData @Ex_id INT 
AS
BEGIN
    BEGIN TRY 
        IF EXISTS (
		              SELECT *
					  FROM [Instructor].[Exam] ex
                    )
        BEGIN
            --The Select if my condation Right if the condition exists
                      SELECT ex.EX_ID, ex.EX_Type, ex.EX_Start_Time , ex.EX_End_Time , ex.EX_total_Time , ex.EX_Year 
					  FROM [Instructor].[Exam] ex , [dbo].[Course] c
					  WHERE ex.Cour_Id = c.C_ID AND EX_ID = 7
					
            END
          ELSE
        BEGIN
		SELECT * FROM [Instructor].[Exam]
		SELECT * FROM [dbo].[Course]
            --The Select if my condation Rong if the condition exists
            THROW 5000, 'The ExamId Not Found. Please try again.', 1;
        END
    END TRY 

    BEGIN CATCH
        -- Your logic for catching and handling errors
        SELECT ERROR_MESSAGE() AS ErrorMessage, ERROR_LINE() AS ErrorLine;
    END CATCH 
END;

EXECUTE get_ExData @Ex_id = 6

