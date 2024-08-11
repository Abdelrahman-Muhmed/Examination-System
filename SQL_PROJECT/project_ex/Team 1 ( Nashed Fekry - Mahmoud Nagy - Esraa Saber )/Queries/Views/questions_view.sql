CREATE VIEW questions_view AS
SELECT Questions_ID,Degree,[Text_Questions],[Correct_Answer_Text_Questions],[True_or_False_Questions],[Correct_Answer_True_or_False],[Choose_An_Answer_Question],[Correct_Answer_Choose_Question],[Course_Id]
FROM Questions;
go
SELECT *FROM questions_view
