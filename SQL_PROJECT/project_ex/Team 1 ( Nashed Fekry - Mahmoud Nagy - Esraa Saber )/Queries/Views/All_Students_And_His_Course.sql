create view All_Students_And_His_Course 
as
   select s.Std_ID,s.Std_Name,s.Std_Age,c.Name  from Students s inner join Student_Intake si
               on s.Std_ID=si.Std_ID
			   inner join Intake i
			   on i.Intake_ID=si.Intake_ID
			   inner join Course_Intake ci
			   on i.Intake_ID=ci.Intake_ID
			   inner join Course c
			   on c.Course_ID=ci.Course_ID

select * from All_Students_And_His_Course 