--Create Stored Proc For [dbo].[Instructor] Table Do What After ..............

--First Add Instructor............................................................. 

CREATE OR ALTER PROC Add_New_Instrctor_proc (@ins_name NVARCHAR(50) , @ins_Age INT , 
@ins_adress NVARCHAR(50) , @ins_personal_data NVARCHAR(50) , @ins_username NVARCHAR(50))
AS
BEGIN TRY 
    DECLARE @add_ins NVARCHAR(50)
    SET @add_ins = (SELECT COUNT(*) FROM [dbo].[Instructor])+1
	--Add Chek for user exist or not 
    INSERT INTO [dbo].[Instructor]
    VALUES ( @ins_name , @ins_Age , @ins_adress , @ins_personal_data , @ins_username)
    SELECT CONCAT('Instructor is Added Succesfully,He Name is :' , @ins_name , 'And he is User Name :' , @ins_username ) AS NewConstructor 
	SELECT * FROM [dbo].[Instructor]
END TRY
BEGIN CATCH
EXECUTE  Add_New_Instrctor_proc @ins_id= 1,@ins_name = 'Ahmed' , @ins_Age = 50 ,@ins_adress = 'Mansoura' ,@ins_personal_data = 'Single' ,@ins_username = 'Ins1'


    SELECT ('The User Name Is frequent , Can You Try Again') , ERROR_MESSAGE(), ERROR_LINE();   
END CATCH 

--Scond Update Instructor ...............................................................

CREATE OR ALTER PROC update_Instrctor_proc (@ins_id INT , @ins_name NVARCHAR(50) , @ins_Age INT , 
@ins_adress NVARCHAR(50) , @ins_personal_data NVARCHAR(50) , @ins_username NVARCHAR(50))
AS
BEGIN TRY 
   IF (@ins_Age >= 25 AND @ins_username LIKE 'Ins%')
   BEGIN
    UPDATE Instructor
    SET  INS_Name = @ins_name , INS_Age = @ins_Age , INS_Address = @ins_adress ,
	INS_PersonalData = @ins_personal_data , INS_UserName = @ins_username 
	WHERE  INS_ID = @ins_id
	END
	 SELECT CONCAT('Instructor is Update Succesfully,He Name is :' , @ins_name , 'And User Name is :' , @ins_username ) AS UpdateConstructor 
	 SELECT * FROM [dbo].[Instructor]
END TRY
BEGIN CATCH
    SELECT ('The User Name Not Start With Ins or Age Less Than 20 Or The User Name Is frequent , Can You Try Again') , ERROR_MESSAGE(), ERROR_LINE();   
END CATCH 

EXECUTE update_Instrctor_proc @ins_id= 1,@ins_name = 'Ahmed' , @ins_Age = 50 ,@ins_adress = 'Mansoura' ,@ins_personal_data = 'Single' ,@ins_username = 'Ins1'


--Therd Delete Instructor ...............................................................

CREATE OR ALTER PROC remove_Instrctor_proc (@ins_id INT , @ins_username NVARCHAR(50) , @ins_name NVARCHAR(50))
AS
BEGIN TRY 
    DECLARE @delete_ins NVARCHAR(50)
    SET @delete_ins = (SELECT COUNT(*) FROM [dbo].[Instructor])-1
	DELETE [Instructor].[Chosen_Student]
    WHERE INS_id = @ins_id
    DELETE [dbo].[Instructor]
	WHERE INS_ID = @ins_id AND INS_UserName = @ins_username
    SELECT CONCAT('Instructor is Removed Succesfully,He Name is :' , @ins_name , 'And he is User Name :' , @ins_username ) AS NewConstructor 
	SELECT * FROM [dbo].[Instructor]
END TRY
BEGIN CATCH
    SELECT ('The User Name Not Found , Can You Try Again') , ERROR_MESSAGE(), ERROR_LINE();   
END CATCH 

EXECUTE remove_Instrctor_proc @ins_id= 1,@ins_username = 'Ins1' , @ins_name = 'Mohmed'


