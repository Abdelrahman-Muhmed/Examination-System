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
---- Student FG
filegroup Student_FG
(name ='Student_Data.ndf',
filename = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER02\MSSQL\DATA\Student_Data.ndf',
 size =20MB,
 MAXSIZE =unlimited,
 FILEGROWTH = 5MB
 ),
 ---- HR FG
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
 ---- Exam And Question FG
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

 ------********** Schema Creation  ****************************
 Create Schema Student
 /*

 -student takes courses 
 -student perform exam 
 -
 */
 Create Schema Instructor
 /*
 -exam
 -chosn Student 
 
 */
 Create Schema Training_Manager

 /*
 -Department 
 -Track 
 -Branch 
 -Intak 
 -student 
 
 */

 --...........................Create Traning Manger Table.................................. 
 CREATE TABLE Traning_Manager (
 TR_id INT IDENTITY (1 , 1),
 TR_name NVARCHAR(30) NOT NULL,
 TR_username NVARCHAR(50) NOT NULL,
 CONSTRAINT TR_PR_K PRIMARY KEY(TR_id),
 CONSTRAINT TR_user_unique UNIQUE(TR_username)
 ) ON HR_FG

  --...........................Create Department Table.................................. 
 CREATE TABLE Department (
 DEP_id INT IDENTITY (1 , 1),
 DEP_name NVARCHAR(30) NOT NULL,
 DEP_F_id INT,
 CONSTRAINT DEP_PR_K PRIMARY KEY(DEP_id),
 CONSTRAINT DEP_TR_F FOREIGN KEY (DEP_F_id) REFERENCES Traning_Manager(TR_id)
 ON DELETE SET NULL ON UPDATE CASCADE
 ) ON HR_FG

   --...........................Create Track Table.................................. 
 CREATE TABLE Track (
 TCK_id INT IDENTITY (1 , 1),
 TCK_name NVARCHAR(30) NOT NULL,     
 TCK_TR_id INT,
 TCK_DEP_id INT ,
 CONSTRAINT TCK_PR_K PRIMARY KEY (TCK_id),
 CONSTRAINT TCK_TR_F FOREIGN KEY (TCK_TR_id) REFERENCES Traning_Manager(TR_id)
 ON DELETE SET NULL ON UPDATE CASCADE ,
 CONSTRAINT TCK_DEP FOREIGN KEY (TCK_DEP_id) REFERENCES Department(DEP_id)
 ON DELETE SET NULL 
 ) ON HR_FG

 --...........................Create Branch Table.................................. 
 CREATE TABLE Branch (
 BR_id INT IDENTITY (1 , 1),
 BR_name NVARCHAR(30) NOT NULL,
 BR_F_id INT,
 CONSTRAINT BR_PR_K PRIMARY KEY(BR_id),
 CONSTRAINT BR_TR_F FOREIGN KEY (BR_F_id) REFERENCES Traning_Manager(TR_id)
 ON DELETE SET NULL ON UPDATE CASCADE 
 ) ON HR_FG
 
 --...........................Create Intake Table.................................. 
 CREATE TABLE Intake (
 INT_id INT IDENTITY (1 , 1),
 INT_name NVARCHAR(30) NOT NULL,
 INT_F_id INT,
 CONSTRAINT INT_PR_K PRIMARY KEY(INT_id),
 CONSTRAINT INT_TR_F FOREIGN KEY (INT_F_id) REFERENCES Traning_Manager(TR_id)
 ON DELETE SET NULL ON UPDATE CASCADE  
) ON HR_FG

 --...........................Create Student Table.................................. 
CREATE TABLE Student (
ST_id INT IDENTITY (1 , 1),
ST_name NVARCHAR(30) NOT NULL,            
ST_age INT NOT NULL,
ST_adress NVARCHAR(50),
ST_personal NVARCHAR(50),
ST_username NVARCHAR(30) UNIQUE NOT NULL,
ST_TCK_id INT,
ST_TR_id INT,
ST_IN_id INT,
ST_BR_id INT,
CONSTRAINT CK_ST_age CHECK (ST_age < 30),
CONSTRAINT ST_PR_K PRIMARY KEY (ST_id),
CONSTRAINT ST_TCK FOREIGN KEY (ST_TCK_id) REFERENCES Track(TCK_id)
ON DELETE SET NULL ON UPDATE NO ACTION ,
CONSTRAINT ST_TR FOREIGN KEY (ST_TR_id) REFERENCES Traning_Manager(TR_id)
ON DELETE SET NULL ON UPDATE NO ACTION ,
CONSTRAINT ST_IN FOREIGN KEY (ST_IN_id) REFERENCES Intake(INT_id)
ON DELETE SET NULL ON UPDATE NO ACTION ,
CONSTRAINT ST_BR FOREIGN KEY (ST_BR_id) REFERENCES Branch (BR_id)
ON DELETE SET NULL ON UPDATE NO ACTION 
)ON Student_FG

 --...........................Create Chosen_Student Table.................................. 
 CREATE TABLE Chosen_Student (
 CHS_id INT IDENTITY (1 , 1),
 CH_ST_id INT,
 EX_date_id date default year(getdate()),
 CH_osen NVARCHAR(30),
 CHS_EX_id INT,
 INS_id INT,
 CONSTRAINT CH_ST_F FOREIGN KEY (CH_ST_id) REFERENCES Student(ST_id)
 ON DELETE SET NULL ON UPDATE CASCADE ,
 CONSTRAINT CHS_EX_F FOREIGN KEY (CHS_EX_id) REFERENCES Exam(EX_ID)
 ON DELETE SET NULL ON UPDATE CASCADE ,
 CONSTRAINT CHS_INS_F FOREIGN KEY(INS_id) REFERENCES Instructor(INS_ID)
 ON DELETE SET NULL ON UPDATE CASCADE 
 )ON Student_FG