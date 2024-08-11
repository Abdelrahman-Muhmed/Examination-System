USE [master]
GO
/****** Object:  Database [Examination_System]    Script Date: 4/29/2023 10:49:00 AM ******/
CREATE DATABASE [Examination_System] 
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Project', FILENAME = N'E:\SQL PROJECT\File Group\Project_SQL.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Project_log', FILENAME = N'E:\SQL PROJECT\File Group\Project_SQL_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 COLLATE SQL_Latin1_General_CP1_CI_AS
GO
ALTER DATABASE [Examination_System]  SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Examination_System] .[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Examination_System]  SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Examination_System]  SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Examination_System]  SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Examination_System]  SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Examination_System]  SET ARITHABORT OFF 
GO
ALTER DATABASE [Examination_System]  SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Examination_System]  SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Examination_System]  SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Examination_System]  SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Examination_System]  SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Examination_System]  SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Examination_System]  SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Examination_System]  SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Examination_System]  SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Examination_System]  SET  DISABLE_BROKER 
GO
ALTER DATABASE [Examination_System]  SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Examination_System]  SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Examination_System]  SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Examination_System]  SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Examination_System]  SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Examination_System]  SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Examination_System]  SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Examination_System]  SET RECOVERY FULL 
GO
ALTER DATABASE [Examination_System]  SET  MULTI_USER 
GO
ALTER DATABASE [Examination_System]  SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Examination_System]  SET DB_CHAINING OFF 
GO
ALTER DATABASE [Examination_System]  SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Examination_System]  SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Examination_System]  SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Examination_System', N'ON'
GO
ALTER DATABASE [Examination_System]  SET QUERY_STORE = OFF
GO

USE [Examination_System] 

