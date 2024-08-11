CREATE OR ALTER VIEW STD_Show_Questions_Exam (ExamID,[Text],[True_Or_False],[choose])
with encryption 
AS
(
SELECT e.Exam_ID,q.[Text_Questions],q.[True_or_False_Questions],q.[Choose_An_Answer_Question]
FROM Exam e
JOIN Questions_Consist_Exam qce ON e.Exam_ID = qce.Exam_ID
JOIN Questions q ON qce.Questions_ID = q.[Questions_ID]
)
GO

SELECT * FROM STD_Show_Questions_Exam where ExamID=1;