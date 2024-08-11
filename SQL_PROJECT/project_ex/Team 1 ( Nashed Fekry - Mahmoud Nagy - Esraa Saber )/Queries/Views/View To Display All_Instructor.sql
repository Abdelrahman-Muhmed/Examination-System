-----------------------------------------------------
--To View Instructor's information
-----------------------------------------------------

Create  View All_Instructor as
select [Instructor].Ins_ID,Age,[Inst_Name],[Mgr_ID]
from [dbo].[Instructor] join [dbo].[Instructor_Choose_Questions]
on  [Instructor].[Ins_ID] = [Instructor_Choose_Questions].[Instructor_ID]
join
[dbo].[Questions]
on [dbo].[Questions].[Questions_ID] = [dbo].[Instructor_Choose_Questions].[Questions_ID]
join
[dbo].[Instructor_Teach_Course]
on [dbo].[Instructor_Teach_Course].[Inst_ID] = [dbo].[Instructor].[Ins_ID]
join
[dbo].[Instructor_Sets_Exam]
on [dbo].[Instructor_Sets_Exam].[Inst_ID] = [dbo].[Instructor].[Ins_ID]

select * from All_Instructor




