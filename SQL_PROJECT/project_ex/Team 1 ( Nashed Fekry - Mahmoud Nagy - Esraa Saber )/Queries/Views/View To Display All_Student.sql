create or alter view All_Student
as
   select  S.Std_ID,S.Std_Name,B.Branch_Name,t.Track_Name,intk.Intake_Name  from Students S inner join Student_Branch SB
   on S.Std_ID=SB.Std_ID 
   inner join Branch B
   on B.Branch_ID=SB.Branch_ID
   inner join Course_Branch CB
   on B.Branch_ID=CB.Branch_ID
   inner join Course c
   on c.Course_ID=CB.Course_ID
   inner join Course_Track CT
   on c.Course_ID=CT.Track_ID
   inner join Track t
   on t.Track_ID=CT.Track_ID
   inner join Student_Intake ST
   on S.Std_ID=ST.Std_ID
   inner join Intake  intk
   on intk.Intake_ID=ST.Intake_ID


select * from All_Student
   