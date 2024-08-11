

create or alter proc Enter_STD_ID_To_Display_Branch_Track_Intake_Info (@id int)
as
select * from [dbo].[All_Student]
where [Std_ID]=@id

go

exec  Enter_STD_ID_To_Display_Branch_Track_Intake_Info 3

go
---
select * from[dbo].[StudentsGradesViewForEachExam]


create or alter proc Enter_STD_Name_Fro_Garde_and_Exam_Number (@name nvarchar(max))
as
select * from [dbo].[Students_With_Exam_and_Grade]
where StudentName = @name;

exec   Enter_STD_Name_Fro_Garde_and_Exam_Number 'nashed'

go
---
create or alter proc Enter_STD_ID_To_Display_Name_Age_CourseName (@id int)
as
select * from [dbo].[All_Students_And_His_Course]
where [Std_ID]=@id


exec Enter_STD_ID_To_Display_Name_Age_CourseName 1