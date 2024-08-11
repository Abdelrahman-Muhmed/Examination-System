---============================================ proc $ view For Testing ========================

--Student
exec add_New_Student 7,'Sam', 23
select * from student_view

exec update_Student_Name 2,'Mahmoud Nagy'
select * from student_view

exec update_Student_Age 'Ayman Magdy',17
select * from student_view

exec delete_Student 7
select * from student_view

exec Enter_STD_ID_To_Display_Name_Age_CourseName 1

exec  Enter_STD_ID_To_Display_Branch_Track_Intake_Info 3

exec   Enter_STD_Name_Fro_Garde_and_Exam_Number 'nashed'


--instructor
exec add_New_Instructor 7,29,'Mostafa'
select * from instructo_view

exec Update_Instructor_Name 7,'Mostafaaa'
select * from instructo_view

exec Update_Instructor_Age 7,30 
select * from instructo_view

EXEC delete_Instructor
    @InstructorID = 7
select * from instructo_view


EXEC Enter_INST_ID_To_Display_Branch_Track_Intake_Info
    @Indtructor_ID = 1;

EXEC Enter_INST_ID_To_Display_Name_CourseName_Info
    @Insructor_ID = 5;


DECLARE @Instructor_ID INT = 6;
DECLARE @Student_ID INT = 5;
DECLARE @Exam_ID INT = 7;
EXEC Set_Student_To_Exam @Student_ID, @Instructor_ID, @Exam_ID;


--Course
exec add_New_Course 60, 20, 'python', 'used for web and artificial intelligence'
select * from Course_view

exec update_Course_Name 5, 'python';
select * from Course_view

exec update_Course_Description 7, 'ay7aga';
select * from Course_view


exec update_Course_min_Max_Degree 7,1,100;
select * from Course_view

exec delete_Course 7
select * from Course_view



--questions
exec add_New_Question 7, 30, N'Describe Database.', N'Collection of tables.', N'Is C# purly OOP?',
0, N'The first true object oriented language is: a) C++. b) SmallTalk. c) C#.', N'b', 1
select * from questions_view

Update_Question 7,'TextQuestions','What oop.','object .'     
select * from questions_view

delete_Question 7
select * from questions_view
