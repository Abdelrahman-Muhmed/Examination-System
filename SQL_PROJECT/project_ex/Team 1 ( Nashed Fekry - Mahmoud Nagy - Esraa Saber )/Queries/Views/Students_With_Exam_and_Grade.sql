----------------------------------------------------
-- StudentsGradesView For Each Exam
CREATE OR ALTER VIEW Students_With_Exam_and_Grade
WITH ENCRYPTION
AS
(
    SELECT S.[Std_Name] AS StudentName ,STE.[Exam_ID] AS ExamID, SUM(STE.[Questions_result]) AS Grade
    FROM Students AS S
     JOIN Students_take_Exam AS STE ON S.Std_ID = STE.Std_ID
    GROUP BY S.[Std_Name], STE.[Exam_ID]
)
GO
--TEST
SELECT * FROM Students_With_Exam_and_Grade


