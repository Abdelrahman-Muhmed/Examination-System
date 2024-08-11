USE [T4_Examination_System]
GO
/****** Object:  Schema [Instructor]    Script Date: 1/14/2024 12:03:59 PM ******/
CREATE SCHEMA [Instructor]
GO
/****** Object:  Schema [Student]    Script Date: 1/14/2024 12:03:59 PM ******/
CREATE SCHEMA [Student]
GO
/****** Object:  Schema [Training_Manager]    Script Date: 1/14/2024 12:03:59 PM ******/
CREATE SCHEMA [Training_Manager]
GO
/****** Object:  Table [Training_Manager].[Student]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Training_Manager].[Student](
	[ST_ID] [int] IDENTITY(1,1) NOT NULL,
	[ST_Name] [nvarchar](30) NOT NULL,
	[ST_Age] [int] NOT NULL,
	[ST_Address] [nvarchar](50) NULL,
	[ST_Personal_Data] [nvarchar](50) NULL,
	[ST_UserName] [nvarchar](30) NULL,
	[ST_TCK_id] [int] NULL,
	[ST_TR_id] [int] NULL,
	[ST_IN_id] [int] NULL,
	[ST_BR_id] [int] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[ST_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Student_FG]
) ON [Student_FG]
GO
/****** Object:  Table [Student].[Student_Takes_Course]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Student].[Student_Takes_Course](
	[St_ID] [int] NOT NULL,
	[Cour_ID] [int] NOT NULL,
 CONSTRAINT [PK_StudentTakesCourse] PRIMARY KEY CLUSTERED 
(
	[St_ID] ASC,
	[Cour_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Student_FG]
) ON [Student_FG]
GO
/****** Object:  Table [Training_Manager].[Track]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Training_Manager].[Track](
	[TCK_ID] [int] IDENTITY(1,1) NOT NULL,
	[TCK_Name] [nvarchar](30) NOT NULL,
	[TR_id] [int] NULL,
	[DEP_id] [int] NULL,
 CONSTRAINT [PK_Track] PRIMARY KEY CLUSTERED 
(
	[TCK_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [HR_FG]
) ON [HR_FG]
GO
/****** Object:  Table [Training_Manager].[Branch]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Training_Manager].[Branch](
	[BR_ID] [int] IDENTITY(1,1) NOT NULL,
	[BR_Name] [nvarchar](30) NOT NULL,
	[TR_id] [int] NULL,
 CONSTRAINT [Pk_Branch] PRIMARY KEY CLUSTERED 
(
	[BR_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [HR_FG]
) ON [HR_FG]
GO
/****** Object:  Table [Training_Manager].[Intake]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Training_Manager].[Intake](
	[INT_ID] [int] IDENTITY(1,1) NOT NULL,
	[INT_Name] [nvarchar](30) NOT NULL,
	[TR_id] [int] NULL,
 CONSTRAINT [PK_Intake] PRIMARY KEY CLUSTERED 
(
	[INT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [HR_FG]
) ON [HR_FG]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[C_ID] [int] IDENTITY(1,1) NOT NULL,
	[C_Name] [nvarchar](20) NOT NULL,
	[C_Description] [nvarchar](100) NULL,
	[C_Min_Degree] [float] NOT NULL,
	[C_Max_Degree] [float] NOT NULL,
	[Inst_Id] [int] NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[C_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [HR_FG]
) ON [HR_FG]
GO
/****** Object:  View [dbo].[Show_Student_All_Data_View]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   view [dbo].[Show_Student_All_Data_View]
as
(
	select s.[ST_ID] 'Your ID',s.[ST_Name] 'Name' , s.[ST_Age] 'Age' ,s.[ST_Address] 'Address',s.[ST_Personal_Data] 'Pesonal Data',s.[ST_UserName] 'User Name' , c.[C_Name] 'Course'
			,[TCK_Name]'Track', [INT_Name] 'Intake',[BR_Name] 'Branch'
	from [Training_Manager].[Student] s ,[Student].[Student_Takes_Course]t, [dbo].[Course] c ,
		[Training_Manager].[Branch],[Training_Manager].[Intake],[Training_Manager].[Track] 
	where s.[ST_ID]=t.[St_ID] and [Cour_ID]= c.[C_ID] and s.[ST_TCK_id]=[TCK_ID] and s.[ST_IN_id]=[INT_ID]
			and s.[ST_BR_id]=[BR_ID]  and s.ST_UserName=cast (SUSER_NAME() as nvarchar(50))
)
GO
/****** Object:  View [dbo].[Get_Student_Data_VIEW]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   view [dbo].[Get_Student_Data_VIEW]
AS
	select s.ST_ID as 'Student Id' , s.ST_UserName as 'User Name ' , s.ST_Name'Student Name ', s.ST_Age as 'Age' ,B.BR_Name as 'Branch Name', s.ST_Personal_Data As 'Personal Data'
	from [Training_Manager].[Student]s , [Training_Manager].[Branch] B 
	where s.ST_BR_id = b.BR_ID
GO
/****** Object:  Table [Instructor].[Exam]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Instructor].[Exam](
	[EX_ID] [int] IDENTITY(1,1) NOT NULL,
	[EX_Type] [nvarchar](20) NOT NULL,
	[EX_Start_Time] [time](7) NOT NULL,
	[EX_End_Time] [time](7) NOT NULL,
	[EX_total_Time]  AS (datediff(minute,CONVERT([time],'00:00'),[EX_End_Time])-datediff(minute,CONVERT([time],'00:00'),[EX_Start_Time])),
	[EX_Year] [int] NULL,
	[EX_Multi_Q_Num] [int] NOT NULL,
	[EX_Multi_Q_Degree] [float] NOT NULL,
	[EX_T_F_Q_Num] [int] NOT NULL,
	[EX_T_F_Q_Degree] [float] NOT NULL,
	[EX_Allowance_Options] [bit] NOT NULL,
	[Cour_Id] [int] NULL,
	[Inst_Id] [int] NULL,
	[Tck_Id] [int] NULL,
	[Br_Id] [int] NULL,
	[Intake_Id] [int] NULL,
 CONSTRAINT [PK_Exam] PRIMARY KEY CLUSTERED 
(
	[EX_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [ExamAndQuestion_FG]
) ON [ExamAndQuestion_FG]
GO
/****** Object:  Table [Instructor].[Chosen_Student]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Instructor].[Chosen_Student](
	[CH_ST_ID] [int] NOT NULL,
	[CH_ST_EX_id] [int] NOT NULL,
	[EX_Date] [date] NOT NULL,
	[Chosen?] [bit] NOT NULL,
	[INS_id] [int] NULL,
 CONSTRAINT [PK_ChosenStudent] PRIMARY KEY CLUSTERED 
(
	[CH_ST_ID] ASC,
	[CH_ST_EX_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Student_FG]
) ON [Student_FG]
GO
/****** Object:  View [dbo].[Show_All_Chosen_Student_VIEW]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   view [dbo].[Show_All_Chosen_Student_VIEW]
AS
	select s.ST_Name as 'Name' ,E.EX_Type as 'Exam type' ,CH.EX_Date 'Date of Exam',C.C_Name as 'Course Name'
		from [Instructor].[Chosen_Student] CH ,
		[Instructor].[Exam] E ,
		[dbo].[Course] C ,
		[Training_Manager].[Student] S
	where ch.CH_ST_ID = s.ST_ID and ch.CH_ST_EX_id = E.EX_ID and e.Cour_Id = c.C_ID
GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[INS_ID] [int] IDENTITY(1,1) NOT NULL,
	[INS_Name] [nvarchar](20) NOT NULL,
	[INS_Age] [int] NULL,
	[INS_Address] [nvarchar](20) NULL,
	[INS_PersonalData] [nvarchar](30) NULL,
	[INS_UserName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED 
(
	[INS_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [HR_FG]
) ON [HR_FG]
GO
/****** Object:  View [dbo].[show_Instractor_Data_View]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   view [dbo].[show_Instractor_Data_View]
As
	Select I.INS_ID as 'ID',  I.INS_Name as 'Name' , I.INS_UserName as 'User NAme' ,I.INS_Age as 'Age' ,I.INS_Address as 'Address' , I.INS_PersonalData AS 'Personal Data' 
	From Instructor I
	where I.INS_UserName = cast (SUSER_NAME() as nvarchar(50));
GO
/****** Object:  View [dbo].[Show_All_StudentName_With_CorseNAme]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[Show_All_StudentName_With_CorseNAme]
AS
select S.ST_Name As 'Student Name' , C.C_Name As 'Course Name'
from [Training_Manager].[Student] S ,
[dbo].[Course] C,
[Student].[Student_Takes_Course] STC
Where S.ST_ID = STC.St_ID And STC.Cour_ID = c.C_ID;
GO
/****** Object:  View [dbo].[Show_Course_Data_For_Instractoer_View]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   View [dbo].[Show_Course_Data_For_Instractoer_View]
AS
	Select I.INS_Name As 'Instractor Name',C.C_Name As 'Course Name'
	from [dbo].[Instructor] I ,[dbo].[Course] C
	where  c.Inst_Id=i.INS_ID  and cast (SUSER_NAME() as nvarchar(50)) = i.INS_UserName
GO
/****** Object:  Table [dbo].[Question]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[Q_ID] [int] IDENTITY(1,1) NOT NULL,
	[Q_Type] [nvarchar](20) NOT NULL,
	[Q_Body] [nvarchar](200) NOT NULL,
	[Q_Correct_Answer] [nvarchar](10) NOT NULL,
	[Q_CH1] [nvarchar](200) NULL,
	[Q_CH2] [nvarchar](200) NULL,
	[Q_CH3] [nvarchar](200) NULL,
	[Q_CH4] [nvarchar](200) NULL,
	[Cour_Id] [int] NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[Q_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [ExamAndQuestion_FG]
) ON [ExamAndQuestion_FG]
GO
/****** Object:  Table [dbo].[Exam_Has_Question]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam_Has_Question](
	[Exam_ID] [int] NOT NULL,
	[Question_ID] [int] NOT NULL,
 CONSTRAINT [PK_Exam_Has_Question_ID] PRIMARY KEY CLUSTERED 
(
	[Exam_ID] ASC,
	[Question_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [ExamAndQuestion_FG]
) ON [ExamAndQuestion_FG]
GO
/****** Object:  View [dbo].[show_All_inst_Qustion_View]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create   View [dbo].[show_All_inst_Qustion_View]
As
	Select  e.EX_ID'Exam ID', c.C_Name 'Course', Q.Q_Body as 'Qustion body' ,Q.Q_CH1 as 'A' ,
	Q.Q_CH2 As 'B' , Q.Q_CH3 as 'C' ,
	Q.Q_CH4 as' d',Q.Q_Correct_Answer as 'Correct Answer'
	From [dbo].[Instructor] I ,
	[dbo].[Question] Q ,
	[dbo].[Course] c,
	[dbo].[Exam_Has_Question] h,
	[Instructor].[Exam] e
	where q.Q_ID=h.Question_ID and e.EX_ID=h.Exam_ID and   c.C_ID = q.Cour_Id and e.Inst_Id=i.INS_ID and  cast (SUSER_NAME() as nvarchar(50))= i.INS_UserName
GO
/****** Object:  View [dbo].[Instractor_Exams_View]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   View [dbo].[Instractor_Exams_View]
As
	select E.EX_ID as 'Exam Id' ,
	c.C_Name as 'Course Name' ,e.EX_Start_Time as 'Exam Start Time' ,
	e.EX_End_Time 'Exam End Time' ,E.EX_Year as 'Exam Year'  ,e.EX_Type as 'Exam Type',b.BR_Name as 'Branch Name' 
	From [dbo].[Instructor]I,[Instructor].[Exam]E ,
	[Training_Manager].[Branch]B ,[dbo].[Course] c
	Where   E.Br_Id = b.BR_ID and e.Inst_Id=i.INS_ID and e.Cour_Id=c.C_ID   and cast (SUSER_NAME() as nvarchar(50)) = i.INS_UserName;
GO
/****** Object:  View [dbo].[All_Instractor_Data_View]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create    View [dbo].[All_Instractor_Data_View]
As
	Select I.INS_ID as 'Instractor ID',
	I.INS_Name as 'Name' , I.INS_Age as'Age' ,
	I.INS_Address as 'Address' ,I.INS_UserName 'User Name'
	from [dbo].[Instructor] I
GO
/****** Object:  View [dbo].[All_Courses_View]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   View [dbo].[All_Courses_View]
As
Select C.C_ID As 'Course Id',i.INS_Name as 'Instractor Degree' ,
c.C_Description as 'Course Description' , 
C.C_Max_Degree as 'Max Degree' , C.C_Min_Degree as 'Min Degree'
from [dbo].[Course]C ,[dbo].[Instructor] i
where i.INS_ID=c.Inst_Id
GO
/****** Object:  Table [dbo].[Traning_Manager]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Traning_Manager](
	[TR_ID] [int] IDENTITY(1,1) NOT NULL,
	[TR_Name] [nvarchar](30) NOT NULL,
	[TR_UserName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Traning_Manager] PRIMARY KEY CLUSTERED 
(
	[TR_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [HR_FG]
) ON [HR_FG]
GO
/****** Object:  View [dbo].[All_Tracks_View]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   View  [dbo].[All_Tracks_View]
as 
Select t.TR_id as 'Track ID' , T.TCK_Name as 'Track Name' , tm.TR_Name 'Training Manager'
from [Training_Manager].[Track] t, [dbo].[Traning_Manager] tm
where tm.TR_ID= t.TR_id
GO
/****** Object:  View [dbo].[All_Intake_View]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   View [dbo].[All_Intake_View]
as
Select ta.INT_ID as 'Intake ID' ,ta.INT_Name 'Intake Name '
from [Training_Manager].[Intake] ta
GO
/****** Object:  Table [Training_Manager].[Department]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Training_Manager].[Department](
	[DEP_ID] [int] IDENTITY(1,1) NOT NULL,
	[DEP_Name] [nvarchar](30) NOT NULL,
	[TR_id] [int] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DEP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [HR_FG]
) ON [HR_FG]
GO
/****** Object:  View [dbo].[All_Department_View]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------
Create   View [dbo].[All_Department_View]
As 
Select d.DEP_ID as 'Department Id' ,d.DEP_Name as 'DepartMent Name ' ,tr.TR_Name as 'Traning Manger Name'
from [Training_Manager].[Department] d ,[dbo].[Traning_Manager]tr
where tr.TR_ID = d.TR_id
GO
/****** Object:  Table [Student].[Student_Perform_Exam]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Student].[Student_Perform_Exam](
	[Student_ID] [int] NOT NULL,
	[Exam_ID] [int] NOT NULL,
	[Total_Result] [float] NULL,
 CONSTRAINT [PK_Student_Perform_Exam] PRIMARY KEY CLUSTERED 
(
	[Student_ID] ASC,
	[Exam_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Student_FG]
) ON [Student_FG]
GO
/****** Object:  View [dbo].[Show_All_Student_ExamsGrade_View]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   view [dbo].[Show_All_Student_ExamsGrade_View]
as
(
	select s.ST_ID 'Student Id', s.ST_Name 'Name',  e.EX_Type 'Exam Type' , ch.EX_Date 'Exam date', c.C_Name 'Course',p.Total_Result 'Your Exam Final Grade '
	from  [Instructor].[Exam] e,[Student].[Student_Perform_Exam] p,[Training_Manager].[Student] s, [dbo].[Course] c  , [Instructor].[Chosen_Student] ch 
	where e.EX_ID=p.Exam_ID and p.Student_ID=s.ST_ID and  c.C_ID=e.Cour_Id  and ch.CH_ST_EX_id=p.Exam_ID and ch.CH_ST_ID=p.Student_ID
)
GO
/****** Object:  Table [dbo].[Student_Answer]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Answer](
	[StuPerEX_Student_ID] [int] NOT NULL,
	[Stu_Q_Exam_ID] [int] NOT NULL,
	[ExHasQ_Question_ID] [int] NOT NULL,
	[Stu_Answer] [nvarchar](10) NOT NULL,
	[Stu_Check_Correct] [bit] NULL,
 CONSTRAINT [PK_Student_Answer_ID] PRIMARY KEY CLUSTERED 
(
	[StuPerEX_Student_ID] ASC,
	[Stu_Q_Exam_ID] ASC,
	[ExHasQ_Question_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [ExamAndQuestion_FG]
) ON [ExamAndQuestion_FG]
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([C_ID], [C_Name], [C_Description], [C_Min_Degree], [C_Max_Degree], [Inst_Id]) VALUES (7, N'Computer Science', N'Fundamental concepts of computer science.', 70, 100, 4)
INSERT [dbo].[Course] ([C_ID], [C_Name], [C_Description], [C_Min_Degree], [C_Max_Degree], [Inst_Id]) VALUES (8, N'English Literature', N'Exploration of classic and modern literature.', 60, 95, 5)
INSERT [dbo].[Course] ([C_ID], [C_Name], [C_Description], [C_Min_Degree], [C_Max_Degree], [Inst_Id]) VALUES (9, N'Mathematics', N'Advanced mathematical principles for engineering.', 75, 98, 2)
INSERT [dbo].[Course] ([C_ID], [C_Name], [C_Description], [C_Min_Degree], [C_Max_Degree], [Inst_Id]) VALUES (10, N'Civilizations', N'Study of ancient cultures and civilizations.', 65, 90, 7)
INSERT [dbo].[Course] ([C_ID], [C_Name], [C_Description], [C_Min_Degree], [C_Max_Degree], [Inst_Id]) VALUES (11, N'Financial', N'Principles and practices of financial accounting.', 80, 100, 2)
INSERT [dbo].[Course] ([C_ID], [C_Name], [C_Description], [C_Min_Degree], [C_Max_Degree], [Inst_Id]) VALUES (12, N'Psychology', N'Basic concepts in psychology and human behavior.', 70, 95, 4)
INSERT [dbo].[Course] ([C_ID], [C_Name], [C_Description], [C_Min_Degree], [C_Max_Degree], [Inst_Id]) VALUES (13, N'Data Structures', N'Implementation of data structures and algorithms.', 85, 100, 5)
INSERT [dbo].[Course] ([C_ID], [C_Name], [C_Description], [C_Min_Degree], [C_Max_Degree], [Inst_Id]) VALUES (14, N'Art History', N'Exploration of artistic movements throughout history.', 60, 88, 4)
INSERT [dbo].[Course] ([C_ID], [C_Name], [C_Description], [C_Min_Degree], [C_Max_Degree], [Inst_Id]) VALUES (15, N'Marketing ', N'Foundations of marketing strategies and concepts.', 75, 98, 7)
INSERT [dbo].[Course] ([C_ID], [C_Name], [C_Description], [C_Min_Degree], [C_Max_Degree], [Inst_Id]) VALUES (16, N'Environmental', N'Study of environmental issues and conservation.', 68, 92, NULL)
INSERT [dbo].[Course] ([C_ID], [C_Name], [C_Description], [C_Min_Degree], [C_Max_Degree], [Inst_Id]) VALUES (17, N'Javascript', N'Advanced mathematical principles for engineering.', 60, 100, 2)
INSERT [dbo].[Course] ([C_ID], [C_Name], [C_Description], [C_Min_Degree], [C_Max_Degree], [Inst_Id]) VALUES (18, N'Javascript', N'Advanced mathematical principles for engineering.', 60, 100, 2)
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (6, 55)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (6, 56)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (6, 57)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (6, 58)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (11, 51)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (11, 52)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (11, 53)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (11, 54)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (12, 59)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (12, 60)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (12, 61)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (12, 62)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (15, 63)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (15, 64)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (15, 65)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (15, 66)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (16, 67)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (16, 68)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (19, 2)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (19, 3)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (19, 14)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (19, 23)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (19, 40)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (19, 42)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (19, 51)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (19, 62)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (19, 71)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (19, 79)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (23, 3)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (23, 32)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (23, 40)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (23, 51)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (23, 53)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (23, 79)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (28, 7)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (28, 8)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (28, 9)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (28, 10)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (28, 11)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (28, 13)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (29, 8)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (29, 18)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (29, 27)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (29, 47)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (34, 8)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (34, 18)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (34, 27)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (34, 36)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (34, 47)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (34, 66)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (34, 75)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (35, 8)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (35, 27)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (35, 36)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (35, 47)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (35, 57)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (35, 66)
INSERT [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID]) VALUES (35, 75)
GO
SET IDENTITY_INSERT [dbo].[Instructor] ON 

INSERT [dbo].[Instructor] ([INS_ID], [INS_Name], [INS_Age], [INS_Address], [INS_PersonalData], [INS_UserName]) VALUES (1, N'Ahmed', 50, N'Mansoura', N'Single', N'Ins1')
INSERT [dbo].[Instructor] ([INS_ID], [INS_Name], [INS_Age], [INS_Address], [INS_PersonalData], [INS_UserName]) VALUES (2, N'Ahmed', 28, N'Alexandria', N'marital status: Single', N'Ins2')
INSERT [dbo].[Instructor] ([INS_ID], [INS_Name], [INS_Age], [INS_Address], [INS_PersonalData], [INS_UserName]) VALUES (3, N'Mona', 29, N'Luxor', N'marital status: Married', N'Ins3')
INSERT [dbo].[Instructor] ([INS_ID], [INS_Name], [INS_Age], [INS_Address], [INS_PersonalData], [INS_UserName]) VALUES (4, N'Islam', 31, N'South Sinai', N'marital status: Married', N'Ins4')
INSERT [dbo].[Instructor] ([INS_ID], [INS_Name], [INS_Age], [INS_Address], [INS_PersonalData], [INS_UserName]) VALUES (5, N'Nader', 25, N'Dakahlia', N'marital status: Single', N'Ins5')
INSERT [dbo].[Instructor] ([INS_ID], [INS_Name], [INS_Age], [INS_Address], [INS_PersonalData], [INS_UserName]) VALUES (6, N'Fatma', 27, N'Port Said', N'marital status: Single', N'Ins6')
INSERT [dbo].[Instructor] ([INS_ID], [INS_Name], [INS_Age], [INS_Address], [INS_PersonalData], [INS_UserName]) VALUES (7, N'Rana', 30, N'Qena', N'marital status: Married', N'Ins7')
INSERT [dbo].[Instructor] ([INS_ID], [INS_Name], [INS_Age], [INS_Address], [INS_PersonalData], [INS_UserName]) VALUES (14, N'Ahmed', 50, N'Mansoura', N'Single', N'Ins14')
INSERT [dbo].[Instructor] ([INS_ID], [INS_Name], [INS_Age], [INS_Address], [INS_PersonalData], [INS_UserName]) VALUES (15, N'Ahmed', 50, N'Mansoura', N'Single', N'Ins15')
SET IDENTITY_INSERT [dbo].[Instructor] OFF
GO
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (2, N'Multi', N'What is the capital of France?', N'A', N'A-C', N'B-Paris', N'C-Berlin', N'D-London', 7)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (3, N'T/F', N'The sun rises in the west.', N'F', NULL, NULL, NULL, NULL, 7)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (4, N'Multi', N'Which of the following is a mammal?', N'C', N'A-Fish', N'B-Dog', N'C-Bird', N'D-Snake', 8)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (5, N'T/F', N'Water boils at 100 degrees Celsius.', N'T', NULL, NULL, NULL, NULL, 9)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (6, N'Multi', N'What is the largest planet in our solar system?', N'D', N'A-Jupiter', N'B-Mars', N'C-Earth', N'D-Saturn', 10)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (7, N'Multi', N'Which programming language is commonly used for web development?', N'B', N'A-Java', N'B-Python', N'C-HTML', N'D-C++', 14)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (8, N'T/F', N'Mount Everest is the tallest mountain in the world.', N'T', NULL, NULL, NULL, NULL, 11)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (9, N'Multi', N'What is the chemical symbol for gold?', N'A', N'A-Au', N'B-Ag', N'C-Fe', N'D-Cu', 12)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (10, N'Multi', N'Which of the following is a primary color?', N'C', N'A-Green', N'B-Orange', N'C-Red', N'D-Purple', 13)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (11, N'T/F', N'The Great Wall of China is visible from space.', N'F', NULL, NULL, NULL, NULL, 14)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (12, N'Multi', N'What is the capital of Brazil?', N'C', N'A-Buenos', N'B-Lima', N'C-Brasília', N'D-Santiago', 7)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (13, N'T/F', N'The Great Wall of China is visible from the moon.', N'F', NULL, NULL, NULL, NULL, 9)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (14, N'Multi', N'Which programming language is used for building Android apps?', N'D', N'A-Java', N'B-Swift', N'C-C#', N'D-Python', 7)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (15, N'Multi', N'What is the largest continent on Earth?', N'C', N'A-Europe', N'B-Asia', N'C-North America', N'D-Africa', 8)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (16, N'T/F', N'The Pyramids of Giza were built in the 3rd century BC.', N'F', NULL, NULL, NULL, NULL, 9)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (17, N'Multi', N'Which gas makes up the majority of Earth\s atmosphere?', N'B', N'A-Oxygen', N'B-Carbon Dioxide', N'C-Nitrogen', N'D-Argon', 10)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (18, N'Multi', N'Who wrote the play "Romeo and Juliet"?', N'A', N'A-Charles Dickens', N'B-Jane Austen', N'C-William Shakespeare', N'D-Mark Twain', 11)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (19, N'T/F', N'The currency used in Japan is the Yuan.', N'T', NULL, NULL, NULL, NULL, 12)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (20, N'Multi', N'What is the boiling point of water at sea level?', N'D', N'A-100°C', N'B-75°C', N'C-50°C', N'D-25°C', 13)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (21, N'Multi', N'Which of the following is a prime number?', N'C', N'A-15', N'B-22', N'C-7', N'D-12', 14)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (22, N'T/F', N'The Amazon River is the longest river in the world.', N'T', NULL, NULL, NULL, NULL, 15)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (23, N'Multi', N'Who painted the famous artwork "Starry Night"?', N'D', N'A-Pablo Picasso', N'B-Vincent van Gogh', N'C-Leonardo da Vinci', N'D-Claude Monet', 7)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (24, N'Multi', N'What is the capital of South Africa?', N'A', N'A-Nairobi', N'B-Cairo', N'C-Johannesburg', N'D-Cape Town', 8)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (25, N'T/F', N'Spiders are insects.', N'F', NULL, NULL, NULL, NULL, 9)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (26, N'Multi', N'Which planet is known as the "Blue Planet"?', N'C', N'A-Earth', N'B-Mars', N'C-Neptune', N'D-Uranus', 10)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (27, N'Multi', N'What is the main component of natural gas?', N'B', N'A-Methane', N'B-Oxygen', N'C-Nitrogen', N'D-Carbon Dioxide', 11)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (28, N'T/F', N'The Statue of Liberty is located in New York City.', N'T', NULL, NULL, NULL, NULL, 12)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (29, N'Multi', N'Who discovered penicillin?', N'D', N'A-Marie Curie', N'B-Alexander Fleming', N'C-Louis Pasteur', N'D-Antoine Lavoisier', 13)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (30, N'Multi', N'Which continent is home to the Sahara Desert?', N'B', N'A-Asia', N'B-North America', N'C-Africa', N'D-Europe', 14)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (31, N'T/F', N'Bananas are berries.', N'T', NULL, NULL, NULL, NULL, 8)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (32, N'Multi', N'What is the chemical symbol for gold?', N'A', N'A-Au', N'B-Ag', N'C-Fe', N'D-Cu', 7)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (33, N'Multi', N'Which ocean is the largest on Earth?', N'B', N'A-Atlantic Ocean', N'B-Indian Ocean', N'C-Southern Ocean', N'D-Pacific Ocean', 8)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (34, N'T/F', N'The currency used in Switzerland is the Euro.', N'F', NULL, NULL, NULL, NULL, 9)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (35, N'Multi', N'Who wrote "To Kill a Mockingbird"?', N'A', N'A-J.K. Rowling', N'B-George Orwell', N'C-Harper Lee', N'D-Ernest Hemingway', 10)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (36, N'Multi', N'What is the largest island in the world?', N'B', N'A-Borneo', N'B-Greenland', N'C-Madagascar', N'D-Java', 11)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (37, N'T/F', N'Cheetahs are the fastest land animals.', N'T', NULL, NULL, NULL, NULL, 12)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (38, N'Multi', N'Which element has the atomic number 79?', N'D', N'A-Gold', N'B-Silver', N'C-Copper', N'D-Platinum', 13)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (39, N'Multi', N'What is the largest mountain range in the world?', N'C', N'A-Andes', N'B-Himalayas', N'C-Rocky Mountains', N'D-Alps', 14)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (40, N'T/F', N'The Great Barrier Reef is located in the Pacific Ocean.', N'F', NULL, NULL, NULL, NULL, 7)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (41, N'Multi', N'What is the capital of France?', N'A', N'A-C', N'B-Paris', N'C-Berlin', N'D-London', 7)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (42, N'T/F', N'The sun rises in the west.', N'F', NULL, NULL, NULL, NULL, 7)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (43, N'Multi', N'Which of the following is a mammal?', N'C', N'A-Fish', N'B-Dog', N'C-Bird', N'D-Snake', 8)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (44, N'T/F', N'Water boils at 100 degrees Celsius.', N'T', NULL, NULL, NULL, NULL, 9)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (45, N'Multi', N'What is the largest planet in our solar system?', N'D', N'A-Jupiter', N'B-Mars', N'C-Earth', N'D-Saturn', 10)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (46, N'Multi', N'Which programming language is commonly used for web development?', N'B', N'A-Java', N'B-Python', N'C-HTML', N'D-C++', 14)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (47, N'T/F', N'Mount Everest is the tallest mountain in the world.', N'T', NULL, NULL, NULL, NULL, 11)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (48, N'Multi', N'What is the chemical symbol for gold?', N'A', N'A-Au', N'B-Ag', N'C-Fe', N'D-Cu', 12)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (49, N'Multi', N'Which of the following is a primary color?', N'C', N'A-Green', N'B-Orange', N'C-Red', N'D-Purple', 13)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (50, N'T/F', N'The Great Wall of China is visible from space.', N'F', NULL, NULL, NULL, NULL, 14)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (51, N'Multi', N'What is the capital of Brazil?', N'C', N'A-Buenos', N'B-Lima', N'C-Brasília', N'D-Santiago', 7)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (52, N'T/F', N'The Great Wall of China is visible from the moon.', N'F', NULL, NULL, NULL, NULL, 9)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (53, N'Multi', N'Which programming language is used for building Android apps?', N'D', N'A-Java', N'B-Swift', N'C-C#', N'D-Python', 7)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (54, N'Multi', N'What is the largest continent on Earth?', N'C', N'A-Europe', N'B-Asia', N'C-North America', N'D-Africa', 8)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (55, N'T/F', N'The Pyramids of Giza were built in the 3rd century BC.', N'F', NULL, NULL, NULL, NULL, 9)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (56, N'Multi', N'Which gas makes up the majority of Earth\s atmosphere?', N'B', N'A-Oxygen', N'B-Carbon Dioxide', N'C-Nitrogen', N'D-Argon', 10)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (57, N'Multi', N'Who wrote the play "Romeo and Juliet"?', N'A', N'A-Charles Dickens', N'B-Jane Austen', N'C-William Shakespeare', N'D-Mark Twain', 11)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (58, N'T/F', N'The currency used in Japan is the Yuan.', N'T', NULL, NULL, NULL, NULL, 12)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (59, N'Multi', N'What is the boiling point of water at sea level?', N'D', N'A-100°C', N'B-75°C', N'C-50°C', N'D-25°C', 13)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (60, N'Multi', N'Which of the following is a prime number?', N'C', N'A-15', N'B-22', N'C-7', N'D-12', 14)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (61, N'T/F', N'The Amazon River is the longest river in the world.', N'T', NULL, NULL, NULL, NULL, 15)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (62, N'Multi', N'Who painted the famous artwork "Starry Night"?', N'D', N'A-Pablo Picasso', N'B-Vincent van Gogh', N'C-Leonardo da Vinci', N'D-Claude Monet', 7)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (63, N'Multi', N'What is the capital of South Africa?', N'A', N'A-Nairobi', N'B-Cairo', N'C-Johannesburg', N'D-Cape Town', 8)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (64, N'T/F', N'Spiders are insects.', N'F', NULL, NULL, NULL, NULL, 9)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (65, N'Multi', N'Which planet is known as the "Blue Planet"?', N'C', N'A-Earth', N'B-Mars', N'C-Neptune', N'D-Uranus', 10)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (66, N'Multi', N'What is the main component of natural gas?', N'B', N'A-Methane', N'B-Oxygen', N'C-Nitrogen', N'D-Carbon Dioxide', 11)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (67, N'T/F', N'The Statue of Liberty is located in New York City.', N'T', NULL, NULL, NULL, NULL, 12)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (68, N'Multi', N'Who discovered penicillin?', N'D', N'A-Marie Curie', N'B-Alexander Fleming', N'C-Louis Pasteur', N'D-Antoine Lavoisier', 13)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (69, N'Multi', N'Which continent is home to the Sahara Desert?', N'B', N'A-Asia', N'B-North America', N'C-Africa', N'D-Europe', 14)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (70, N'T/F', N'Bananas are berries.', N'T', NULL, NULL, NULL, NULL, 8)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (71, N'Multi', N'What is the chemical symbol for gold?', N'A', N'A-Au', N'B-Ag', N'C-Fe', N'D-Cu', 7)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (72, N'Multi', N'Which ocean is the largest on Earth?', N'B', N'A-Atlantic Ocean', N'B-Indian Ocean', N'C-Southern Ocean', N'D-Pacific Ocean', 8)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (73, N'T/F', N'The currency used in Switzerland is the Euro.', N'F', NULL, NULL, NULL, NULL, 9)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (74, N'Multi', N'Who wrote "To Kill a Mockingbird"?', N'A', N'A-J.K. Rowling', N'B-George Orwell', N'C-Harper Lee', N'D-Ernest Hemingway', 10)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (75, N'Multi', N'What is the largest island in the world?', N'B', N'A-Borneo', N'B-Greenland', N'C-Madagascar', N'D-Java', 11)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (76, N'T/F', N'Cheetahs are the fastest land animals.', N'T', NULL, NULL, NULL, NULL, 12)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (77, N'Multi', N'Which element has the atomic number 79?', N'D', N'A-Gold', N'B-Silver', N'C-Copper', N'D-Platinum', 13)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (78, N'Multi', N'What is the largest mountain range in the world?', N'C', N'A-Andes', N'B-Himalayas', N'C-Rocky Mountains', N'D-Alps', 14)
INSERT [dbo].[Question] ([Q_ID], [Q_Type], [Q_Body], [Q_Correct_Answer], [Q_CH1], [Q_CH2], [Q_CH3], [Q_CH4], [Cour_Id]) VALUES (79, N'T/F', N'The Great Barrier Reef is located in the Pacific Ocean.', N'F', NULL, NULL, NULL, NULL, 7)
SET IDENTITY_INSERT [dbo].[Question] OFF
GO
INSERT [dbo].[Student_Answer] ([StuPerEX_Student_ID], [Stu_Q_Exam_ID], [ExHasQ_Question_ID], [Stu_Answer], [Stu_Check_Correct]) VALUES (2, 6, 56, N'T', 0)
INSERT [dbo].[Student_Answer] ([StuPerEX_Student_ID], [Stu_Q_Exam_ID], [ExHasQ_Question_ID], [Stu_Answer], [Stu_Check_Correct]) VALUES (2, 6, 57, N'A', 1)
INSERT [dbo].[Student_Answer] ([StuPerEX_Student_ID], [Stu_Q_Exam_ID], [ExHasQ_Question_ID], [Stu_Answer], [Stu_Check_Correct]) VALUES (2, 6, 58, N'A', 1)
INSERT [dbo].[Student_Answer] ([StuPerEX_Student_ID], [Stu_Q_Exam_ID], [ExHasQ_Question_ID], [Stu_Answer], [Stu_Check_Correct]) VALUES (2, 12, 59, N'F', 0)
INSERT [dbo].[Student_Answer] ([StuPerEX_Student_ID], [Stu_Q_Exam_ID], [ExHasQ_Question_ID], [Stu_Answer], [Stu_Check_Correct]) VALUES (2, 12, 60, N'B', 0)
INSERT [dbo].[Student_Answer] ([StuPerEX_Student_ID], [Stu_Q_Exam_ID], [ExHasQ_Question_ID], [Stu_Answer], [Stu_Check_Correct]) VALUES (2, 12, 61, N'T', 1)
INSERT [dbo].[Student_Answer] ([StuPerEX_Student_ID], [Stu_Q_Exam_ID], [ExHasQ_Question_ID], [Stu_Answer], [Stu_Check_Correct]) VALUES (2, 12, 62, N'C', 1)
INSERT [dbo].[Student_Answer] ([StuPerEX_Student_ID], [Stu_Q_Exam_ID], [ExHasQ_Question_ID], [Stu_Answer], [Stu_Check_Correct]) VALUES (3, 6, 55, N'A', 0)
INSERT [dbo].[Student_Answer] ([StuPerEX_Student_ID], [Stu_Q_Exam_ID], [ExHasQ_Question_ID], [Stu_Answer], [Stu_Check_Correct]) VALUES (3, 6, 56, N'T', 0)
INSERT [dbo].[Student_Answer] ([StuPerEX_Student_ID], [Stu_Q_Exam_ID], [ExHasQ_Question_ID], [Stu_Answer], [Stu_Check_Correct]) VALUES (3, 6, 57, N'A', 1)
INSERT [dbo].[Student_Answer] ([StuPerEX_Student_ID], [Stu_Q_Exam_ID], [ExHasQ_Question_ID], [Stu_Answer], [Stu_Check_Correct]) VALUES (3, 6, 58, N'A', 1)
INSERT [dbo].[Student_Answer] ([StuPerEX_Student_ID], [Stu_Q_Exam_ID], [ExHasQ_Question_ID], [Stu_Answer], [Stu_Check_Correct]) VALUES (3, 35, 8, N'D', 0)
INSERT [dbo].[Student_Answer] ([StuPerEX_Student_ID], [Stu_Q_Exam_ID], [ExHasQ_Question_ID], [Stu_Answer], [Stu_Check_Correct]) VALUES (3, 35, 36, N'B', 1)
INSERT [dbo].[Student_Answer] ([StuPerEX_Student_ID], [Stu_Q_Exam_ID], [ExHasQ_Question_ID], [Stu_Answer], [Stu_Check_Correct]) VALUES (3, 35, 47, N'F', 0)
INSERT [dbo].[Student_Answer] ([StuPerEX_Student_ID], [Stu_Q_Exam_ID], [ExHasQ_Question_ID], [Stu_Answer], [Stu_Check_Correct]) VALUES (3, 35, 57, N'B', 0)
INSERT [dbo].[Student_Answer] ([StuPerEX_Student_ID], [Stu_Q_Exam_ID], [ExHasQ_Question_ID], [Stu_Answer], [Stu_Check_Correct]) VALUES (3, 35, 66, N'B', 1)
GO
SET IDENTITY_INSERT [dbo].[Traning_Manager] ON 

INSERT [dbo].[Traning_Manager] ([TR_ID], [TR_Name], [TR_UserName]) VALUES (1, N'Islam', N'T_M_1')
INSERT [dbo].[Traning_Manager] ([TR_ID], [TR_Name], [TR_UserName]) VALUES (2, N'Gomaa', N'T_M_2')
INSERT [dbo].[Traning_Manager] ([TR_ID], [TR_Name], [TR_UserName]) VALUES (3, N'Abdelrahman', N'T_M_3')
INSERT [dbo].[Traning_Manager] ([TR_ID], [TR_Name], [TR_UserName]) VALUES (4, N'mohamed', N'T_M_4')
INSERT [dbo].[Traning_Manager] ([TR_ID], [TR_Name], [TR_UserName]) VALUES (5, N'sayed', N'T_M_5')
INSERT [dbo].[Traning_Manager] ([TR_ID], [TR_Name], [TR_UserName]) VALUES (6, N'Islamo', N'T_M_6')
SET IDENTITY_INSERT [dbo].[Traning_Manager] OFF
GO
INSERT [Instructor].[Chosen_Student] ([CH_ST_ID], [CH_ST_EX_id], [EX_Date], [Chosen?], [INS_id]) VALUES (2, 11, CAST(N'2024-01-23' AS Date), 0, 2)
INSERT [Instructor].[Chosen_Student] ([CH_ST_ID], [CH_ST_EX_id], [EX_Date], [Chosen?], [INS_id]) VALUES (2, 12, CAST(N'2024-01-23' AS Date), 1, 4)
INSERT [Instructor].[Chosen_Student] ([CH_ST_ID], [CH_ST_EX_id], [EX_Date], [Chosen?], [INS_id]) VALUES (2, 13, CAST(N'2024-02-25' AS Date), 1, NULL)
INSERT [Instructor].[Chosen_Student] ([CH_ST_ID], [CH_ST_EX_id], [EX_Date], [Chosen?], [INS_id]) VALUES (2, 14, CAST(N'2024-01-25' AS Date), 1, 5)
INSERT [Instructor].[Chosen_Student] ([CH_ST_ID], [CH_ST_EX_id], [EX_Date], [Chosen?], [INS_id]) VALUES (2, 15, CAST(N'2024-02-25' AS Date), 1, NULL)
INSERT [Instructor].[Chosen_Student] ([CH_ST_ID], [CH_ST_EX_id], [EX_Date], [Chosen?], [INS_id]) VALUES (3, 6, CAST(N'2024-01-19' AS Date), 0, 6)
INSERT [Instructor].[Chosen_Student] ([CH_ST_ID], [CH_ST_EX_id], [EX_Date], [Chosen?], [INS_id]) VALUES (3, 12, CAST(N'2024-01-25' AS Date), 0, 5)
INSERT [Instructor].[Chosen_Student] ([CH_ST_ID], [CH_ST_EX_id], [EX_Date], [Chosen?], [INS_id]) VALUES (3, 15, CAST(N'2024-01-12' AS Date), 1, NULL)
INSERT [Instructor].[Chosen_Student] ([CH_ST_ID], [CH_ST_EX_id], [EX_Date], [Chosen?], [INS_id]) VALUES (3, 35, CAST(N'2024-01-12' AS Date), 1, NULL)
INSERT [Instructor].[Chosen_Student] ([CH_ST_ID], [CH_ST_EX_id], [EX_Date], [Chosen?], [INS_id]) VALUES (4, 6, CAST(N'2024-01-17' AS Date), 1, 7)
INSERT [Instructor].[Chosen_Student] ([CH_ST_ID], [CH_ST_EX_id], [EX_Date], [Chosen?], [INS_id]) VALUES (4, 13, CAST(N'2024-01-26' AS Date), 1, 6)
INSERT [Instructor].[Chosen_Student] ([CH_ST_ID], [CH_ST_EX_id], [EX_Date], [Chosen?], [INS_id]) VALUES (5, 6, CAST(N'2024-01-20' AS Date), 0, 1)
INSERT [Instructor].[Chosen_Student] ([CH_ST_ID], [CH_ST_EX_id], [EX_Date], [Chosen?], [INS_id]) VALUES (5, 12, CAST(N'2024-01-22' AS Date), 0, 1)
INSERT [Instructor].[Chosen_Student] ([CH_ST_ID], [CH_ST_EX_id], [EX_Date], [Chosen?], [INS_id]) VALUES (5, 13, CAST(N'2024-01-22' AS Date), 0, 7)
INSERT [Instructor].[Chosen_Student] ([CH_ST_ID], [CH_ST_EX_id], [EX_Date], [Chosen?], [INS_id]) VALUES (6, 12, CAST(N'2024-01-26' AS Date), 1, 2)
INSERT [Instructor].[Chosen_Student] ([CH_ST_ID], [CH_ST_EX_id], [EX_Date], [Chosen?], [INS_id]) VALUES (6, 13, CAST(N'2024-01-24' AS Date), 1, 2)
GO
SET IDENTITY_INSERT [Instructor].[Exam] ON 

INSERT [Instructor].[Exam] ([EX_ID], [EX_Type], [EX_Start_Time], [EX_End_Time], [EX_Year], [EX_Multi_Q_Num], [EX_Multi_Q_Degree], [EX_T_F_Q_Num], [EX_T_F_Q_Degree], [EX_Allowance_Options], [Cour_Id], [Inst_Id], [Tck_Id], [Br_Id], [Intake_Id]) VALUES (6, N'Exam', CAST(N'10:50:00' AS Time), CAST(N'11:50:00' AS Time), 2024, 2, 2, 2, 1, 0, 7, 6, 4, 3, 3)
INSERT [Instructor].[Exam] ([EX_ID], [EX_Type], [EX_Start_Time], [EX_End_Time], [EX_Year], [EX_Multi_Q_Num], [EX_Multi_Q_Degree], [EX_T_F_Q_Num], [EX_T_F_Q_Degree], [EX_Allowance_Options], [Cour_Id], [Inst_Id], [Tck_Id], [Br_Id], [Intake_Id]) VALUES (11, N'Exam', CAST(N'10:50:00' AS Time), CAST(N'11:50:00' AS Time), 2024, 2, 2, 2, 1, 0, 7, 6, 4, 3, 3)
INSERT [Instructor].[Exam] ([EX_ID], [EX_Type], [EX_Start_Time], [EX_End_Time], [EX_Year], [EX_Multi_Q_Num], [EX_Multi_Q_Degree], [EX_T_F_Q_Num], [EX_T_F_Q_Degree], [EX_Allowance_Options], [Cour_Id], [Inst_Id], [Tck_Id], [Br_Id], [Intake_Id]) VALUES (12, N'Exam', CAST(N'10:50:00' AS Time), CAST(N'11:50:00' AS Time), 2022, 2, 3, 2, 1, 1, 8, 5, 4, 3, 3)
INSERT [Instructor].[Exam] ([EX_ID], [EX_Type], [EX_Start_Time], [EX_End_Time], [EX_Year], [EX_Multi_Q_Num], [EX_Multi_Q_Degree], [EX_T_F_Q_Num], [EX_T_F_Q_Degree], [EX_Allowance_Options], [Cour_Id], [Inst_Id], [Tck_Id], [Br_Id], [Intake_Id]) VALUES (13, N'Exam', CAST(N'10:50:00' AS Time), CAST(N'11:50:00' AS Time), 2024, 2, 2, 2, 1, 0, 7, 6, 4, 3, 3)
INSERT [Instructor].[Exam] ([EX_ID], [EX_Type], [EX_Start_Time], [EX_End_Time], [EX_Year], [EX_Multi_Q_Num], [EX_Multi_Q_Degree], [EX_T_F_Q_Num], [EX_T_F_Q_Degree], [EX_Allowance_Options], [Cour_Id], [Inst_Id], [Tck_Id], [Br_Id], [Intake_Id]) VALUES (14, N'Exam', CAST(N'10:50:00' AS Time), CAST(N'11:50:00' AS Time), 2022, 2, 3, 2, 1, 1, 8, 5, 4, 3, 3)
INSERT [Instructor].[Exam] ([EX_ID], [EX_Type], [EX_Start_Time], [EX_End_Time], [EX_Year], [EX_Multi_Q_Num], [EX_Multi_Q_Degree], [EX_T_F_Q_Num], [EX_T_F_Q_Degree], [EX_Allowance_Options], [Cour_Id], [Inst_Id], [Tck_Id], [Br_Id], [Intake_Id]) VALUES (15, N'Exam', CAST(N'06:30:00' AS Time), CAST(N'23:50:00' AS Time), 2444, 4, 10, 10, 5, 1, 8, NULL, 4, 2, 3)
INSERT [Instructor].[Exam] ([EX_ID], [EX_Type], [EX_Start_Time], [EX_End_Time], [EX_Year], [EX_Multi_Q_Num], [EX_Multi_Q_Degree], [EX_T_F_Q_Num], [EX_T_F_Q_Degree], [EX_Allowance_Options], [Cour_Id], [Inst_Id], [Tck_Id], [Br_Id], [Intake_Id]) VALUES (16, N'Corrective', CAST(N'10:50:00' AS Time), CAST(N'11:50:00' AS Time), 2023, 2, 1, 2, 1, 0, 8, 5, 4, 3, 3)
INSERT [Instructor].[Exam] ([EX_ID], [EX_Type], [EX_Start_Time], [EX_End_Time], [EX_Year], [EX_Multi_Q_Num], [EX_Multi_Q_Degree], [EX_T_F_Q_Num], [EX_T_F_Q_Degree], [EX_Allowance_Options], [Cour_Id], [Inst_Id], [Tck_Id], [Br_Id], [Intake_Id]) VALUES (17, N'Corrective', CAST(N'10:50:00' AS Time), CAST(N'11:50:00' AS Time), 2021, 4, 2, 2, 1, 1, 7, 5, 4, 3, 3)
INSERT [Instructor].[Exam] ([EX_ID], [EX_Type], [EX_Start_Time], [EX_End_Time], [EX_Year], [EX_Multi_Q_Num], [EX_Multi_Q_Degree], [EX_T_F_Q_Num], [EX_T_F_Q_Degree], [EX_Allowance_Options], [Cour_Id], [Inst_Id], [Tck_Id], [Br_Id], [Intake_Id]) VALUES (18, N'Corrective', CAST(N'10:50:00' AS Time), CAST(N'11:50:00' AS Time), 2022, 3, 1, 2, 1, 0, 9, 5, 4, 3, 3)
INSERT [Instructor].[Exam] ([EX_ID], [EX_Type], [EX_Start_Time], [EX_End_Time], [EX_Year], [EX_Multi_Q_Num], [EX_Multi_Q_Degree], [EX_T_F_Q_Num], [EX_T_F_Q_Degree], [EX_Allowance_Options], [Cour_Id], [Inst_Id], [Tck_Id], [Br_Id], [Intake_Id]) VALUES (19, N'Exam', CAST(N'10:50:00' AS Time), CAST(N'11:50:00' AS Time), 2222, 3, 20, 3, 30, 1, 7, NULL, 4, 3, 3)
INSERT [Instructor].[Exam] ([EX_ID], [EX_Type], [EX_Start_Time], [EX_End_Time], [EX_Year], [EX_Multi_Q_Num], [EX_Multi_Q_Degree], [EX_T_F_Q_Num], [EX_T_F_Q_Degree], [EX_Allowance_Options], [Cour_Id], [Inst_Id], [Tck_Id], [Br_Id], [Intake_Id]) VALUES (23, N'Exam', CAST(N'10:50:00' AS Time), CAST(N'11:50:00' AS Time), 2222, 3, 20, 3, 30, 1, 7, NULL, 4, 3, 3)
INSERT [Instructor].[Exam] ([EX_ID], [EX_Type], [EX_Start_Time], [EX_End_Time], [EX_Year], [EX_Multi_Q_Num], [EX_Multi_Q_Degree], [EX_T_F_Q_Num], [EX_T_F_Q_Degree], [EX_Allowance_Options], [Cour_Id], [Inst_Id], [Tck_Id], [Br_Id], [Intake_Id]) VALUES (24, N'Exam', CAST(N'10:50:00' AS Time), CAST(N'11:50:00' AS Time), 2222, 3, 20, 3, 30, 1, 7, NULL, 4, 3, 3)
INSERT [Instructor].[Exam] ([EX_ID], [EX_Type], [EX_Start_Time], [EX_End_Time], [EX_Year], [EX_Multi_Q_Num], [EX_Multi_Q_Degree], [EX_T_F_Q_Num], [EX_T_F_Q_Degree], [EX_Allowance_Options], [Cour_Id], [Inst_Id], [Tck_Id], [Br_Id], [Intake_Id]) VALUES (25, N'Corrective', CAST(N'10:50:00' AS Time), CAST(N'11:50:00' AS Time), 2222, 3, 20, 3, 30, 1, 11, NULL, 4, 3, 3)
INSERT [Instructor].[Exam] ([EX_ID], [EX_Type], [EX_Start_Time], [EX_End_Time], [EX_Year], [EX_Multi_Q_Num], [EX_Multi_Q_Degree], [EX_T_F_Q_Num], [EX_T_F_Q_Degree], [EX_Allowance_Options], [Cour_Id], [Inst_Id], [Tck_Id], [Br_Id], [Intake_Id]) VALUES (26, N'Corrective', CAST(N'10:50:00' AS Time), CAST(N'11:50:00' AS Time), 2222, 3, 20, 3, 30, 1, 11, NULL, 4, 3, 3)
INSERT [Instructor].[Exam] ([EX_ID], [EX_Type], [EX_Start_Time], [EX_End_Time], [EX_Year], [EX_Multi_Q_Num], [EX_Multi_Q_Degree], [EX_T_F_Q_Num], [EX_T_F_Q_Degree], [EX_Allowance_Options], [Cour_Id], [Inst_Id], [Tck_Id], [Br_Id], [Intake_Id]) VALUES (27, N'Corrective', CAST(N'10:50:00' AS Time), CAST(N'11:50:00' AS Time), 2222, 3, 20, 3, 30, 1, 11, NULL, 4, 3, 3)
INSERT [Instructor].[Exam] ([EX_ID], [EX_Type], [EX_Start_Time], [EX_End_Time], [EX_Year], [EX_Multi_Q_Num], [EX_Multi_Q_Degree], [EX_T_F_Q_Num], [EX_T_F_Q_Degree], [EX_Allowance_Options], [Cour_Id], [Inst_Id], [Tck_Id], [Br_Id], [Intake_Id]) VALUES (28, N'Corrective', CAST(N'10:50:00' AS Time), CAST(N'11:50:00' AS Time), 2222, 3, 20, 3, 30, 1, 11, NULL, 4, 3, 3)
INSERT [Instructor].[Exam] ([EX_ID], [EX_Type], [EX_Start_Time], [EX_End_Time], [EX_Year], [EX_Multi_Q_Num], [EX_Multi_Q_Degree], [EX_T_F_Q_Num], [EX_T_F_Q_Degree], [EX_Allowance_Options], [Cour_Id], [Inst_Id], [Tck_Id], [Br_Id], [Intake_Id]) VALUES (29, N'Exam', CAST(N'10:50:00' AS Time), CAST(N'11:50:00' AS Time), 2222, 2, 20, 2, 30, 1, 11, NULL, 4, 3, 3)
INSERT [Instructor].[Exam] ([EX_ID], [EX_Type], [EX_Start_Time], [EX_End_Time], [EX_Year], [EX_Multi_Q_Num], [EX_Multi_Q_Degree], [EX_T_F_Q_Num], [EX_T_F_Q_Degree], [EX_Allowance_Options], [Cour_Id], [Inst_Id], [Tck_Id], [Br_Id], [Intake_Id]) VALUES (30, N'Exam', CAST(N'10:50:00' AS Time), CAST(N'11:50:00' AS Time), 2222, 2, 20, 2, 30, 1, 11, NULL, 4, 3, 3)
INSERT [Instructor].[Exam] ([EX_ID], [EX_Type], [EX_Start_Time], [EX_End_Time], [EX_Year], [EX_Multi_Q_Num], [EX_Multi_Q_Degree], [EX_T_F_Q_Num], [EX_T_F_Q_Degree], [EX_Allowance_Options], [Cour_Id], [Inst_Id], [Tck_Id], [Br_Id], [Intake_Id]) VALUES (31, N'Exam', CAST(N'10:50:00' AS Time), CAST(N'11:50:00' AS Time), 2222, 2, 20, 2, 30, 1, 11, NULL, 4, 3, 3)
INSERT [Instructor].[Exam] ([EX_ID], [EX_Type], [EX_Start_Time], [EX_End_Time], [EX_Year], [EX_Multi_Q_Num], [EX_Multi_Q_Degree], [EX_T_F_Q_Num], [EX_T_F_Q_Degree], [EX_Allowance_Options], [Cour_Id], [Inst_Id], [Tck_Id], [Br_Id], [Intake_Id]) VALUES (32, N'Corrective', CAST(N'08:30:00' AS Time), CAST(N'10:50:00' AS Time), 2333, 4, 20, 2, 30, 1, 11, NULL, 4, 2, 3)
INSERT [Instructor].[Exam] ([EX_ID], [EX_Type], [EX_Start_Time], [EX_End_Time], [EX_Year], [EX_Multi_Q_Num], [EX_Multi_Q_Degree], [EX_T_F_Q_Num], [EX_T_F_Q_Degree], [EX_Allowance_Options], [Cour_Id], [Inst_Id], [Tck_Id], [Br_Id], [Intake_Id]) VALUES (34, N'Corrective', CAST(N'08:30:00' AS Time), CAST(N'10:50:00' AS Time), 2333, 4, 20, 2, 30, 1, 11, NULL, 4, 2, 3)
INSERT [Instructor].[Exam] ([EX_ID], [EX_Type], [EX_Start_Time], [EX_End_Time], [EX_Year], [EX_Multi_Q_Num], [EX_Multi_Q_Degree], [EX_T_F_Q_Num], [EX_T_F_Q_Degree], [EX_Allowance_Options], [Cour_Id], [Inst_Id], [Tck_Id], [Br_Id], [Intake_Id]) VALUES (35, N'Exam', CAST(N'10:50:00' AS Time), CAST(N'20:50:00' AS Time), 2222, 5, 20, 3, 30, 1, 11, NULL, 4, 3, 3)
SET IDENTITY_INSERT [Instructor].[Exam] OFF
GO
INSERT [Student].[Student_Perform_Exam] ([Student_ID], [Exam_ID], [Total_Result]) VALUES (2, 6, NULL)
INSERT [Student].[Student_Perform_Exam] ([Student_ID], [Exam_ID], [Total_Result]) VALUES (2, 12, NULL)
INSERT [Student].[Student_Perform_Exam] ([Student_ID], [Exam_ID], [Total_Result]) VALUES (3, 6, NULL)
INSERT [Student].[Student_Perform_Exam] ([Student_ID], [Exam_ID], [Total_Result]) VALUES (3, 11, NULL)
INSERT [Student].[Student_Perform_Exam] ([Student_ID], [Exam_ID], [Total_Result]) VALUES (3, 35, 40)
INSERT [Student].[Student_Perform_Exam] ([Student_ID], [Exam_ID], [Total_Result]) VALUES (4, 6, NULL)
INSERT [Student].[Student_Perform_Exam] ([Student_ID], [Exam_ID], [Total_Result]) VALUES (4, 11, NULL)
INSERT [Student].[Student_Perform_Exam] ([Student_ID], [Exam_ID], [Total_Result]) VALUES (5, 12, NULL)
INSERT [Student].[Student_Perform_Exam] ([Student_ID], [Exam_ID], [Total_Result]) VALUES (5, 15, NULL)
INSERT [Student].[Student_Perform_Exam] ([Student_ID], [Exam_ID], [Total_Result]) VALUES (6, 6, NULL)
INSERT [Student].[Student_Perform_Exam] ([Student_ID], [Exam_ID], [Total_Result]) VALUES (6, 15, NULL)
GO
INSERT [Student].[Student_Takes_Course] ([St_ID], [Cour_ID]) VALUES (3, 8)
INSERT [Student].[Student_Takes_Course] ([St_ID], [Cour_ID]) VALUES (3, 12)
INSERT [Student].[Student_Takes_Course] ([St_ID], [Cour_ID]) VALUES (3, 13)
INSERT [Student].[Student_Takes_Course] ([St_ID], [Cour_ID]) VALUES (4, 7)
INSERT [Student].[Student_Takes_Course] ([St_ID], [Cour_ID]) VALUES (5, 8)
INSERT [Student].[Student_Takes_Course] ([St_ID], [Cour_ID]) VALUES (5, 10)
INSERT [Student].[Student_Takes_Course] ([St_ID], [Cour_ID]) VALUES (5, 14)
INSERT [Student].[Student_Takes_Course] ([St_ID], [Cour_ID]) VALUES (6, 12)
INSERT [Student].[Student_Takes_Course] ([St_ID], [Cour_ID]) VALUES (6, 14)
INSERT [Student].[Student_Takes_Course] ([St_ID], [Cour_ID]) VALUES (20, 14)
GO
SET IDENTITY_INSERT [Training_Manager].[Branch] ON 

INSERT [Training_Manager].[Branch] ([BR_ID], [BR_Name], [TR_id]) VALUES (1, N'BeniSufe', 1)
INSERT [Training_Manager].[Branch] ([BR_ID], [BR_Name], [TR_id]) VALUES (2, N'SMART', 2)
INSERT [Training_Manager].[Branch] ([BR_ID], [BR_Name], [TR_id]) VALUES (3, N'Mniya', 3)
INSERT [Training_Manager].[Branch] ([BR_ID], [BR_Name], [TR_id]) VALUES (4, N'ALEX', 4)
INSERT [Training_Manager].[Branch] ([BR_ID], [BR_Name], [TR_id]) VALUES (5, N'MONOFIA', 4)
SET IDENTITY_INSERT [Training_Manager].[Branch] OFF
GO
SET IDENTITY_INSERT [Training_Manager].[Department] ON 

INSERT [Training_Manager].[Department] ([DEP_ID], [DEP_Name], [TR_id]) VALUES (1, N'Engnering', 1)
INSERT [Training_Manager].[Department] ([DEP_ID], [DEP_Name], [TR_id]) VALUES (2, N'Softwear', 2)
INSERT [Training_Manager].[Department] ([DEP_ID], [DEP_Name], [TR_id]) VALUES (3, N'Hardwear', 3)
INSERT [Training_Manager].[Department] ([DEP_ID], [DEP_Name], [TR_id]) VALUES (4, N'Automation', 4)
INSERT [Training_Manager].[Department] ([DEP_ID], [DEP_Name], [TR_id]) VALUES (5, N'markting', 5)
SET IDENTITY_INSERT [Training_Manager].[Department] OFF
GO
SET IDENTITY_INSERT [Training_Manager].[Intake] ON 

INSERT [Training_Manager].[Intake] ([INT_ID], [INT_Name], [TR_id]) VALUES (1, N'in1', 1)
INSERT [Training_Manager].[Intake] ([INT_ID], [INT_Name], [TR_id]) VALUES (2, N'Intake2', 2)
INSERT [Training_Manager].[Intake] ([INT_ID], [INT_Name], [TR_id]) VALUES (3, N'Intake3', 3)
INSERT [Training_Manager].[Intake] ([INT_ID], [INT_Name], [TR_id]) VALUES (4, N'Intake4', 4)
INSERT [Training_Manager].[Intake] ([INT_ID], [INT_Name], [TR_id]) VALUES (5, N'Intake5', 5)
SET IDENTITY_INSERT [Training_Manager].[Intake] OFF
GO
SET IDENTITY_INSERT [Training_Manager].[Student] ON 

INSERT [Training_Manager].[Student] ([ST_ID], [ST_Name], [ST_Age], [ST_Address], [ST_Personal_Data], [ST_UserName], [ST_TCK_id], [ST_TR_id], [ST_IN_id], [ST_BR_id]) VALUES (1, N'John Doe', 25, N'123 Main St', N'PersonalInfo1', N'Student_1', 1, 1, 1, 1)
INSERT [Training_Manager].[Student] ([ST_ID], [ST_Name], [ST_Age], [ST_Address], [ST_Personal_Data], [ST_UserName], [ST_TCK_id], [ST_TR_id], [ST_IN_id], [ST_BR_id]) VALUES (2, N'ali', 25, N'minia', N'singel', N'Student_2', 2, NULL, 2, 3)
INSERT [Training_Manager].[Student] ([ST_ID], [ST_Name], [ST_Age], [ST_Address], [ST_Personal_Data], [ST_UserName], [ST_TCK_id], [ST_TR_id], [ST_IN_id], [ST_BR_id]) VALUES (3, N'Alex Johnson', 28, N'789 Pine St', N'PersonalInfo3', N'Student_3', 3, 3, 3, 3)
INSERT [Training_Manager].[Student] ([ST_ID], [ST_Name], [ST_Age], [ST_Address], [ST_Personal_Data], [ST_UserName], [ST_TCK_id], [ST_TR_id], [ST_IN_id], [ST_BR_id]) VALUES (4, N'Eva White', 22, N'101 Elm St', N'PersonalInfo4', N'Student_4', 4, 4, 4, 4)
INSERT [Training_Manager].[Student] ([ST_ID], [ST_Name], [ST_Age], [ST_Address], [ST_Personal_Data], [ST_UserName], [ST_TCK_id], [ST_TR_id], [ST_IN_id], [ST_BR_id]) VALUES (5, N'Michael Brown', 29, N'202 Maple St', N'PersonalInfo5', N'Student_5', 5, 5, 5, 5)
INSERT [Training_Manager].[Student] ([ST_ID], [ST_Name], [ST_Age], [ST_Address], [ST_Personal_Data], [ST_UserName], [ST_TCK_id], [ST_TR_id], [ST_IN_id], [ST_BR_id]) VALUES (6, N'Olivia Taylor', 29, N'303 Birch St', N'PersonalInfo6', N'Student_6', 1, 1, 1, 1)
INSERT [Training_Manager].[Student] ([ST_ID], [ST_Name], [ST_Age], [ST_Address], [ST_Personal_Data], [ST_UserName], [ST_TCK_id], [ST_TR_id], [ST_IN_id], [ST_BR_id]) VALUES (7, N'Sophia Harris', 27, N'404 Cedar St', N'PersonalInfo200', N'Student_7', 4, 4, 4, 4)
INSERT [Training_Manager].[Student] ([ST_ID], [ST_Name], [ST_Age], [ST_Address], [ST_Personal_Data], [ST_UserName], [ST_TCK_id], [ST_TR_id], [ST_IN_id], [ST_BR_id]) VALUES (8, N'John Additional', 26, N'789 Oak St', N'AdditionalInfo1', N'Student_8', 2, 3, 4, 1)
INSERT [Training_Manager].[Student] ([ST_ID], [ST_Name], [ST_Age], [ST_Address], [ST_Personal_Data], [ST_UserName], [ST_TCK_id], [ST_TR_id], [ST_IN_id], [ST_BR_id]) VALUES (9, N'Emma Johnson', 23, N'456 Pine St', N'AdditionalInfo2', N'Student_9', 1, 2, 3, 4)
INSERT [Training_Manager].[Student] ([ST_ID], [ST_Name], [ST_Age], [ST_Address], [ST_Personal_Data], [ST_UserName], [ST_TCK_id], [ST_TR_id], [ST_IN_id], [ST_BR_id]) VALUES (10, N'William Black', 29, N'101 Elm St', N'AdditionalInfo3', N'Student_10', 3, 4, 1, 2)
INSERT [Training_Manager].[Student] ([ST_ID], [ST_Name], [ST_Age], [ST_Address], [ST_Personal_Data], [ST_UserName], [ST_TCK_id], [ST_TR_id], [ST_IN_id], [ST_BR_id]) VALUES (11, N'Sophie Miller', 28, N'555 Cedar St', N'AdditionalInfo4', N'Student_11', 2, 1, 4, 3)
INSERT [Training_Manager].[Student] ([ST_ID], [ST_Name], [ST_Age], [ST_Address], [ST_Personal_Data], [ST_UserName], [ST_TCK_id], [ST_TR_id], [ST_IN_id], [ST_BR_id]) VALUES (12, N'Daniel White', 29, N'777 Birch St', N'AdditionalInfo5', N'Student_12', 4, 2, 1, 3)
INSERT [Training_Manager].[Student] ([ST_ID], [ST_Name], [ST_Age], [ST_Address], [ST_Personal_Data], [ST_UserName], [ST_TCK_id], [ST_TR_id], [ST_IN_id], [ST_BR_id]) VALUES (13, N'Oliver Davis', 24, N'888 Pine St', N'AdditionalInfo6', N'Student_13', 5, 3, 2, 4)
INSERT [Training_Manager].[Student] ([ST_ID], [ST_Name], [ST_Age], [ST_Address], [ST_Personal_Data], [ST_UserName], [ST_TCK_id], [ST_TR_id], [ST_IN_id], [ST_BR_id]) VALUES (14, N'Ava Martin', 29, N'999 Oak St', N'AdditionalInfo7', N'Student_14', 1, 4, 3, 2)
INSERT [Training_Manager].[Student] ([ST_ID], [ST_Name], [ST_Age], [ST_Address], [ST_Personal_Data], [ST_UserName], [ST_TCK_id], [ST_TR_id], [ST_IN_id], [ST_BR_id]) VALUES (15, N'Logan Wilson', 26, N'111 Maple St', N'AdditionalInfo8', N'Student_15', 3, 1, 2, 4)
INSERT [Training_Manager].[Student] ([ST_ID], [ST_Name], [ST_Age], [ST_Address], [ST_Personal_Data], [ST_UserName], [ST_TCK_id], [ST_TR_id], [ST_IN_id], [ST_BR_id]) VALUES (16, N'Chloe Baker', 29, N'222 Elm St', N'AdditionalInfo9', N'Student_16', 2, 3, 4, 1)
INSERT [Training_Manager].[Student] ([ST_ID], [ST_Name], [ST_Age], [ST_Address], [ST_Personal_Data], [ST_UserName], [ST_TCK_id], [ST_TR_id], [ST_IN_id], [ST_BR_id]) VALUES (17, N'ali', 25, N'mini', N'singel', N'Student_17', 2, NULL, 2, 3)
INSERT [Training_Manager].[Student] ([ST_ID], [ST_Name], [ST_Age], [ST_Address], [ST_Personal_Data], [ST_UserName], [ST_TCK_id], [ST_TR_id], [ST_IN_id], [ST_BR_id]) VALUES (18, N'ahmed', 25, N'mini', N'singel', N'Student_18', 2, NULL, 2, 3)
INSERT [Training_Manager].[Student] ([ST_ID], [ST_Name], [ST_Age], [ST_Address], [ST_Personal_Data], [ST_UserName], [ST_TCK_id], [ST_TR_id], [ST_IN_id], [ST_BR_id]) VALUES (20, N'ali', 25, N'minia', N'married', N'Student_20', 2, NULL, 2, 3)
SET IDENTITY_INSERT [Training_Manager].[Student] OFF
GO
SET IDENTITY_INSERT [Training_Manager].[Track] ON 

INSERT [Training_Manager].[Track] ([TCK_ID], [TCK_Name], [TR_id], [DEP_id]) VALUES (1, N'Front-End', 1, 2)
INSERT [Training_Manager].[Track] ([TCK_ID], [TCK_Name], [TR_id], [DEP_id]) VALUES (2, N'Back-End', 2, 2)
INSERT [Training_Manager].[Track] ([TCK_ID], [TCK_Name], [TR_id], [DEP_id]) VALUES (3, N'SQL Server', 3, 2)
INSERT [Training_Manager].[Track] ([TCK_ID], [TCK_Name], [TR_id], [DEP_id]) VALUES (4, N'PHP', 4, 2)
INSERT [Training_Manager].[Track] ([TCK_ID], [TCK_Name], [TR_id], [DEP_id]) VALUES (5, N'MONGO-DB', 1, 2)
INSERT [Training_Manager].[Track] ([TCK_ID], [TCK_Name], [TR_id], [DEP_id]) VALUES (6, N'Machen learning', 2, 3)
INSERT [Training_Manager].[Track] ([TCK_ID], [TCK_Name], [TR_id], [DEP_id]) VALUES (7, N'Micatronix', 3, 3)
INSERT [Training_Manager].[Track] ([TCK_ID], [TCK_Name], [TR_id], [DEP_id]) VALUES (8, N'GIS', 4, 1)
INSERT [Training_Manager].[Track] ([TCK_ID], [TCK_Name], [TR_id], [DEP_id]) VALUES (9, N'embdet sys', 5, 4)
INSERT [Training_Manager].[Track] ([TCK_ID], [TCK_Name], [TR_id], [DEP_id]) VALUES (10, N'F_END', 5, 2)
SET IDENTITY_INSERT [Training_Manager].[Track] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Unique_Instructor_UserName]    Script Date: 1/14/2024 12:03:59 PM ******/
ALTER TABLE [dbo].[Instructor] ADD  CONSTRAINT [Unique_Instructor_UserName] UNIQUE NONCLUSTERED 
(
	[INS_UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [HR_FG]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Unique_TraningManager_UserName]    Script Date: 1/14/2024 12:03:59 PM ******/
ALTER TABLE [dbo].[Traning_Manager] ADD  CONSTRAINT [Unique_TraningManager_UserName] UNIQUE NONCLUSTERED 
(
	[TR_UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [HR_FG]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Unique_Student_UserName]    Script Date: 1/14/2024 12:03:59 PM ******/
ALTER TABLE [Training_Manager].[Student] ADD  CONSTRAINT [Unique_Student_UserName] UNIQUE NONCLUSTERED 
(
	[ST_UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Student_FG]
GO
ALTER TABLE [Instructor].[Chosen_Student] ADD  DEFAULT ((0)) FOR [Chosen?]
GO
ALTER TABLE [Instructor].[Exam] ADD  DEFAULT ('Exam') FOR [EX_Type]
GO
ALTER TABLE [Instructor].[Exam] ADD  DEFAULT (datepart(year,getdate())) FOR [EX_Year]
GO
ALTER TABLE [Instructor].[Exam] ADD  DEFAULT ((0)) FOR [EX_Allowance_Options]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Instructor_InstID] FOREIGN KEY([Inst_Id])
REFERENCES [dbo].[Instructor] ([INS_ID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Instructor_InstID]
GO
ALTER TABLE [dbo].[Exam_Has_Question]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Has_Question_ExamID] FOREIGN KEY([Exam_ID])
REFERENCES [Instructor].[Exam] ([EX_ID])
GO
ALTER TABLE [dbo].[Exam_Has_Question] CHECK CONSTRAINT [FK_Exam_Has_Question_ExamID]
GO
ALTER TABLE [dbo].[Exam_Has_Question]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Has_Question_QuestionID] FOREIGN KEY([Question_ID])
REFERENCES [dbo].[Question] ([Q_ID])
GO
ALTER TABLE [dbo].[Exam_Has_Question] CHECK CONSTRAINT [FK_Exam_Has_Question_QuestionID]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Course_CoursID] FOREIGN KEY([Cour_Id])
REFERENCES [dbo].[Course] ([C_ID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Course_CoursID]
GO
ALTER TABLE [dbo].[Student_Answer]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Has_Question_ExIdAndQId] FOREIGN KEY([Stu_Q_Exam_ID], [ExHasQ_Question_ID])
REFERENCES [dbo].[Exam_Has_Question] ([Exam_ID], [Question_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Student_Answer] CHECK CONSTRAINT [FK_Exam_Has_Question_ExIdAndQId]
GO
ALTER TABLE [dbo].[Student_Answer]  WITH CHECK ADD  CONSTRAINT [FK_StudentPerformExam_StuIdAndExId] FOREIGN KEY([StuPerEX_Student_ID], [Stu_Q_Exam_ID])
REFERENCES [Student].[Student_Perform_Exam] ([Student_ID], [Exam_ID])
GO
ALTER TABLE [dbo].[Student_Answer] CHECK CONSTRAINT [FK_StudentPerformExam_StuIdAndExId]
GO
ALTER TABLE [Instructor].[Chosen_Student]  WITH CHECK ADD  CONSTRAINT [Fk_ChosenStudent_Exam_ExId] FOREIGN KEY([CH_ST_EX_id])
REFERENCES [Instructor].[Exam] ([EX_ID])
GO
ALTER TABLE [Instructor].[Chosen_Student] CHECK CONSTRAINT [Fk_ChosenStudent_Exam_ExId]
GO
ALTER TABLE [Instructor].[Chosen_Student]  WITH CHECK ADD  CONSTRAINT [Fk_ChosenStudent_Instructor_Ins_Id] FOREIGN KEY([INS_id])
REFERENCES [dbo].[Instructor] ([INS_ID])
GO
ALTER TABLE [Instructor].[Chosen_Student] CHECK CONSTRAINT [Fk_ChosenStudent_Instructor_Ins_Id]
GO
ALTER TABLE [Instructor].[Chosen_Student]  WITH CHECK ADD  CONSTRAINT [Fk_ChosenStudent_StuId] FOREIGN KEY([CH_ST_ID])
REFERENCES [Training_Manager].[Student] ([ST_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Instructor].[Chosen_Student] CHECK CONSTRAINT [Fk_ChosenStudent_StuId]
GO
ALTER TABLE [Instructor].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Branch_CouID] FOREIGN KEY([Br_Id])
REFERENCES [Training_Manager].[Branch] ([BR_ID])
ON DELETE SET NULL
GO
ALTER TABLE [Instructor].[Exam] CHECK CONSTRAINT [FK_Exam_Branch_CouID]
GO
ALTER TABLE [Instructor].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Course_CoursID] FOREIGN KEY([Cour_Id])
REFERENCES [dbo].[Course] ([C_ID])
ON DELETE SET NULL
GO
ALTER TABLE [Instructor].[Exam] CHECK CONSTRAINT [FK_Exam_Course_CoursID]
GO
ALTER TABLE [Instructor].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Instructor_InstID] FOREIGN KEY([Inst_Id])
REFERENCES [dbo].[Instructor] ([INS_ID])
ON DELETE SET NULL
GO
ALTER TABLE [Instructor].[Exam] CHECK CONSTRAINT [FK_Exam_Instructor_InstID]
GO
ALTER TABLE [Instructor].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Intake_IntakID] FOREIGN KEY([Intake_Id])
REFERENCES [Training_Manager].[Intake] ([INT_ID])
ON DELETE SET NULL
GO
ALTER TABLE [Instructor].[Exam] CHECK CONSTRAINT [FK_Exam_Intake_IntakID]
GO
ALTER TABLE [Instructor].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Track_TckID] FOREIGN KEY([Tck_Id])
REFERENCES [Training_Manager].[Track] ([TCK_ID])
ON DELETE SET NULL
GO
ALTER TABLE [Instructor].[Exam] CHECK CONSTRAINT [FK_Exam_Track_TckID]
GO
ALTER TABLE [Student].[Student_Perform_Exam]  WITH CHECK ADD  CONSTRAINT [FK_ExamID] FOREIGN KEY([Exam_ID])
REFERENCES [Instructor].[Exam] ([EX_ID])
GO
ALTER TABLE [Student].[Student_Perform_Exam] CHECK CONSTRAINT [FK_ExamID]
GO
ALTER TABLE [Student].[Student_Perform_Exam]  WITH CHECK ADD  CONSTRAINT [KF_StudentID] FOREIGN KEY([Student_ID])
REFERENCES [Training_Manager].[Student] ([ST_ID])
GO
ALTER TABLE [Student].[Student_Perform_Exam] CHECK CONSTRAINT [KF_StudentID]
GO
ALTER TABLE [Student].[Student_Takes_Course]  WITH CHECK ADD  CONSTRAINT [FK_StudentTakesCourse_CourseID] FOREIGN KEY([Cour_ID])
REFERENCES [dbo].[Course] ([C_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Student].[Student_Takes_Course] CHECK CONSTRAINT [FK_StudentTakesCourse_CourseID]
GO
ALTER TABLE [Student].[Student_Takes_Course]  WITH CHECK ADD  CONSTRAINT [FK_StudentTakesCourse_StudentID] FOREIGN KEY([St_ID])
REFERENCES [Training_Manager].[Student] ([ST_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [Student].[Student_Takes_Course] CHECK CONSTRAINT [FK_StudentTakesCourse_StudentID]
GO
ALTER TABLE [Training_Manager].[Branch]  WITH CHECK ADD  CONSTRAINT [FK_Branch_TraningManager_TrId] FOREIGN KEY([TR_id])
REFERENCES [dbo].[Traning_Manager] ([TR_ID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Training_Manager].[Branch] CHECK CONSTRAINT [FK_Branch_TraningManager_TrId]
GO
ALTER TABLE [Training_Manager].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_TraningManager_TrId] FOREIGN KEY([TR_id])
REFERENCES [dbo].[Traning_Manager] ([TR_ID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Training_Manager].[Department] CHECK CONSTRAINT [FK_Department_TraningManager_TrId]
GO
ALTER TABLE [Training_Manager].[Intake]  WITH CHECK ADD  CONSTRAINT [FK_Intake_TraningManager_TrId] FOREIGN KEY([TR_id])
REFERENCES [dbo].[Traning_Manager] ([TR_ID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Training_Manager].[Intake] CHECK CONSTRAINT [FK_Intake_TraningManager_TrId]
GO
ALTER TABLE [Training_Manager].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Branch_BrId] FOREIGN KEY([ST_BR_id])
REFERENCES [Training_Manager].[Branch] ([BR_ID])
ON DELETE SET NULL
GO
ALTER TABLE [Training_Manager].[Student] CHECK CONSTRAINT [FK_Student_Branch_BrId]
GO
ALTER TABLE [Training_Manager].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Intake_IntId] FOREIGN KEY([ST_IN_id])
REFERENCES [Training_Manager].[Intake] ([INT_ID])
ON DELETE SET NULL
GO
ALTER TABLE [Training_Manager].[Student] CHECK CONSTRAINT [FK_Student_Intake_IntId]
GO
ALTER TABLE [Training_Manager].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Track_TckId] FOREIGN KEY([ST_TCK_id])
REFERENCES [Training_Manager].[Track] ([TCK_ID])
ON DELETE SET NULL
GO
ALTER TABLE [Training_Manager].[Student] CHECK CONSTRAINT [FK_Student_Track_TckId]
GO
ALTER TABLE [Training_Manager].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_TraningManager_TrId] FOREIGN KEY([ST_TR_id])
REFERENCES [dbo].[Traning_Manager] ([TR_ID])
ON DELETE SET NULL
GO
ALTER TABLE [Training_Manager].[Student] CHECK CONSTRAINT [FK_Student_TraningManager_TrId]
GO
ALTER TABLE [Training_Manager].[Track]  WITH CHECK ADD  CONSTRAINT [FK_Track_Department_DEP_id] FOREIGN KEY([DEP_id])
REFERENCES [Training_Manager].[Department] ([DEP_ID])
ON DELETE SET NULL
GO
ALTER TABLE [Training_Manager].[Track] CHECK CONSTRAINT [FK_Track_Department_DEP_id]
GO
ALTER TABLE [Training_Manager].[Track]  WITH CHECK ADD  CONSTRAINT [FK_Track_TraningManager_TrId] FOREIGN KEY([TR_id])
REFERENCES [dbo].[Traning_Manager] ([TR_ID])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [Training_Manager].[Track] CHECK CONSTRAINT [FK_Track_TraningManager_TrId]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [CK_Degree] CHECK  (([C_Min_Degree]<[C_Max_Degree]))
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [CK_Degree]
GO
ALTER TABLE [dbo].[Instructor]  WITH CHECK ADD  CONSTRAINT [CK_Inst_Age] CHECK  (([INS_Age]>(22)))
GO
ALTER TABLE [dbo].[Instructor] CHECK CONSTRAINT [CK_Inst_Age]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [CK_CH1] CHECK  (([Q_CH1] like 'A%'))
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [CK_CH1]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [CK_CH2] CHECK  (([Q_CH2] like 'B%'))
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [CK_CH2]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [CK_CH3] CHECK  (([Q_CH3] like 'C%'))
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [CK_CH3]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [CK_CH4] CHECK  (([Q_CH4] like 'D%'))
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [CK_CH4]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [CK_Correct_Ans] CHECK  (([Q_Correct_Answer]='D' OR [Q_Correct_Answer]='C' OR [Q_Correct_Answer]='B' OR [Q_Correct_Answer]='A' OR [Q_Correct_Answer]='F' OR [Q_Correct_Answer]='T'))
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [CK_Correct_Ans]
GO
ALTER TABLE [dbo].[Student_Answer]  WITH CHECK ADD  CONSTRAINT [CK_Answer] CHECK  (([Stu_Answer]='D' OR [Stu_Answer]='C' OR [Stu_Answer]='B' OR [Stu_Answer]='A' OR [Stu_Answer]='F' OR [Stu_Answer]='T'))
GO
ALTER TABLE [dbo].[Student_Answer] CHECK CONSTRAINT [CK_Answer]
GO
ALTER TABLE [Instructor].[Exam]  WITH CHECK ADD  CONSTRAINT [CK_Exam_type] CHECK  (([EX_Type]='Corrective' OR [EX_Type]='Exam'))
GO
ALTER TABLE [Instructor].[Exam] CHECK CONSTRAINT [CK_Exam_type]
GO
ALTER TABLE [Instructor].[Exam]  WITH CHECK ADD  CONSTRAINT [CK_MultiDegree] CHECK  (([EX_Multi_Q_Degree]>(0)))
GO
ALTER TABLE [Instructor].[Exam] CHECK CONSTRAINT [CK_MultiDegree]
GO
ALTER TABLE [Instructor].[Exam]  WITH CHECK ADD  CONSTRAINT [CK_MultiNum] CHECK  (([EX_Multi_Q_Num]>=(1)))
GO
ALTER TABLE [Instructor].[Exam] CHECK CONSTRAINT [CK_MultiNum]
GO
ALTER TABLE [Instructor].[Exam]  WITH CHECK ADD  CONSTRAINT [CK_T_F_Degree] CHECK  (([EX_T_F_Q_Degree]>(0)))
GO
ALTER TABLE [Instructor].[Exam] CHECK CONSTRAINT [CK_T_F_Degree]
GO
ALTER TABLE [Instructor].[Exam]  WITH CHECK ADD  CONSTRAINT [CK_T_F_Num] CHECK  (([EX_T_F_Q_Num]>=(1)))
GO
ALTER TABLE [Instructor].[Exam] CHECK CONSTRAINT [CK_T_F_Num]
GO
ALTER TABLE [Instructor].[Exam]  WITH CHECK ADD  CONSTRAINT [CK_time] CHECK  (([EX_Start_Time]<[EX_End_Time]))
GO
ALTER TABLE [Instructor].[Exam] CHECK CONSTRAINT [CK_time]
GO
ALTER TABLE [Training_Manager].[Student]  WITH CHECK ADD  CONSTRAINT [CK_ST_age] CHECK  (([ST_age]<(30)))
GO
ALTER TABLE [Training_Manager].[Student] CHECK CONSTRAINT [CK_ST_age]
GO
/****** Object:  StoredProcedure [dbo].[DeleteBranch]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	--------------
CREATE PROCEDURE [dbo].[DeleteBranch]
    @BR_ID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if BR_ID exists
    IF EXISTS (SELECT 1 FROM Training_Manager.Branch WHERE BR_ID = @BR_ID)
    BEGIN
        -- Delete the Branch
        DELETE FROM Training_Manager.Branch WHERE BR_ID = @BR_ID;
        PRINT 'Branch deleted successfully.';
    END
    ELSE
    BEGIN
        PRINT 'Error: Branch with specified BR_ID does not exist.';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteDepartment]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	---------Department----------
	-------------Delete------------
	CREATE   PROCEDURE [dbo].[DeleteDepartment]
    @DEP_ID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if DEP_ID exists
    IF EXISTS (SELECT 1 FROM Training_Manager.Department WHERE DEP_ID = @DEP_ID)
    BEGIN
        -- Delete the Department
        DELETE FROM Training_Manager.Department WHERE DEP_ID = @DEP_ID;
        PRINT 'Department deleted successfully.';
    END
    ELSE
    BEGIN
        PRINT 'Error: Department with specified DEP_ID does not exist.';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteIntake]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[DeleteIntake]
    @INT_ID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if INT_ID exists
    IF EXISTS (SELECT 1 FROM Training_Manager.Intake WHERE INT_ID = @INT_ID)
    BEGIN
        -- Delete the Intake
        DELETE FROM Training_Manager.Intake WHERE INT_ID = @INT_ID;
        PRINT 'Intake deleted successfully.';
    END
    ELSE
    BEGIN
        PRINT 'Error: Intake with specified INT_ID does not exist.';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteTrack]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROCEDURE [dbo].[DeleteTrack]
    @TCK_ID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if TCK_ID exists
    IF EXISTS (SELECT 1 FROM Training_Manager.Track WHERE TCK_ID = @TCK_ID)
    BEGIN
        -- Delete the Track
        DELETE FROM Training_Manager.Track WHERE TCK_ID = @TCK_ID;
        PRINT 'Track deleted successfully.';
    END
    ELSE
    BEGIN
        PRINT 'Error: Track with specified TCK_ID does not exist.';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteTraningManager]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------delete-----
	CREATE PROCEDURE [dbo].[DeleteTraningManager]
    @TR_ID INT
AS
BEGIN
    -- Check if TR_ID exists
    IF EXISTS (SELECT 1 FROM Traning_Manager WHERE TR_ID = @TR_ID)
    BEGIN
        -- Delete the record
        DELETE FROM Traning_Manager WHERE TR_ID = @TR_ID;
        PRINT 'Traning Manager deleted successfully.';
    END
    ELSE
    BEGIN
        -- Print a message if TR_ID does not exist
        PRINT 'Traning Manager with specified TR_ID does not exist.';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertNewBranch]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	create    PROCEDURE [dbo].[InsertNewBranch]
    @BR_Name NVARCHAR(30)
 
AS
BEGIN
declare  @TR_id INT =(select t.TR_ID from [dbo].[Traning_Manager] t where t.TR_UserName =SUSER_NAME())
    SET NOCOUNT ON;
    -- Check if the provided BR_Name is not empty
    IF LEN(@BR_Name) = 0 OR @BR_Name IS NULL
    BEGIN
        PRINT 'Error: Branch name cannot be empty.';
        RETURN;
    END
	
    -- Check if the provided BR_Name is unique
    IF NOT EXISTS (SELECT 1 FROM Training_Manager.Branch WHERE BR_Name = @BR_Name)
    BEGIN
        -- Insert new record into Branch table
        INSERT INTO Training_Manager.Branch (BR_Name, TR_id)
        VALUES (@BR_Name, @TR_id);
        PRINT 'New Branch added successfully.';
    END
    ELSE
    BEGIN
        PRINT 'Error: The provided branch name is already in use. Please choose a different branch name.';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertNewDepartment]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE   PROCEDURE [dbo].[InsertNewDepartment]
    @DEP_Name NVARCHAR(30)
AS
BEGIN
    SET NOCOUNT ON;
	declare  @TR_id INT =(select t.TR_ID from [dbo].[Traning_Manager] t where t.TR_UserName =SUSER_NAME())

    -- Check if the provided DEP_Name is not empty
    IF LEN(@DEP_Name) = 0 OR @DEP_Name IS NULL
    BEGIN
        PRINT 'Error: Department name cannot be empty.';
        RETURN;
    END
    -- Insert new record into Department table
    INSERT INTO Training_Manager.Department (DEP_Name, TR_id)
    VALUES (@DEP_Name, @TR_id);
    PRINT 'New Department added successfully.';
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertNewIntake]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[InsertNewIntake]
    @INT_Name NVARCHAR(30)
AS
BEGIN
    SET NOCOUNT ON;
	declare  @TR_id INT =(select t.TR_ID from [dbo].[Traning_Manager] t where t.TR_UserName =SUSER_NAME())

    -- Check if the provided INT_Name is not empty
    IF LEN(@INT_Name) = 0 OR @INT_Name IS NULL
    BEGIN
        PRINT 'Error: Intake name cannot be empty.';
        RETURN;
    END

    -- Insert new record into Intake table
    INSERT INTO Training_Manager.Intake (INT_Name, TR_id)
    VALUES (@INT_Name, @TR_id);

    PRINT 'New Intake added successfully.';
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertNewTrack]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE   PROCEDURE [dbo].[InsertNewTrack]
    @TCK_Name NVARCHAR(30),
    @DEP_id INT
AS
BEGIN
    SET NOCOUNT ON;
	declare  @TR_id INT =(select t.TR_ID from [dbo].[Traning_Manager] t where t.TR_UserName =SUSER_NAME())
    -- Check if the provided TCK_Name is not empty
    IF LEN(@TCK_Name) = 0 OR @TCK_Name IS NULL
    BEGIN
        PRINT 'Error: Track name cannot be empty.';
        RETURN;
    END

    -- Check if the provided DEP_id exists in the Department table
    IF NOT EXISTS (SELECT 1 FROM Training_Manager.Department WHERE DEP_ID = @DEP_id)
    BEGIN
        PRINT 'Error: Invalid DEP_id. Department does not exist.';
        RETURN;
    END

    -- Check if the provided TCK_Name is unique
    IF NOT EXISTS (SELECT 1 FROM Training_Manager.Track WHERE TCK_Name = @TCK_Name)
    BEGIN
        -- Insert new record into Track table
        INSERT INTO Training_Manager.Track (TCK_Name, TR_id, DEP_id)
        VALUES (@TCK_Name, @TR_id, @DEP_id);

        PRINT 'New Track added successfully.';
    END
    ELSE
    BEGIN
        PRINT 'Error: The provided track name is already in use. Please choose a different track name.';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertNewTraningManager]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   PROCEDURE [dbo].[InsertNewTraningManager]
    @TR_Name NVARCHAR(30)
  
AS
BEGIN

    SET NOCOUNT ON;
    -- Check if the provided TR_Name is not empty
    IF LEN(@TR_Name) = 0 OR @TR_Name IS NULL
    BEGIN
        PRINT 'Error: Training Manager name cannot be empty.';
        RETURN;
    END
    -- Check if the provided TR_UserName is not empty
   
    -- Check if the provided TR_UserName is unique
    
        -- Insert new record into Traning_Manager table
        INSERT INTO Traning_Manager 
        VALUES (@TR_Name, 'tm');
        PRINT 'New Training Manager added successfully.';
  update [dbo].[Traning_Manager]
	 set [TR_UserName] =('T_M_'+ cast((select top 1[TR_ID] from [dbo].[Traning_Manager] order by [TR_ID] desc)  as nvarchar(10) ))
	 where [TR_ID] = (select top 1[TR_ID] from [dbo].[Traning_Manager] order by [TR_ID] desc)
END;
----
GO
/****** Object:  StoredProcedure [dbo].[Show_Exam_Question]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[Show_Exam_Question]
    @Exam_Id INT
    
AS
BEGIN
    SET NOCOUNT ON;
	declare  @Student_ID INT= (select s.ST_ID from [Training_Manager].[Student] s where s.ST_UserName =SUSER_NAME() )
    IF NOT EXISTS (SELECT top 1 * FROM [Instructor].[Chosen_Student] WHERE CH_ST_ID = @Student_ID)
    BEGIN
        PRINT 'Not Exist Student Id..';
        RETURN;
    END

    IF NOT EXISTS (SELECT top  1 * FROM [Instructor].[Chosen_Student] WHERE CH_ST_EX_id = @Exam_Id)
    BEGIN
        PRINT 'Not Exist Exam Id..';
        RETURN;
    END

    IF NOT EXISTS (SELECT top 1 * FROM [Instructor].[Chosen_Student] WHERE CH_ST_EX_id = @Exam_Id AND CH_ST_ID = @Student_ID)
    BEGIN
        PRINT 'this Student did not selected to perform this Exam ';
        RETURN;
    END
    ELSE
    BEGIN
        DECLARE @IsDate NVARCHAR(5);

        SELECT @IsDate = 
            CASE 
                WHEN [Instructor].[Chosen_Student].EX_Date = CONVERT(DATE, GETDATE()) THEN 'True'
                ELSE 'False'
            END
        FROM [Instructor].[Chosen_Student]
        WHERE CH_ST_EX_id = @Exam_Id AND CH_ST_ID = @Student_ID;

        IF (@IsDate = 'False')
        BEGIN
            PRINT 'Is Exam Date Valid: ' + @IsDate;
            RETURN;
        END

        DECLARE @IsTimeValid NVARCHAR(5);

        SELECT @IsTimeValid = 
            CASE 
                WHEN CAST(GETDATE() AS TIME) BETWEEN [Instructor].[Exam].EX_Start_Time AND [Instructor].[Exam].EX_End_Time THEN 'True'
                ELSE 'False'
            END
        FROM [Instructor].[Exam]
        WHERE EX_ID = @Exam_Id;

        IF (@IsTimeValid = 'False')
        BEGIN
            PRINT 'Is Exam Time Valid: ' + @IsTimeValid;
            RETURN;
        END
    END
	select q.Q_ID,q.Q_Body ,Q_CH1 ,Q_CH2 ,Q_CH3 ,Q_CH4
	from [dbo].[Question] q , [dbo].[Exam_Has_Question]E
	where q.Q_ID =e.Question_ID and e.Exam_ID =@Exam_Id  and q.Q_Type = 'Multi'
	select q.Q_ID, q.Q_Body as 'T or F'
	from [dbo].[Question] q , [dbo].[Exam_Has_Question]E
	where q.Q_ID =e.Question_ID and e.Exam_ID =@Exam_Id  and q.Q_Type = 'T/F' 
	--where [dbo].[Exam_Has_Question].Exam_ID =@Exam_Id 
END;
GO
/****** Object:  StoredProcedure [dbo].[Stuent_Set_Answer]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create   PROCEDURE [dbo].[Stuent_Set_Answer]
@Exam_Id INT,
@Q_ID int ,
@Answer varchar(5)
As 
Begin
SET NOCOUNT ON;
	declare @Student_ID INT= (select s.ST_ID from [Training_Manager].[Student] s where s.ST_UserName =SUSER_NAME() )
    IF NOT EXISTS (SELECT 1 FROM [Instructor].[Chosen_Student] WHERE CH_ST_ID = @Student_ID)
    BEGIN
        PRINT 'Not Exist Student Id..';
        RETURN;
    END
	
	----
    else IF NOT EXISTS (SELECT 1 FROM [Instructor].[Chosen_Student] WHERE CH_ST_EX_id = @Exam_Id)
    BEGIN
        PRINT 'Not Exist Exam Id..';
        RETURN;
    END
	---
	DECLARE @IsTimeValid NVARCHAR(5);

        SELECT @IsTimeValid = 
            CASE 
                WHEN CAST(GETDATE() AS TIME) BETWEEN [Instructor].[Exam].EX_Start_Time AND [Instructor].[Exam].EX_End_Time THEN 'True'
                ELSE 'False'
            END
        FROM [Instructor].[Exam]
        WHERE EX_ID = @Exam_Id;

        IF (@IsTimeValid = 'False')
        BEGIN
            PRINT 'Is Exam Time Valid: ' + @IsTimeValid;
            RETURN;
        END
		---
		DECLARE @IsDefiend NVARCHAR(5);

        SELECT @IsDefiend = 
            CASE 
                WHEN @Q_ID =[dbo].[Exam_Has_Question].Question_ID  AND @Exam_Id = [dbo].[Exam_Has_Question].Exam_ID THEN 'True'
                ELSE 'False'
            END
        FROM [dbo].[Exam_Has_Question]
        WHERE [dbo].[Exam_Has_Question].Question_ID = @Q_ID and [dbo].[Exam_Has_Question].Exam_ID = @Exam_Id;

        IF (@IsTimeValid = 'False')
        BEGIN
            PRINT 'ExamID or QID Defiend: ' + @IsTimeValid;
            RETURN;
        END
		

		----
		DECLARE @IsCorrect bit

	SELECT @IsCorrect = 
		 CASE 
		   WHEN @Answer = Q.Q_Correct_Answer THEN 1
		  ELSE 0
	 END
	FROM [dbo].[Question] AS Q
	WHERE Q.Q_ID = @Q_ID;
		 IF NOT EXISTS (SELECT   1  FROM Student_Answer a WHERE a.Stu_Q_Exam_ID= @Exam_Id and a.StuPerEX_Student_ID=@Student_ID and  a.ExHasQ_Question_ID=@Q_ID)
			BEGIN
				insert into Student_Answer 
				values (@Student_ID ,@Exam_Id,@Q_ID,@Answer,@IsCorrect );
			end 
		else 
			begin 
				print ' you have been already answered this Question , you can not update your Answer .'
			end 
		exec Show_Exam_Question
						@Exam_Id = @Exam_Id
End
GO
/****** Object:  StoredProcedure [dbo].[Sudent_Choose_Exam]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[Sudent_Choose_Exam]
    @STExam_Id INT
AS 
BEGIN
    SET NOCOUNT ON;
	declare  @STStudent_ID INT =(select s.ST_ID from [Training_Manager].[Student] s where s.ST_UserName =SUSER_NAME() )

    IF NOT EXISTS (SELECT 1 FROM [Instructor].[Chosen_Student] WHERE CH_ST_ID = @STStudent_ID)
    BEGIN
        PRINT'You are not choosen Student ..';
        RETURN;
    END

    IF NOT EXISTS (SELECT   1  FROM [Instructor].[Chosen_Student] WHERE CH_ST_EX_id = @STExam_Id)
    BEGIN
        PRINT 'Not Exist Exam Id..';
        RETURN;
    END

    DECLARE @IsDate NVARCHAR(5);

    SELECT @IsDate = 
        CASE 
            WHEN [Instructor].[Chosen_Student].EX_Date = CONVERT(DATE, GETDATE()) THEN 'True'
            ELSE 'False'
        END
    FROM [Instructor].[Chosen_Student]
    WHERE CH_ST_EX_id = @STExam_Id AND CH_ST_ID = @STStudent_ID;

    IF (@IsDate = 'False')
    BEGIN
        PRINT 'Is Exam Date Valid: ' + @IsDate;
        RETURN;
    END

    -- Assuming that Show_Exam_Question is a valid stored procedure

        exec Show_Exam_Question
						@Exam_Id = @STExam_Id
		 IF NOT EXISTS (SELECT   1  FROM [Student].[Student_Perform_Exam] x WHERE x.Exam_ID = @STExam_Id and x.Student_ID=@STStudent_ID)
		BEGIN
        	
			INSERT INTO Student.Student_Perform_Exam VALUES 
			( @STStudent_ID , @STExam_Id , NULL)
		END
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateBranch]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE   PROCEDURE [dbo].[UpdateBranch]
    @BR_ID INT,
    @New_BR_Name NVARCHAR(30)
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the provided New_BR_Name is not empty
    IF LEN(@New_BR_Name) = 0 OR @New_BR_Name IS NULL
    BEGIN
        PRINT 'Error: New Branch name cannot be empty.';
        RETURN;
    END

    -- 
        -- Check if the new branch name is unique (excluding the current branch being updated)
        IF NOT EXISTS (SELECT 1 FROM Training_Manager.Branch WHERE BR_Name = @New_BR_Name AND BR_ID <> @BR_ID)
        BEGIN
            -- Update the branch information
            UPDATE Training_Manager.Branch
            SET BR_Name = @New_BR_Name
            WHERE BR_ID = @BR_ID;

            PRINT 'Branch updated successfully.';
        END
        ELSE
        BEGIN
            PRINT 'Error: The provided new branch name is already in use. Please choose a different branch name.';
        END
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateDepartment]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE   PROCEDURE [dbo].[UpdateDepartment]
    @DEP_ID INT,
    @New_DEP_Name NVARCHAR(30)
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the provided New_DEP_Name is not empty
    IF LEN(@New_DEP_Name) = 0 OR @New_DEP_Name IS NULL
    BEGIN
        PRINT 'Error: New Department name cannot be empty.';
        RETURN;
    END

    -- Check if the specified DEP_ID exists in the Department table
    IF EXISTS (SELECT 1 FROM Training_Manager.Department WHERE DEP_ID = @DEP_ID)
    BEGIN
        -- Check if the new department name is unique (excluding the current department being updated)
        IF NOT EXISTS (SELECT 1 FROM Training_Manager.Department WHERE DEP_Name = @New_DEP_Name AND DEP_ID <> @DEP_ID)
        BEGIN
            -- Update the department information
            UPDATE Training_Manager.Department
            SET DEP_Name = @New_DEP_Name
            WHERE DEP_ID = @DEP_ID;

            PRINT 'Department updated successfully.';
        END
        ELSE
        BEGIN
            PRINT 'Error: The provided new department name is already in use. Please choose a different department name.';
        END
    END
    ELSE
    BEGIN
        PRINT 'Error: Invalid DEP_ID. Department does not exist.';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateIntake]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[UpdateIntake]
    @INT_ID INT,
    @New_INT_Name NVARCHAR(30)
   
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the provided New_INT_Name is not empty
    IF LEN(@New_INT_Name) = 0 OR @New_INT_Name IS NULL
    BEGIN
        PRINT 'Error: New Intake name cannot be empty.';
        RETURN;
    END

    
    -- Check if the specified INT_ID exists in the Intake table
    IF EXISTS (SELECT 1 FROM Training_Manager.Intake WHERE INT_ID = @INT_ID)
    BEGIN
        -- Check if the new intake name is unique (excluding the current intake being updated)
        IF NOT EXISTS (SELECT 1 FROM Training_Manager.Intake WHERE INT_Name = @New_INT_Name AND INT_ID <> @INT_ID)
        BEGIN
            -- Update the intake information
            UPDATE Training_Manager.Intake
            SET INT_Name = @New_INT_Name
            WHERE INT_ID = @INT_ID;

            PRINT 'Intake updated successfully.';
        END
        ELSE
        BEGIN
            PRINT 'Error: The provided new intake name is already in use. Please choose a different intake name.';
        END
    END
    ELSE
    BEGIN
        PRINT 'Error: Invalid INT_ID. Intake does not exist.';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateTrack]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE   PROCEDURE [dbo].[UpdateTrack]
    @TCK_ID INT,
    @New_TCK_Name NVARCHAR(30),
    @New_DEP_id INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the provided New_TCK_Name is not empty
    IF LEN(@New_TCK_Name) = 0 OR @New_TCK_Name IS NULL
    BEGIN
        PRINT 'Error: New Track name cannot be empty.';
        RETURN;
    END

    
    -- Check if the provided New_DEP_id exists in the Department table
    IF NOT EXISTS (SELECT 1 FROM Training_Manager.Department WHERE DEP_ID = @New_DEP_id)
    BEGIN
        PRINT 'Error: Invalid New_DEP_id. Department does not exist.';
        RETURN;
    END

    -- Check if the specified TCK_ID exists in the Track table
    IF EXISTS (SELECT 1 FROM Training_Manager.Track WHERE TCK_ID = @TCK_ID)
    BEGIN
        -- Check if the new track name is unique (excluding the current track being updated)
        IF NOT EXISTS (SELECT 1 FROM Training_Manager.Track WHERE TCK_Name = @New_TCK_Name AND TCK_ID <> @TCK_ID)
        BEGIN
            -- Update the track information
            UPDATE Training_Manager.Track
            SET TCK_Name = @New_TCK_Name,
               
                DEP_id = @New_DEP_id
            WHERE TCK_ID = @TCK_ID;

            PRINT 'Track updated successfully.';
        END
        ELSE
        BEGIN
            PRINT 'Error: The provided new track name is already in use. Please choose a different track name.';
        END
    END
    ELSE
    BEGIN
        PRINT 'Error: Invalid TCK_ID. Track does not exist.';
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateTraningManager]    Script Date: 1/14/2024 12:03:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateTraningManager]
    @TR_ID INT,
    @New_TR_Name NVARCHAR(30)
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if TR_ID exists
    IF EXISTS (SELECT 1 FROM Traning_Manager WHERE TR_ID = @TR_ID)
    BEGIN
        -- Check if the provided New_TR_Name is not empty
        IF LEN(@New_TR_Name) = 0 OR @New_TR_Name IS NULL
        BEGIN
            PRINT 'Error: New Training Manager name cannot be empty.';
            RETURN;
        END

       

       
            -- Update the Training Manager information
            UPDATE Traning_Manager
            SET TR_Name = @New_TR_Name 
            WHERE TR_ID = @TR_ID;

            PRINT 'Training Manager updated successfully.';
       
        
    END
    ELSE
    BEGIN
        PRINT 'Error: Training Manager with specified TR_ID does not exist.';
    END
END;
GO
