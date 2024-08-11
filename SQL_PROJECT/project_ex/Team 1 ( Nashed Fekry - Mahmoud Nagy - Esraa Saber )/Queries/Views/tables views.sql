--=============table views=========================
CREATE VIEW branch_view AS
SELECT Branch_ID,Branch_Name
FROM branch;
go
SELECT *FROM branch_view

go
CREATE VIEW track_view AS
SELECT Track_ID,Track_Name
FROM Track;
go
SELECT *FROM track_view.

go
CREATE VIEW Intake_view AS
SELECT Intake_ID,Intake_Name
FROM Intake;
go
SELECT *FROM Intake_view


go
CREATE VIEW student_view AS
SELECT Std_ID,Std_Name,Std_Age
FROM Students;
go
SELECT *FROM student_view

go
CREATE VIEW instructo_view AS
SELECT Ins_ID,Inst_Name,Age
FROM Instructor;
go
SELECT *FROM instructo_view

go
CREATE VIEW questions_view AS
SELECT Questions_ID,Degree,[Text_Questions],[Correct_Answer_Text_Questions],[True_or_False_Questions],[Correct_Answer_True_or_False],[Choose_An_Answer_Question],[Correct_Answer_Choose_Question],[Course_Id]
FROM Questions;
go
SELECT *FROM questions_view

go
CREATE VIEW exam_view AS
SELECT Exam_ID,Exam_Degree,Allowance_Option,Normal_Exam,Corrective_Exam
FROM Exam;
go
SELECT *FROM exam_view

go
CREATE VIEW Course_view AS
SELECT Course_ID,Min_Degree,Max_Degree,Name,Description
FROM Course;
go
SELECT *FROM Course_view


go
SELECT *FROM Course_view

go
CREATE VIEW Students_take_Exam_view AS
SELECT Std_ID,Exam_ID,Questions_result,Std_Answer_Text_Question,Std_Answer_Choose_Question,Std_Answer_True_or_False,Questions_Id
FROM Students_take_Exam;
go
SELECT *FROM Students_take_Exam_view