/****** Object:  Table [dbo].[Students_take_Exam]    Script Date: 4/29/2023 10:49:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Students_take_Exam](
	[Std_ID] [int] NOT NULL,
	[Exam_ID] [int] NOT NULL,
	[Questions_result] [int] NULL,
	[Std_Answer_Text_Question] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Std_Answer_Choose_Question] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Std_Answer_True_or_False] [bit] NOT NULL,
	[Questions_Id] [int] NOT NULL,
 CONSTRAINT [PK_Students_take_Exam] PRIMARY KEY CLUSTERED 
(
	[Std_ID] ASC,
	[Exam_ID] ASC,
	[Questions_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Intake]    Script Date: 4/29/2023 10:49:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Intake](
	[Intake_ID] [int] NOT NULL,
	[Intake_Name] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_Intake] PRIMARY KEY CLUSTERED 
(
	[Intake_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Branch]    Script Date: 4/29/2023 10:49:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch](
	[Branch_ID] [int] NOT NULL,
	[Branch_Name] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_Branch] PRIMARY KEY CLUSTERED 
(
	[Branch_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Track]    Script Date: 4/29/2023 10:49:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Track](
	[Track_ID] [int] NOT NULL,
	[Track_Name] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_Track] PRIMARY KEY CLUSTERED 
(
	[Track_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Students]    Script Date: 4/29/2023 10:49:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Std_ID] [int] NOT NULL,
	[Std_Name] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Std_Age] [int] NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[Std_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Student_Intake]    Script Date: 4/29/2023 10:49:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Intake](
	[Std_ID] [int] NOT NULL,
	[Intake_ID] [int] NOT NULL,
 CONSTRAINT [PK_Student_Intake] PRIMARY KEY CLUSTERED 
(
	[Std_ID] ASC,
	[Intake_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_Branch]    Script Date: 4/29/2023 10:49:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Branch](
	[Std_ID] [int] NOT NULL,
	[Branch_ID] [int] NOT NULL,
 CONSTRAINT [PK_Student_Branch] PRIMARY KEY CLUSTERED 
(
	[Std_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_Track]    Script Date: 4/29/2023 10:49:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Track](
	[Std_ID] [int] NOT NULL,
	[Track_ID] [int] NOT NULL,
 CONSTRAINT [PK_Student_Track] PRIMARY KEY CLUSTERED 
(
	[Std_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 4/29/2023 10:49:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[Exam_ID] [int] NOT NULL,
	[Exam_Degree] [int] NOT NULL,
	[Allowance_Option] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Normal_Exam] [bit] NOT NULL,
	[Corrective_Exam] [bit] NOT NULL,
 CONSTRAINT [PK_Exam] PRIMARY KEY CLUSTERED 
(
	[Exam_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 4/29/2023 10:49:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[Ins_ID] [int] NOT NULL,
	[Age] [int] NOT NULL,
	[Inst_Name] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Mgr_ID] [int] NULL,
 CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED 
(
	[Ins_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructor_Teach_Course]    Script Date: 4/29/2023 10:49:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor_Teach_Course](
	[Course_ID] [int] NOT NULL,
	[Inst_ID] [int] NOT NULL,
 CONSTRAINT [PK_Instructor_Teach_Course] PRIMARY KEY CLUSTERED 
(
	[Course_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Instructor_Choose_Questions]    Script Date: 4/29/2023 10:49:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor_Choose_Questions](
	[Questions_ID] [int] NOT NULL,
	[Instructor_ID] [int] NOT NULL,
 CONSTRAINT [PK_Instructor_Choose_Questions] PRIMARY KEY CLUSTERED 
(
	[Questions_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Instructor_Sets_Exam]    Script Date: 4/29/2023 10:49:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor_Sets_Exam](
	[Exam_ID] [int] NOT NULL,
	[Inst_ID] [int] NOT NULL,
	[Start_Time] [time](7) NOT NULL,
	[End_Time] [time](7) NOT NULL,
	[Year] [date] NOT NULL,
 CONSTRAINT [PK_Instructor_Sets_Exam] PRIMARY KEY CLUSTERED 
(
	[Exam_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Questions]    Script Date: 4/29/2023 10:49:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[Questions_ID] [int] NOT NULL,
	[Degree] [int] NOT NULL,
	[Text_Questions] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Correct_Answer_Text_Questions] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[True_or_False_Questions] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Correct_Answer_True_or_False] [bit] NULL,
	[Choose_An_Answer_Question] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Correct_Answer_Choose_Question] [nvarchar](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Course_Id] [int] NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[Questions_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Course_Exams]    Script Date: 4/29/2023 10:49:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course_Exams](
	[Exam_ID] [int] NOT NULL,
	[Course_ID] [int] NOT NULL,
 CONSTRAINT [PK_Course_Exams] PRIMARY KEY CLUSTERED 
(
	[Exam_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 4/29/2023 10:49:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[Course_ID] [int] NOT NULL,
	[Min_Degree] [int] NOT NULL,
	[Max_Degree] [int] NOT NULL,
	[Name] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[Course_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course_Branch]    Script Date: 4/29/2023 10:49:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course_Branch](
	[Course_ID] [int] NOT NULL,
	[Branch_ID] [int] NOT NULL,
 CONSTRAINT [PK_Course_Branch] PRIMARY KEY CLUSTERED 
(
	[Course_ID] ASC,
	[Branch_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  View [dbo].[Check_Exams]    Script Date: 4/29/2023 10:49:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[Check_Exams] as
select [dbo].[Intake].[Intake_ID],[dbo].[Intake].[Intake_Name]
from [dbo].[Intake]
GO
/****** Object:  Table [dbo].[Course_Intake]    Script Date: 4/29/2023 10:49:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course_Intake](
	[Course_ID] [int] NOT NULL,
	[Intake_ID] [int] NOT NULL,
 CONSTRAINT [PK_Course_Intake] PRIMARY KEY CLUSTERED 
(
	[Course_ID] ASC,
	[Intake_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course_Track]    Script Date: 4/29/2023 10:49:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course_Track](
	[Course_ID] [int] NOT NULL,
	[Track_ID] [int] NOT NULL,
 CONSTRAINT [PK_Course_Track] PRIMARY KEY CLUSTERED 
(
	[Course_ID] ASC,
	[Track_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructor's_Selected_Students]    Script Date: 4/29/2023 10:49:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor's_Selected_Students](
	[Std_ID] [int] NOT NULL,
	[Inst_ID] [int] NOT NULL,
	[Exam_Id] [int] NOT NULL,
 CONSTRAINT [PK_Instructor's_Selected_Students] PRIMARY KEY CLUSTERED 
(
	[Std_ID] ASC,
	[Inst_ID] ASC,
	[Exam_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Questions_Consist_Exam]    Script Date: 4/29/2023 10:49:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions_Consist_Exam](
	[Questions_ID] [int] NOT NULL,
	[Exam_ID] [int] NOT NULL,
 CONSTRAINT [PK_Questions_Consist_Exam] PRIMARY KEY CLUSTERED 
(
	[Questions_ID] ASC,
	[Exam_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


GO
INSERT [dbo].[Branch] ([Branch_ID], [Branch_Name]) VALUES (1, N'Cairo')
INSERT [dbo].[Branch] ([Branch_ID], [Branch_Name]) VALUES (2, N'Alexandria')
INSERT [dbo].[Branch] ([Branch_ID], [Branch_Name]) VALUES (3, N'Beni-Suef')
INSERT [dbo].[Branch] ([Branch_ID], [Branch_Name]) VALUES (4, N'Mansoura')
INSERT [dbo].[Branch] ([Branch_ID], [Branch_Name]) VALUES (5, N'Tanta')
INSERT [dbo].[Branch] ([Branch_ID], [Branch_Name]) VALUES (6, N'Qina')
GO
INSERT [dbo].[Course] ([Course_ID], [Min_Degree], [Max_Degree], [Name], [Description]) VALUES (1, 10, 60, N'SQL', NULL)
INSERT [dbo].[Course] ([Course_ID], [Min_Degree], [Max_Degree], [Name], [Description]) VALUES (2, 10, 30, N'Java', NULL)
INSERT [dbo].[Course] ([Course_ID], [Min_Degree], [Max_Degree], [Name], [Description]) VALUES (3, 10, 30, N'English', NULL)
INSERT [dbo].[Course] ([Course_ID], [Min_Degree], [Max_Degree], [Name], [Description]) VALUES (4, 10, 30, N'Spanish', NULL)
INSERT [dbo].[Course] ([Course_ID], [Min_Degree], [Max_Degree], [Name], [Description]) VALUES (5, 10, 30, N'HTML', NULL)
INSERT [dbo].[Course] ([Course_ID], [Min_Degree], [Max_Degree], [Name], [Description]) VALUES (6, 10, 30, N'CSS', NULL)
GO
INSERT [dbo].[Course_Branch] ([Course_ID], [Branch_ID]) VALUES (1, 1)
INSERT [dbo].[Course_Branch] ([Course_ID], [Branch_ID]) VALUES (2, 2)
INSERT [dbo].[Course_Branch] ([Course_ID], [Branch_ID]) VALUES (3, 3)
INSERT [dbo].[Course_Branch] ([Course_ID], [Branch_ID]) VALUES (4, 4)
INSERT [dbo].[Course_Branch] ([Course_ID], [Branch_ID]) VALUES (5, 5)
INSERT [dbo].[Course_Branch] ([Course_ID], [Branch_ID]) VALUES (6, 6)
GO
INSERT [dbo].[Course_Exams] ([Exam_ID], [Course_ID]) VALUES (1, 1)
INSERT [dbo].[Course_Exams] ([Exam_ID], [Course_ID]) VALUES (2, 2)
INSERT [dbo].[Course_Exams] ([Exam_ID], [Course_ID]) VALUES (3, 3)
INSERT [dbo].[Course_Exams] ([Exam_ID], [Course_ID]) VALUES (4, 1)
INSERT [dbo].[Course_Exams] ([Exam_ID], [Course_ID]) VALUES (5, 5)
INSERT [dbo].[Course_Exams] ([Exam_ID], [Course_ID]) VALUES (6, 6)
GO
INSERT [dbo].[Course_Intake] ([Course_ID], [Intake_ID]) VALUES (1, 1)
INSERT [dbo].[Course_Intake] ([Course_ID], [Intake_ID]) VALUES (2, 2)
INSERT [dbo].[Course_Intake] ([Course_ID], [Intake_ID]) VALUES (3, 3)
INSERT [dbo].[Course_Intake] ([Course_ID], [Intake_ID]) VALUES (4, 4)
INSERT [dbo].[Course_Intake] ([Course_ID], [Intake_ID]) VALUES (5, 5)
INSERT [dbo].[Course_Intake] ([Course_ID], [Intake_ID]) VALUES (6, 6)
GO
INSERT [dbo].[Course_Track] ([Course_ID], [Track_ID]) VALUES (1, 1)
INSERT [dbo].[Course_Track] ([Course_ID], [Track_ID]) VALUES (2, 2)
INSERT [dbo].[Course_Track] ([Course_ID], [Track_ID]) VALUES (3, 3)
INSERT [dbo].[Course_Track] ([Course_ID], [Track_ID]) VALUES (4, 4)
INSERT [dbo].[Course_Track] ([Course_ID], [Track_ID]) VALUES (5, 5)
INSERT [dbo].[Course_Track] ([Course_ID], [Track_ID]) VALUES (6, 6)
GO
INSERT [dbo].[Exam] ([Exam_ID], [Exam_Degree], [Allowance_Option], [Normal_Exam], [Corrective_Exam]) VALUES (1, 60, NULL, 1, 0)
INSERT [dbo].[Exam] ([Exam_ID], [Exam_Degree], [Allowance_Option], [Normal_Exam], [Corrective_Exam]) VALUES (2, 30, NULL, 0, 1)
INSERT [dbo].[Exam] ([Exam_ID], [Exam_Degree], [Allowance_Option], [Normal_Exam], [Corrective_Exam]) VALUES (3, 20, NULL, 0, 1)
INSERT [dbo].[Exam] ([Exam_ID], [Exam_Degree], [Allowance_Option], [Normal_Exam], [Corrective_Exam]) VALUES (4, 30, NULL, 1, 0)
INSERT [dbo].[Exam] ([Exam_ID], [Exam_Degree], [Allowance_Option], [Normal_Exam], [Corrective_Exam]) VALUES (5, 20, NULL, 0, 1)
INSERT [dbo].[Exam] ([Exam_ID], [Exam_Degree], [Allowance_Option], [Normal_Exam], [Corrective_Exam]) VALUES (6, 30, NULL, 1, 0)
INSERT [dbo].[Exam] ([Exam_ID], [Exam_Degree], [Allowance_Option], [Normal_Exam], [Corrective_Exam]) VALUES (7, 60, NULL, 1, 0)
GO
INSERT [dbo].[Instructor] ([Ins_ID], [Age], [Inst_Name], [Mgr_ID]) VALUES (1, 24, N'Ahmed Fathy', NULL)
INSERT [dbo].[Instructor] ([Ins_ID], [Age], [Inst_Name], [Mgr_ID]) VALUES (2, 20, N'Manal Fahmy', 1)
INSERT [dbo].[Instructor] ([Ins_ID], [Age], [Inst_Name], [Mgr_ID]) VALUES (3, 25, N'Ali Samy', NULL)
INSERT [dbo].[Instructor] ([Ins_ID], [Age], [Inst_Name], [Mgr_ID]) VALUES (4, 25, N'Ali Khaled', NULL)
INSERT [dbo].[Instructor] ([Ins_ID], [Age], [Inst_Name], [Mgr_ID]) VALUES (5, 19, N'Hamdy Fathy', 3)
INSERT [dbo].[Instructor] ([Ins_ID], [Age], [Inst_Name], [Mgr_ID]) VALUES (6, 22, N'Ali Maloul', 4)
GO
INSERT [dbo].[Instructor_Choose_Questions] ([Questions_ID], [Instructor_ID]) VALUES (1, 1)
INSERT [dbo].[Instructor_Choose_Questions] ([Questions_ID], [Instructor_ID]) VALUES (2, 2)
INSERT [dbo].[Instructor_Choose_Questions] ([Questions_ID], [Instructor_ID]) VALUES (3, 3)
INSERT [dbo].[Instructor_Choose_Questions] ([Questions_ID], [Instructor_ID]) VALUES (4, 4)
INSERT [dbo].[Instructor_Choose_Questions] ([Questions_ID], [Instructor_ID]) VALUES (5, 5)
INSERT [dbo].[Instructor_Choose_Questions] ([Questions_ID], [Instructor_ID]) VALUES (6, 6)
GO
INSERT [dbo].[Instructor_Sets_Exam] ([Exam_ID], [Inst_ID], [Start_Time], [End_Time], [Year]) VALUES (1, 1, CAST(N'19:00:00' AS Time), CAST(N'21:00:00' AS Time), CAST(N'2021-02-02' AS Date))
INSERT [dbo].[Instructor_Sets_Exam] ([Exam_ID], [Inst_ID], [Start_Time], [End_Time], [Year]) VALUES (2, 2, CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), CAST(N'2022-03-03' AS Date))
INSERT [dbo].[Instructor_Sets_Exam] ([Exam_ID], [Inst_ID], [Start_Time], [End_Time], [Year]) VALUES (3, 3, CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), CAST(N'2023-04-04' AS Date))
INSERT [dbo].[Instructor_Sets_Exam] ([Exam_ID], [Inst_ID], [Start_Time], [End_Time], [Year]) VALUES (4, 4, CAST(N'05:00:00' AS Time), CAST(N'06:00:00' AS Time), CAST(N'2009-08-08' AS Date))
INSERT [dbo].[Instructor_Sets_Exam] ([Exam_ID], [Inst_ID], [Start_Time], [End_Time], [Year]) VALUES (5, 5, CAST(N'03:00:00' AS Time), CAST(N'04:00:00' AS Time), CAST(N'2008-01-01' AS Date))
INSERT [dbo].[Instructor_Sets_Exam] ([Exam_ID], [Inst_ID], [Start_Time], [End_Time], [Year]) VALUES (6, 6, CAST(N'02:00:00' AS Time), CAST(N'03:00:00' AS Time), CAST(N'2006-07-07' AS Date))
INSERT [dbo].[Instructor_Sets_Exam] ([Exam_ID], [Inst_ID], [Start_Time], [End_Time], [Year]) VALUES (7, 1, CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'2023-04-28' AS Date))
INSERT [dbo].[Instructor_Sets_Exam] ([Exam_ID], [Inst_ID], [Start_Time], [End_Time], [Year]) VALUES (9, 1, CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time), CAST(N'2023-04-28' AS Date))
GO
INSERT [dbo].[Instructor_Teach_Course] ([Course_ID], [Inst_ID]) VALUES (1, 1)
INSERT [dbo].[Instructor_Teach_Course] ([Course_ID], [Inst_ID]) VALUES (2, 2)
INSERT [dbo].[Instructor_Teach_Course] ([Course_ID], [Inst_ID]) VALUES (3, 3)
INSERT [dbo].[Instructor_Teach_Course] ([Course_ID], [Inst_ID]) VALUES (4, 4)
INSERT [dbo].[Instructor_Teach_Course] ([Course_ID], [Inst_ID]) VALUES (5, 5)
INSERT [dbo].[Instructor_Teach_Course] ([Course_ID], [Inst_ID]) VALUES (6, 6)
GO
INSERT [dbo].[Instructor's_Selected_Students] ([Std_ID], [Inst_ID], [Exam_Id]) VALUES (1, 1, 1)
INSERT [dbo].[Instructor's_Selected_Students] ([Std_ID], [Inst_ID], [Exam_Id]) VALUES (1, 1, 2)
GO
INSERT [dbo].[Intake] ([Intake_ID], [Intake_Name]) VALUES (1, N'Programming')
INSERT [dbo].[Intake] ([Intake_ID], [Intake_Name]) VALUES (2, N'English')
INSERT [dbo].[Intake] ([Intake_ID], [Intake_Name]) VALUES (3, N'French')
INSERT [dbo].[Intake] ([Intake_ID], [Intake_Name]) VALUES (4, N'Communication Skills')
INSERT [dbo].[Intake] ([Intake_ID], [Intake_Name]) VALUES (5, N'SQL')
INSERT [dbo].[Intake] ([Intake_ID], [Intake_Name]) VALUES (6, N'C#')
GO
INSERT [dbo].[Questions] ([Questions_ID], [Degree], [Text_Questions], [Correct_Answer_Text_Questions], [True_or_False_Questions], [Correct_Answer_True_or_False], [Choose_An_Answer_Question], [Correct_Answer_Choose_Question], [Course_Id]) VALUES (1, 30, N'Describe Database.', N'Collection of tables.', N'Is C# purly OOP?', 0, N'The first true object oriented language is: a) C++. b) SmallTalk. c) C#.', N'b', 1)
INSERT [dbo].[Questions] ([Questions_ID], [Degree], [Text_Questions], [Correct_Answer_Text_Questions], [True_or_False_Questions], [Correct_Answer_True_or_False], [Choose_An_Answer_Question], [Correct_Answer_Choose_Question], [Course_Id]) VALUES (2, 30, N'What is a Primary key?', N'Unique key and not null constraint.', N'A relation might have multiple foreign keys?', 1, N'The first true object oriented language is: a) C++. b) SmallTalk. c) C#.', N'b', 1)
INSERT [dbo].[Questions] ([Questions_ID], [Degree], [Text_Questions], [Correct_Answer_Text_Questions], [True_or_False_Questions], [Correct_Answer_True_or_False], [Choose_An_Answer_Question], [Correct_Answer_Choose_Question], [Course_Id]) VALUES (3, 30, N'What is an aliac command ?', N'It is refered in where clause to identify table or column.', N'A relation might have multiple foreign keys?', 1, N'Which of the following is not an SQL command: a) forget. b) select. c) where', N'a', 2)
INSERT [dbo].[Questions] ([Questions_ID], [Degree], [Text_Questions], [Correct_Answer_Text_Questions], [True_or_False_Questions], [Correct_Answer_True_or_False], [Choose_An_Answer_Question], [Correct_Answer_Choose_Question], [Course_Id]) VALUES (4, 30, N'What is SQL?', N'SQL stands for Structured Query Language.', N'Is alter a DDL command?', 1, N'The primary key can be: a) null. b) not null. c) both null and not null.', N'b', 2)
INSERT [dbo].[Questions] ([Questions_ID], [Degree], [Text_Questions], [Correct_Answer_Text_Questions], [True_or_False_Questions], [Correct_Answer_True_or_False], [Choose_An_Answer_Question], [Correct_Answer_Choose_Question], [Course_Id]) VALUES (5, 30, N'What is a join?', N'It is a keyword to query data from more tables.', N'Each column can have more than one data type?', 0, N'The primary key can be: a) null. b) not null. c) both null and not null.', N'b', 5)
INSERT [dbo].[Questions] ([Questions_ID], [Degree], [Text_Questions], [Correct_Answer_Text_Questions], [True_or_False_Questions], [Correct_Answer_True_or_False], [Choose_An_Answer_Question], [Correct_Answer_Choose_Question], [Course_Id]) VALUES (6, 30, N'What is a DB query?', N'It is a code that is written to get information back from the DB.', N'The condition in a where clause can refer to only one value?', 0, N'What is a table joined with itself called: a) Join. b) Outer Join. c) self-join.', N'c', 5)
GO
INSERT [dbo].[Questions_Consist_Exam] ([Questions_ID], [Exam_ID]) VALUES (1, 1)
INSERT [dbo].[Questions_Consist_Exam] ([Questions_ID], [Exam_ID]) VALUES (1, 7)
INSERT [dbo].[Questions_Consist_Exam] ([Questions_ID], [Exam_ID]) VALUES (2, 1)
INSERT [dbo].[Questions_Consist_Exam] ([Questions_ID], [Exam_ID]) VALUES (2, 7)
INSERT [dbo].[Questions_Consist_Exam] ([Questions_ID], [Exam_ID]) VALUES (3, 3)
INSERT [dbo].[Questions_Consist_Exam] ([Questions_ID], [Exam_ID]) VALUES (4, 4)
INSERT [dbo].[Questions_Consist_Exam] ([Questions_ID], [Exam_ID]) VALUES (5, 5)
INSERT [dbo].[Questions_Consist_Exam] ([Questions_ID], [Exam_ID]) VALUES (6, 6)
GO
INSERT [dbo].[Student_Branch] ([Std_ID], [Branch_ID]) VALUES (1, 1)
INSERT [dbo].[Student_Branch] ([Std_ID], [Branch_ID]) VALUES (2, 1)
INSERT [dbo].[Student_Branch] ([Std_ID], [Branch_ID]) VALUES (3, 2)
INSERT [dbo].[Student_Branch] ([Std_ID], [Branch_ID]) VALUES (4, 3)
INSERT [dbo].[Student_Branch] ([Std_ID], [Branch_ID]) VALUES (5, 4)
INSERT [dbo].[Student_Branch] ([Std_ID], [Branch_ID]) VALUES (6, 5)
GO
INSERT [dbo].[Student_Intake] ([Std_ID], [Intake_ID]) VALUES (1, 1)
INSERT [dbo].[Student_Intake] ([Std_ID], [Intake_ID]) VALUES (2, 2)
INSERT [dbo].[Student_Intake] ([Std_ID], [Intake_ID]) VALUES (3, 3)
INSERT [dbo].[Student_Intake] ([Std_ID], [Intake_ID]) VALUES (4, 4)
INSERT [dbo].[Student_Intake] ([Std_ID], [Intake_ID]) VALUES (5, 5)
INSERT [dbo].[Student_Intake] ([Std_ID], [Intake_ID]) VALUES (6, 6)
GO
INSERT [dbo].[Student_Track] ([Std_ID], [Track_ID]) VALUES (1, 1)
INSERT [dbo].[Student_Track] ([Std_ID], [Track_ID]) VALUES (2, 2)
INSERT [dbo].[Student_Track] ([Std_ID], [Track_ID]) VALUES (3, 3)
INSERT [dbo].[Student_Track] ([Std_ID], [Track_ID]) VALUES (4, 4)
INSERT [dbo].[Student_Track] ([Std_ID], [Track_ID]) VALUES (5, 5)
INSERT [dbo].[Student_Track] ([Std_ID], [Track_ID]) VALUES (6, 6)
GO
INSERT [dbo].[Students] ([Std_ID], [Std_Name], [Std_Age]) VALUES (1, N'Ahmed Gamal', 17)
INSERT [dbo].[Students] ([Std_ID], [Std_Name], [Std_Age]) VALUES (2, N'Fahmy Ahmed', 16)
INSERT [dbo].[Students] ([Std_ID], [Std_Name], [Std_Age]) VALUES (3, N'Magdy Atia', 19)
INSERT [dbo].[Students] ([Std_ID], [Std_Name], [Std_Age]) VALUES (4, N'Kareem Fathy', 20)
INSERT [dbo].[Students] ([Std_ID], [Std_Name], [Std_Age]) VALUES (5, N'Ayman Magdy', 20)
INSERT [dbo].[Students] ([Std_ID], [Std_Name], [Std_Age]) VALUES (6, N'Omar Saleh', 18)
GO
INSERT [dbo].[Students_take_Exam] ([Std_ID], [Exam_ID], [Questions_result], [Std_Answer_Text_Question], [Std_Answer_Choose_Question], [Std_Answer_True_or_False], [Questions_Id]) VALUES (1, 1, 10, N'collection of table', N'b', 1, 1)
INSERT [dbo].[Students_take_Exam] ([Std_ID], [Exam_ID], [Questions_result], [Std_Answer_Text_Question], [Std_Answer_Choose_Question], [Std_Answer_True_or_False], [Questions_Id]) VALUES (1, 1, 20, N'collection of table', N'b', 1, 2)
GO
INSERT [dbo].[Track] ([Track_ID], [Track_Name]) VALUES (1, N'.net')
INSERT [dbo].[Track] ([Track_ID], [Track_Name]) VALUES (2, N'Devops')
INSERT [dbo].[Track] ([Track_ID], [Track_Name]) VALUES (3, N'2D')
INSERT [dbo].[Track] ([Track_ID], [Track_Name]) VALUES (4, N'SW testing')
INSERT [dbo].[Track] ([Track_ID], [Track_Name]) VALUES (5, N'e-learning')
INSERT [dbo].[Track] ([Track_ID], [Track_Name]) VALUES (6, N'GIS')
GO
ALTER TABLE [dbo].[Course_Branch]  WITH CHECK ADD  CONSTRAINT [FK_Course_Branch_Branch] FOREIGN KEY([Branch_ID])
REFERENCES [dbo].[Branch] ([Branch_ID])
GO
ALTER TABLE [dbo].[Course_Branch] CHECK CONSTRAINT [FK_Course_Branch_Branch]
GO
ALTER TABLE [dbo].[Course_Branch]  WITH CHECK ADD  CONSTRAINT [FK_Course_Branch_Course] FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([Course_ID])
GO
ALTER TABLE [dbo].[Course_Branch] CHECK CONSTRAINT [FK_Course_Branch_Course]
GO
ALTER TABLE [dbo].[Course_Exams]  WITH CHECK ADD  CONSTRAINT [FK_Course_Exams_Course] FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([Course_ID])
GO
ALTER TABLE [dbo].[Course_Exams] CHECK CONSTRAINT [FK_Course_Exams_Course]
GO
ALTER TABLE [dbo].[Course_Intake]  WITH CHECK ADD  CONSTRAINT [FK_Course_Intake_Course] FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([Course_ID])
GO
ALTER TABLE [dbo].[Course_Intake] CHECK CONSTRAINT [FK_Course_Intake_Course]
GO
ALTER TABLE [dbo].[Course_Intake]  WITH CHECK ADD  CONSTRAINT [FK_Course_Intake_Intake] FOREIGN KEY([Intake_ID])
REFERENCES [dbo].[Intake] ([Intake_ID])
GO
ALTER TABLE [dbo].[Course_Intake] CHECK CONSTRAINT [FK_Course_Intake_Intake]
GO
ALTER TABLE [dbo].[Course_Track]  WITH CHECK ADD  CONSTRAINT [FK_Course_Track_Course] FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([Course_ID])
GO
ALTER TABLE [dbo].[Course_Track] CHECK CONSTRAINT [FK_Course_Track_Course]
GO
ALTER TABLE [dbo].[Course_Track]  WITH CHECK ADD  CONSTRAINT [FK_Course_Track_Track] FOREIGN KEY([Track_ID])
REFERENCES [dbo].[Track] ([Track_ID])
GO
ALTER TABLE [dbo].[Course_Track] CHECK CONSTRAINT [FK_Course_Track_Track]
GO
ALTER TABLE [dbo].[Instructor]  WITH CHECK ADD  CONSTRAINT [FK_Instructor_Mngr] FOREIGN KEY([Mgr_ID])
REFERENCES [dbo].[Instructor] ([Ins_ID])
GO
ALTER TABLE [dbo].[Instructor] CHECK CONSTRAINT [FK_Instructor_Mngr]
GO
ALTER TABLE [dbo].[Instructor_Choose_Questions]  WITH CHECK ADD  CONSTRAINT [FK_Instructor_Choose_Questions_Instructor] FOREIGN KEY([Instructor_ID])
REFERENCES [dbo].[Instructor] ([Ins_ID])
GO
ALTER TABLE [dbo].[Instructor_Choose_Questions] CHECK CONSTRAINT [FK_Instructor_Choose_Questions_Instructor]
GO
ALTER TABLE [dbo].[Instructor_Sets_Exam]  WITH CHECK ADD  CONSTRAINT [FK_Instructor_Sets_Exam_Instructor] FOREIGN KEY([Inst_ID])
REFERENCES [dbo].[Instructor] ([Ins_ID])
GO
ALTER TABLE [dbo].[Instructor_Sets_Exam] CHECK CONSTRAINT [FK_Instructor_Sets_Exam_Instructor]
GO
ALTER TABLE [dbo].[Instructor_Teach_Course]  WITH CHECK ADD  CONSTRAINT [FK_Instructor_Teach_Course_Instructor] FOREIGN KEY([Inst_ID])
REFERENCES [dbo].[Instructor] ([Ins_ID])
GO
ALTER TABLE [dbo].[Instructor_Teach_Course] CHECK CONSTRAINT [FK_Instructor_Teach_Course_Instructor]
GO
ALTER TABLE [dbo].[Instructor's_Selected_Students]  WITH CHECK ADD  CONSTRAINT [FK_Instructor's_Selected_Students_Exam] FOREIGN KEY([Exam_Id])
REFERENCES [dbo].[Exam] ([Exam_ID])
GO
ALTER TABLE [dbo].[Instructor's_Selected_Students] CHECK CONSTRAINT [FK_Instructor's_Selected_Students_Exam]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_Course] FOREIGN KEY([Course_Id])
REFERENCES [dbo].[Course] ([Course_ID])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_Course]
GO
ALTER TABLE [dbo].[Questions_Consist_Exam]  WITH CHECK ADD  CONSTRAINT [FK_Questions_Consist_Exam_Exam] FOREIGN KEY([Exam_ID])
REFERENCES [dbo].[Exam] ([Exam_ID])
GO
ALTER TABLE [dbo].[Questions_Consist_Exam] CHECK CONSTRAINT [FK_Questions_Consist_Exam_Exam]
GO
ALTER TABLE [dbo].[Student_Branch]  WITH CHECK ADD  CONSTRAINT [FK_Student_Branch_Branch] FOREIGN KEY([Branch_ID])
REFERENCES [dbo].[Branch] ([Branch_ID])
GO
ALTER TABLE [dbo].[Student_Branch] CHECK CONSTRAINT [FK_Student_Branch_Branch]
GO
ALTER TABLE [dbo].[Student_Intake]  WITH CHECK ADD  CONSTRAINT [FK_Student_Intake_Intake] FOREIGN KEY([Intake_ID])
REFERENCES [dbo].[Intake] ([Intake_ID])
GO
ALTER TABLE [dbo].[Student_Intake] CHECK CONSTRAINT [FK_Student_Intake_Intake]
GO
ALTER TABLE [dbo].[Student_Intake]  WITH CHECK ADD  CONSTRAINT [FK_Student_Intake_Students] FOREIGN KEY([Std_ID])
REFERENCES [dbo].[Students] ([Std_ID])
GO
ALTER TABLE [dbo].[Student_Intake] CHECK CONSTRAINT [FK_Student_Intake_Students]
GO
ALTER TABLE [dbo].[Student_Track]  WITH CHECK ADD  CONSTRAINT [FK_Student_Track_Track] FOREIGN KEY([Track_ID])
REFERENCES [dbo].[Track] ([Track_ID])
GO
ALTER TABLE [dbo].[Student_Track] CHECK CONSTRAINT [FK_Student_Track_Track]
GO
ALTER TABLE [dbo].[Students_take_Exam]  WITH CHECK ADD  CONSTRAINT [FK_Students_take_Exam_Exam] FOREIGN KEY([Exam_ID])
REFERENCES [dbo].[Exam] ([Exam_ID])
GO
ALTER TABLE [dbo].[Students_take_Exam] CHECK CONSTRAINT [FK_Students_take_Exam_Exam]
GO
ALTER TABLE [dbo].[Students_take_Exam]  WITH CHECK ADD  CONSTRAINT [FK_Students_take_Exam_Questions] FOREIGN KEY([Questions_Id])
REFERENCES [dbo].[Questions] ([Questions_ID])
GO
ALTER TABLE [dbo].[Students_take_Exam] CHECK CONSTRAINT [FK_Students_take_Exam_Questions]
GO
ALTER TABLE [dbo].[Students_take_Exam]  WITH CHECK ADD  CONSTRAINT [FK_Students_take_Exam_Students] FOREIGN KEY([Std_ID])
REFERENCES [dbo].[Students] ([Std_ID])
GO
ALTER TABLE [dbo].[Students_take_Exam] CHECK CONSTRAINT [FK_Students_take_Exam_Students]
GO
/****** Object:  StoredProcedure [dbo].[CorrectExamForStudent]    Script Date: 4/29/2023 10:49:01 AM ******/

USE [master]
GO
ALTER DATABASE [Examination_System]  SET  READ_WRITE 
GO
