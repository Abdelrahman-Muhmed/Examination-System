

--login for Manger
create login Manger
with password ='123';

create user Manger
for login Manger

----premisoion
--proc
grant execute on object ::[dbo].[add_New_Student]to Manger --done
grant execute on object ::[dbo].[update_Student_Name] to Manger--done
grant execute on object ::[dbo].[update_Student_Age] to Manger--done
grant execute on object ::[dbo].[add_New_Branch]to Manger --done
grant execute on object ::[dbo].[Branch_Action_Update_Or_Delete] to Manger --done
grant execute on object ::[dbo].[add_New_track]to Manger --done
grant execute on object ::[dbo].[upadte_track_Name]to Manger --done
grant execute on object ::[dbo].[delete_track]to Manger --done
grant execute on object ::[dbo].[add_New_Intake]to Manger --done
grant execute on object ::[dbo].[Intake_Action_Update_Or_Delete]to Manger --done
grant execute on object ::[dbo].[add_New_Instructor]to Manger --done
grant execute on object :: [dbo].[Update_Instructor_Name]to Manger--done
grant execute on object :: [dbo].[Update_Instructor_Age]to Manger--done
grant execute on object ::[dbo].[delete_Instructor]to Manger --done
grant execute on object :: [dbo].[add_New_Course] to Manger--done
grant execute on object :: [dbo].[update_Course_Name]  to Manger--done
grant execute on object :: [dbo].[update_Course_Description]  to Manger--done
grant execute on object :: [dbo].[update_Course_min_Max_Degree]  to Manger--done
grant execute on object :: [dbo].[delete_Course] to Manger--done
grant execute on object :: [dbo].[add_New_Question]to Manger--done
grant execute on object :: [dbo].[Update_Question]to Manger--done
grant execute on object :: [dbo].[delete_Question]to Manger--done
grant execute on object ::[dbo].[Enter_INST_ID_To_Display_Branch_Track_Intake_Info]to Manger--done
grant execute on object ::[dbo].[Enter_INST_ID_To_Display_Name_CourseName_Info]to Manger--done




--view
grant select on object :: [dbo].[All_Branch_Tarck_Intake] to Manger 
grant select on object :: [dbo].[All_Instructor] to Manger
grant select on object :: [dbo].[All_Student] to Manger
grant select on object :: [dbo].[All_Students_And_His_Course] to Manger
grant select on object :: [dbo].[Students_With_Exam_and_Grade]to Manger
grant select on object :: [dbo].[branch_view] to Manger
grant select on object :: [dbo].[Course_view] to Manger
grant select on object :: [dbo].[exam_view] to Manger
grant select on object :: [dbo].[instructo_view] to Manger
grant select on object :: [dbo].[Intake_view] to Manger
grant select on object :: [dbo].[questions_view] to Manger
grant select on object :: [dbo].[student_view] to Manger
grant select on object :: [dbo].[Students_take_Exam_view] to Manger
grant select on object :: [dbo].[track_view] to Manger




--==================================================================================
--==================================================================================
--login for instructor
create login Instructor
with password ='123';

create user Instructor
for login Instructor

---premision
--Proc
grant execute on object :: [dbo].[GenerateRandomExam] to Instructor--done
grant execute on object :: [dbo].[Set_Student_To_Exam]to Instructor--done
grant execute on object :: [dbo].[CorrectExamForStudent] to Instructor--done
grant execute on object :: [dbo].[add_New_Course] to Instructor--done
grant execute on object :: [dbo].[update_Course_Name]  to Instructor--done
grant execute on object :: [dbo].[update_Course_Description]  to Instructor--done
grant execute on object :: [dbo].[update_Course_min_Max_Degree]  to Instructor--done
grant execute on object :: [dbo].[delete_Course] to Instructor--done
grant execute on object :: [dbo].[Update_Instructor_Name]to Instructor--done
grant execute on object :: [dbo].[Update_Instructor_Age]to Instructor--done
grant execute on object :: [dbo].[add_New_Question]to Instructor--done
grant execute on object :: [dbo].[Update_Question]to Instructor--done
grant execute on object :: [dbo].[delete_Question]to Instructor--done
grant execute on object ::[dbo].[Enter_INST_ID_To_Display_Branch_Track_Intake_Info]to Instructor--done
grant execute on object ::[dbo].[Enter_INST_ID_To_Display_Name_CourseName_Info]to Instructor--done

--view
grant select on object :: [dbo].[All_Branch_Tarck_Intake] to Instructor 
grant select on object :: [dbo].[All_Instructor] to Instructor
grant select on object :: [dbo].[All_Student] to Instructor
grant select on object :: [dbo].[All_Students_And_His_Course] to Instructor
grant select on object :: [dbo].[Students_With_Exam_and_Grade]to Instructor
grant select on object :: [dbo].[STD_Show_Questions_Exam] to Instructor
grant select on object :: [dbo].[Students_With_Exam_and_Grade] to Instructor
grant select on object :: [dbo].[Course_view] to Instructor
grant select on object :: [dbo].[exam_view] to Instructor
grant select on object :: [dbo].[instructo_view] to Instructor
grant select on object :: [dbo].[questions_view] to Instructor
grant select on object :: [dbo].[student_view] to Instructor
grant select on object :: [dbo].[Students_take_Exam_view] to Instructor


--view
--grant  select  on object :: [dbo].[Instructor_Info] to Instructor



--==================================================================================
--==================================================================================
--login for Student
create login Student
with password ='123';

create user student
for login student

--- permision 
--Proc
grant execute on object :: [dbo].[StudentAnswerExamQuestion]to student--done
grant execute on object ::[dbo].[Enter_STD_ID_To_Display_Branch_Track_Intake_Info] to student--done
grant execute on object ::[dbo].[Enter_STD_ID_To_Display_Name_Age_CourseName] to student--done
grant execute on object ::[dbo].[Enter_STD_Name_Fro_Garde_and_Exam_Number] to student--done

grant execute on object ::[dbo].[update_Student_Name] to student--done
grant execute on object ::[dbo].[update_Student_Age] to student--done

grant select on object :: [dbo].[All_Branch_Tarck_Intake] to student 
grant select on object :: [dbo].[All_Instructor] to student
grant select on object :: [dbo].[All_Student] to student
grant select on object :: [dbo].[All_Students_And_His_Course] to student
grant select on object :: [dbo].[Students_With_Exam_and_Grade]to student
grant select on object :: [dbo].[STD_Show_Questions_Exam] to student
grant select on object :: [dbo].[Students_With_Exam_and_Grade] to student
grant select on object :: [dbo].[STD_Show_Questions_Exam] to student
grant select on object :: [dbo].[student_view] to student
grant select on object :: [dbo].[Students_take_Exam_view] to student








