CREATE VIEW Course_view AS
SELECT Course_ID,Min_Degree,Max_Degree,Name,Description
FROM Course;
go
SELECT *FROM Course_view