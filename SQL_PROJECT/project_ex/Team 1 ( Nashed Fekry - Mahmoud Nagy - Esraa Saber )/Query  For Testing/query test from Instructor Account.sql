--=====================instructor Account Test=================

--set exam
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


--===========================instructor select student to exam =================
DECLARE @Instructor_ID INT = 1;
DECLARE @Student_ID INT = 1;
DECLARE @Exam_ID INT =13;
EXEC Set_Student_To_Exam @Student_ID, @Instructor_ID, @Exam_ID;


--===========================Show exam Questions=================
SELECT * FROM STD_Show_Questions_Exam where ExamID=13;

--======================== next step student Answer the exam ==================
--======================== student Account ==================

--======================== Correcting the exam ==================
--std_id , exam_id 
EXEC CorrectExamForStudent 1, 13