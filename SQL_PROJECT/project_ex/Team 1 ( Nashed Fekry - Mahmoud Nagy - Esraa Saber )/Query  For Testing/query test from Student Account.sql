--=====================Student Account Test=================
--==Set exam from instructor Account

-- StudentAnswerExamQuestion exam_id, std_id , q_id , text_q_answer, choose_q_answer , tf_q_answer 
EXEC StudentAnswerExamQuestion 13, 1, 1, 'ay7aga', 'f', 0 
EXEC StudentAnswerExamQuestion 13, 1, 2, 'Unique key and not null constraint.', 'b', 1 

select * from [dbo].[Students_take_Exam_view]

--===================Correcting from instructor Account ==============

--===================Display my grade ==============
exec Enter_STD_Name_Fro_Garde_and_Exam_Number 'Ahmed Gamal'