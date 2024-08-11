----------------------------------------
-- Insert & Update & Delete Question

   --Add Question
create proc add_New_Question (   @QuesionID int,@Degree int,
								 @text_Question nvarchar(max),
								 @correct_Answer_Text_Q nvarchar(max),
								 @True_OR_False_Q nvarchar(max),
								 @Correct_Answer_True_OR_False_Q nvarchar(max),
								 @choose_Answer_Q nvarchar(max),
								 @correct_Answer_choose_Q nvarchar(max),
								 @Course_ID int)
as 
begin
	begin try
		insert into Questions values (  @QuesionID ,@Degree ,
										@text_Question,
										@correct_Answer_Text_Q ,
										@True_OR_False_Q ,
										@Correct_Answer_True_OR_False_Q ,
										@choose_Answer_Q ,
										@correct_Answer_choose_Q ,
										@Course_ID )
	end try
	begin catch
		select  ERROR_MESSAGE()
	end catch
end

exec add_New_Question 7, 30, N'Describe Database.', N'Collection of tables.', N'Is C# purly OOP?',
0, N'The first true object oriented language is: a) C++. b) SmallTalk. c) C#.', N'b', 1

select * from Questions



 --- update Question
 create proc Update_Question (@id int ,@QType nvarchar(max),@Qcontent nvarchar(max),@Q_CorrectAnswer nvarchar(max))
 as 
   begin
       begin try
         if(@Qtype='TextQuestions')
		 begin
		   update Questions
		   set [Text_Questions]=@Qcontent,[Correct_Answer_Text_Questions]=@Q_CorrectAnswer
		   where Questions_ID=@id
		   end
		   else if(@Qtype='TrueOrFalse')
		       begin
			    update Questions
		   set [True_or_False_Questions]=@Qcontent,[Correct_Answer_True_or_False]=@Q_CorrectAnswer
		   where Questions_ID=@id
			   end
		else
		       begin
			    update Questions
		   set [Choose_An_Answer_Question]=@Qcontent,[Correct_Answer_Choose_Question]=@Q_CorrectAnswer
		   where Questions_ID=@id
			   end
			   end try
			   begin catch
			    select  ERROR_MESSAGE()
			   end catch
END

Update_Question 7,'TextQuestions','What oop.','object .'     
select * from Questions


	 create proc delete_Question @id int
	  as 
	    begin

		begin try
		delete from Questions
		where Questions_ID=@id
		end try
		begin catch
		select  ERROR_MESSAGE()
		end catch
		end

delete_Question 7
select* from Questions