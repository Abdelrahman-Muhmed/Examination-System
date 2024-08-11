CREATE VIEW exam_view AS
SELECT Exam_ID,Exam_Degree,Allowance_Option,Normal_Exam,Corrective_Exam
FROM Exam;
go
SELECT *FROM exam_view