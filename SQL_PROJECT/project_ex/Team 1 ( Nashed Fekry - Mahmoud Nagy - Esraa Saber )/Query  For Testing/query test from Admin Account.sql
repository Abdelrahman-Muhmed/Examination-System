
--============================================= add new student ========================================================
select * from student_view;

--add new student
exec add_New_Student 14,Samir,21



--============================================= set exam ==============================================================
--Testing constraint Instructor does not teach course
EXEC GenerateRandomExam @crs_id = 1, @ins_id = 2,
@exam_degree = 60, @is_normal_exam = 1,
@is_corrective_exam = 0, 
@start_time = '10:00:00', @end_time = '12:00:00'; --error

--Testing constraint Exam degree not multiple of 30
EXEC GenerateRandomExam @crs_id = 1, @ins_id = 1,
@exam_degree = 25, @is_normal_exam = 1,
@is_corrective_exam = 0, 
@start_time = '10:00:00', @end_time = '12:00:00';--error

--Testing that it is working
EXEC GenerateRandomExam @crs_id = 1, @ins_id = 1,
@exam_degree = 60, @is_normal_exam = 1,
@is_corrective_exam = 0, 
@start_time = '10:00:00', @end_time = '22:00:00';

SELECT *FROM exam_view

--============================================= instructor select student to exam ======================================
DECLARE @Instructor_ID INT = 1;
DECLARE @Student_ID INT = 1;
DECLARE @Exam_ID INT =13;
EXEC Set_Student_To_Exam @Student_ID, @Instructor_ID, @Exam_ID;

--============================================= Show exam Questions ==========================================================
SELECT * FROM STD_Show_Questions_Exam where ExamID=13;

--============================================= Student Answer Exam Question ================================================
-- StudentAnswerExamQuestion exam_id, std_id , q_id , text_q_answer, choose_q_answer , tf_q_answer 
EXEC StudentAnswerExamQuestion 13, 1, 1, 'ay7aga', 'f', 0 
EXEC StudentAnswerExamQuestion 13, 1, 2, 'Unique key and not null constraint.', 'b', 1 

select * from [dbo].[Students_take_Exam_view]

--============================================= Correcting the exam ================================================
--std_id , exam_id 
EXEC CorrectExamForStudent 1, 13

--display reuslt Questions
select * from [dbo].[Students_take_Exam_view]

--============================================= Display my grade ================================================
exec Enter_STD_Name_Fro_Garde_and_Exam_Number 'Ahmed Gamal'