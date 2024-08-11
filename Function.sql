--Function Return Total Exam 

CREATE OR ALTER FUNCTION get_All_Kind_Exam (@Ex_Type NVARCHAR(20))
RETURNS NVARCHAR(20)
BEGIN 
   DECLARE @Exam NVARCHAR(20)
   SELECT @Exam = COUNT(*) FROM [Instructor].[Exam]
   WHERE EX_Type = @Ex_Type
   RETURN @Exam 
END 

SELECT dbo.get_All_Kind_Exam('Exam');

CREATE OR ALTER FUNCTION get_All_Exam()
RETURNS NVARCHAR(20)
BEGIN 
   DECLARE @Exam NVARCHAR(20)
   SELECT @Exam = COUNT(*) FROM [Instructor].[Exam]
   RETURN @Exam
END 

SELECT dbo.get_All_Exam()

--Create Function return all exam in every course 
CREATE OR ALTER FUNCTION get_AllExam_Kind_in_Cours (@cours_name NVARCHAR(20), @Ex_Type NVARCHAR(20))
RETURNS TABLE
AS 
RETURN 
(
  SELECT  c.C_Name , COUNT(ex.EX_Type) AS Count_Exam 
  FROM [Instructor].[Exam]ex , [dbo].[Course]c
  WHERE ex.Cour_Id = c.C_ID AND c.C_Name = @cours_name AND ex.EX_Type = @Ex_Type
  GROUP BY (c.C_Name) 
)

SELECT * FROM get_AllExam_Kind_in_Cours ('Java' , 'Corrective')
CREATE FUNCTION get_AllExam_in_Cours ()
RETURNS TABLE
AS 
RETURN 
(
  SELECT  c.C_Name , COUNT(EX_Type) AS Count_Exam 
  FROM [Instructor].[Exam]ex , [dbo].[Course]c
  WHERE ex.Cour_Id = c.C_ID
  GROUP BY (c.C_Name) 
)

SELECT * FROM  get_AllExam_in_Cours()


--Create Function Return Total Instructor 
CREATE OR ALTER FUNCTION calc_Instructor_byId(@ins_id INT)
RETURNS TABLE
AS 
RETURN 
(
  SELECT  i.INS_Name ,  COUNT(c.C_ID) AS All_Cources
  FROM [dbo].[Course]c , [dbo].[Instructor]i  
  WHERE c.Inst_Id = i.INS_ID AND i.INS_ID = @ins_id
  GROUP BY (i.INS_Name)
 
)

SELECT * FROM calc_Instructor_byId(5)


CREATE OR ALTER FUNCTION calc_All_Course_for_Instructor()
RETURNS TABLE
AS 
RETURN 
(
  SELECT  i.INS_Name ,  COUNT(c.C_ID) AS All_Cources
  FROM [dbo].[Course]c , [dbo].[Instructor]i  
  WHERE c.Inst_Id = i.INS_ID 
  GROUP BY (i.INS_Name)

)
SELECT * FROM calc_All_Course_for_Instructor()

--Create Function Return Total Course 

CREATE OR ALTER FUNCTION get_All_Course()
RETURNS NVARCHAR(20)
BEGIN
  DECLARE @name NVARCHAR(50)
  SELECT @name = COUNT(C_ID) FROM [dbo].[Course] AS Total_Course
  RETURN @name  
END

SELECT  dbo.get_All_Course()

--Create Function Return Total Student 

CREATE OR ALTER FUNCTION get_All_Student()
RETURNS NVARCHAR(20)
BEGIN
  DECLARE @name NVARCHAR(50)
  SELECT @name = COUNT(ST_ID) FROM [Training_Manager].[Student] AS Total_Student
  RETURN @name  
END

SELECT  dbo.get_All_Student()

---..............
--Create Funtion Return Total Question for every Course 
CREATE FUNCTION calc_All_Q_For_Course (@name NVARCHAR(50))
RETURNS TABLE 
AS 
RETURN 
( 
  SELECT c.C_Name , COUNT(q.Q_ID) AS Total_Question
  FROM [dbo].[Course]c , [dbo].[Question]q 
  WHERE c.C_ID = q.Cour_Id AND c.C_Name = @name 
  GROUP BY c.C_Name
)
SELECT * FROM dbo.get_All_Q_For_Course('Java')


CREATE FUNCTION calc_All_Q_by_Course ()
RETURNS TABLE 
AS 
RETURN 
( 
  SELECT c.C_Name , COUNT(q.Q_ID) AS Total_Question
  FROM [dbo].[Course]c , [dbo].[Question]q 
  WHERE c.C_ID = q.Cour_Id
  GROUP BY c.C_Name
)
SELECT * FROM calc_All_Q_by_Course()


--Create Function Return Total Correct Answer
CREATE FUNCTION get_All_Correct_Answer (@Student_id INT)
RETURNS TABLE 
AS
RETURN 
(
SELECT st.ST_Name , q.Q_Type , q.Q_Body , q.Q_Correct_Answer , s.Stu_Answer 
FROM [dbo].[Question]q INNER JOIN [dbo].[Exam_Has_Question]exh
ON q.Q_ID = exh.Question_ID
INNER JOIN [Student_Answer]s
ON exh.Question_ID = s.ExHasQ_Question_ID,
[Training_Manager].[Student]st
WHERE st.ST_ID = @Student_id AND st.ST_ID = s.StuPerEX_Student_ID

)
SELECT * FROM get_All_Correct_Answer(2)
