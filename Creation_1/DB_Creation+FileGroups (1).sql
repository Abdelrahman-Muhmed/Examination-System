-- Examination System DB Creation
create database T4_Examination_System

------********** Groups file ****************************
---- Primary FG
on PRIMARY 
(
name ='T4_Examination_System.mdf',
filename = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER02\MSSQL\DATA\T4_Examination_System.mdf',
 size =5MB,
 MAXSIZE=50MB,
 filegrowth = 10%
),
(name ='db_mainData.ndf',
filename = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER02\MSSQL\DATA\db_mainData.ndf',
 size =20MB,
  MAXSIZE=100MB,
 FILEGROWTH = 10%
),
---- Student File Group
filegroup Student_FG
(name ='Student_Data.ndf',
filename = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER02\MSSQL\DATA\Student_Data.ndf',
 size =20MB,
 MAXSIZE =unlimited,
 FILEGROWTH = 5MB
 ),
 ---- HR File Group
 filegroup HR_FG
(name ='HR_Data1.ndf',
filename = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER02\MSSQL\DATA\HR_Data1.ndf',
 size =20MB,
 MAXSIZE =unlimited,
 FILEGROWTH = 5MB
 ),
 (name ='HR_Data2.ndf',
filename = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER02\MSSQL\DATA\HR_Data2.ndf',
 size =20MB,
MAXSIZE =unlimited,
 FILEGROWTH = 5MB
 ),
 (name ='HR_Data3.ndf',
filename = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER02\MSSQL\DATA\HR_Data3.ndf',
 size =20MB,
MAXSIZE =unlimited,
 FILEGROWTH = 5MB
 ),
 ---- Exam And Question File Group
filegroup ExamAndQuestion_FG
(name ='Exam_Data.ndf',
filename = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER02\MSSQL\DATA\Exam_Data.ndf',
 size =20MB,
 MAXSIZE =unlimited,
 FILEGROWTH = 5MB
 ),
 (name ='Question_Data.ndf',
filename = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER02\MSSQL\DATA\Question_Data.ndf',
 size =20MB,
 MAXSIZE =unlimited,
 FILEGROWTH = 5MB
 ),(name ='Answer_Data.ndf',
filename = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER02\MSSQL\DATA\Answer_Data.ndf',
 size =20MB,
MAXSIZE =unlimited,
 FILEGROWTH = 5MB
 )
 log on 
 (
 name='T4_Examination_System_Log',
	filename='C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER02\MSSQL\DATA\T4_Examination_System_Log.ldf',
	size=2MB,
	Maxsize=unlimited,
	FILEGROWTH=4MB
 )
 go
 ------********** Schema Creation  ****************************
 Create Schema Student
 go
 Create Schema Instructor
 go
 Create Schema Training_Manager