--Create Stored Proc For [dbo].[Course] Table Do What After ..............
--First Add Course ............................

CREATE OR ALTER PROC Add_New_Course_proc (@c_name NVARCHAR(50) , @c_description NVARCHAR(100) , @c_min_degree FLOAT , @c_max_degree FLOAT , @inst_id INT)

AS
BEGIN TRY 
    IF(@inst_id != 0 AND @c_min_degree > 50 AND @c_max_degree = 100)          --Add Check Instructor 
	BEGIN 
      DECLARE @add_Course NVARCHAR(100)
      SET @add_Course = (SELECT COUNT(*) FROM [dbo].[Instructor])+1
	END
    INSERT INTO [dbo].[Course]
    VALUES ( @c_name , @c_description , @c_min_degree , @c_max_degree ,@inst_id)
    SELECT CONCAT('Course Added Succesfully, Name is :' , @c_name, 'And Instructor id What Tech is :' , @inst_id) AS NewCourse
	SELECT * FROM [dbo].[Course]
END TRY
BEGIN CATCH
    SELECT ('The min_degree Less than 50 or max_degree greater than 100 , Try Again') , ERROR_MESSAGE(), ERROR_LINE();   
END CATCH 

EXECUTE Add_New_Course_proc @c_name = 'Javascript' , @c_description = 'Advanced mathematical principles for engineering.',
@c_min_degree = 60 , @c_max_degree  = 100 , @inst_id = 2

--Scond Update Course ............................
CREATE OR ALTER PROC update_Course_proc (@c_id INT , @c_name NVARCHAR(50) , @c_description NVARCHAR(100) , @c_min_degree FLOAT , @c_max_degree FLOAT , @inst_id INT)

AS
  BEGIN TRY 
   IF (@inst_id != 0 AND @c_min_degree > 50 AND @c_max_degree < 50)   --Add Check Instructor 
   BEGIN
    UPDATE [dbo].[Course]
    SET  C_Name = @c_name  , C_Description = @c_description , 
	C_Min_Degree = @c_min_degree , C_Max_Degree = @c_max_degree , Inst_Id = @inst_id
	WHERE C_ID = @c_id 
    SELECT CONCAT('Course Update Succesfully, Name is :' , @c_name, 'And Instructor id What Tech is :' , @inst_id) AS RempveCourse
	SELECT * FROM [dbo].[Course]
	END
  END TRY
BEGIN CATCH
    SELECT ('The Inst_Is OR C_ID Not Found  , Can You Try Again') , ERROR_MESSAGE(), ERROR_LINE();   
END CATCH 

EXECUTE update_Course_proc @c_id = 7, @c_name = 'Java' , @c_description = 'Advanced mathematical principles for engineering.',
@c_min_degree = 60.8 , @c_max_degree  = 99.9 , @inst_id = 4

--Third Delete .........................................................
CREATE OR ALTER PROC delete_Course_proc (@c_id INT , @c_name NVARCHAR(50) , @inst_id INT)

AS
  BEGIN TRY 
   IF (@inst_id != 0)
   BEGIN
    DECLARE @delete_Course NVARCHAR(50)
    SET @delete_Course = (SELECT COUNT(*) FROM [dbo].[Instructor])-1
    DELETE [Student].[Student_Takes_Course]
    WHERE Cour_ID = @c_id
    DELETE [dbo].[Course]
	WHERE C_ID = @c_id AND Inst_Id = @inst_id
    SELECT CONCAT('Course Update Succesfully, Name is :' , @c_name, 'And Instructor id What Tech is :' , @inst_id) AS RempveCourse
	SELECT * FROM [dbo].[Course]
	END
  END TRY
BEGIN CATCH
    SELECT ('The Inst_Is OR C_ID Not Found  , Can You Try Again') , ERROR_MESSAGE(), ERROR_LINE();   
END CATCH     

EXECUTE delete_Course_proc @c_id = 9, @c_name = 'Java' ,  @inst_id = 2     
 

--Create Stored Proc For[dbo].[Question]Table Do What After ..............
--First Add Question .................................................

CREATE OR ALTER PROC Add_New_Question_proc (@q_type NVARCHAR(20),@q_body NVARCHAR(200) ,@q_corr_answer NVARCHAR(10) ,
@q_ch1 NVARCHAR(20) , @q_ch2 NVARCHAR(20), @q_ch3 NVARCHAR(20), @q_ch4 NVARCHAR(20) , @cours_id INT)             --Add Constraint on course_id 

AS
BEGIN TRY 
    DECLARE @add_Question NVARCHAR(100)
    SET @add_Question = (SELECT COUNT(*) FROM [dbo].[Instructor])+1
    INSERT INTO [dbo].[Question]
    VALUES (@q_type , @q_body , @q_corr_answer , @q_ch1 ,@q_ch2 ,@q_ch3 , @q_ch4 ,@cours_id)
    SELECT CONCAT('Question Added Succesfully, Name is :' , @q_body, 'And Course_id is :' ,  @cours_id ) AS NewQuestion
	SELECT * FROM [dbo].[Question]
END TRY
BEGIN CATCH
    SELECT ('No Added , Try Again') , ERROR_MESSAGE(), ERROR_LINE();   
END CATCH 

EXECUTE Add_New_Question_proc @q_type = 'Multi' , @q_body = 'What is the capital of France?',
@q_corr_answer = 'A' , @q_ch1  = 'A-C', @q_ch2 = 'B-Paris' , @q_ch3 = 'C-Berlin' , @q_ch4 = 'D-London' , @cours_id = 8

--Scond Update Question .................................................
CREATE OR ALTER PROC update_Question_proc (@q_id INT , @q_type NVARCHAR(20),@q_body NVARCHAR(200) ,@q_corr_answer NVARCHAR(10) ,
@q_ch1 NVARCHAR(20) , @q_ch2 NVARCHAR(20), @q_ch3 NVARCHAR(20), @q_ch4 NVARCHAR(20) , @cours_id INT)

AS
BEGIN TRY 
    UPDATE [dbo].[Question]
    SET Q_Type = @q_type , Q_Body = @q_body , Q_Correct_Answer = @q_corr_answer ,
	Q_CH1 = @q_ch1 , Q_CH2 = @q_ch2 ,Q_CH3 = @q_ch3 ,Q_CH4 = @q_ch4 ,Cour_Id = @cours_id
	WHERE Q_ID = @q_id ;
    SELECT CONCAT('Question Update Succesfully, Name is :' , @q_body, 'And Course_id is :' ,  @cours_id ) AS NewQuestion
	SELECT * FROM [dbo].[Question]
END TRY
BEGIN CATCH
    SELECT ('No Update , Try Again') , ERROR_MESSAGE(), ERROR_LINE();   
END CATCH 

EXECUTE update_Question_proc @q_id = 80 , @q_type = 'T/F' , @q_body = 'The currency used in Switzerland is the Euro.',
@q_corr_answer = 'F' , @q_ch1  = NULL, @q_ch2 = NULL , @q_ch3 = NULL , @q_ch4 = NULL , @cours_id = 8

--Third delete Question .................................................

CREATE OR ALTER PROC delete_Question_proc (@q_id INT , @q_body NVARCHAR(100))

AS
BEGIN TRY 
    DELETE [dbo].[Question]
	WHERE Q_ID = @q_id ;    
    SELECT CONCAT('Question Deleted Succesfully, Name is :' , @q_body ) AS DeletedQuestion
	SELECT * FROM [dbo].[Question]
END TRY
BEGIN CATCH
    SELECT ('No Update , Try Again') , ERROR_MESSAGE(), ERROR_LINE();   
END CATCH  --Add Qi_Exam Hase Question

EXECUTE delete_Question_proc @q_id = 55 , @q_body = 'The Great Barrier Reef is located in the Pacific Ocean.'
SELECT * FROM [dbo].[Exam_Has_Question]