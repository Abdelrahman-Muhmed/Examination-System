--  DB table Creation
use T4_Examination_System


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

-- Instructor table
Create table Instructor 
(
	INS_ID  int identity (1,1),
	INS_Name Nvarchar(20) not null ,
	INS_Age  int ,
	INS_Address nvarchar(20) ,
	INS_PersonalData nvarchar(30),
	constraint PK_Instructor primary Key (INS_ID)
)on HR_FG

-- Course table
Create table Course 
(
	C_ID  int identity (1,1),
	C_Name Nvarchar(20) not null ,
	C_Description nvarchar(100) ,
	C_Min_Degree float not null,
	C_Max_Degree float not null,
	Inst_Id int ,
	constraint PK_Course primary Key (C_ID),
	constraint FK_Course_Instructor_InstID foreign key (Inst_Id) references Instructor (INS_ID)
				on update Cascade on delete set null,
	constraint CK_Degree check (C_Min_Degree < C_Max_Degree)
)on HR_FG

-- Course table
Create table Question
(
	Q_ID  int identity (1,1),
	Q_Type Nvarchar(20) not null ,
	Q_Body nvarchar(200) not null ,
	Q_Correct_Answer nvarchar(10) not null,
	Q_CH1 nvarchar(200),
	Q_CH2 nvarchar(200),
	Q_CH3 nvarchar(200),
	Q_CH4 nvarchar(200),
	Cour_Id int ,
	constraint PK_Question primary Key (Q_ID),
	constraint FK_Question_Course_CoursID foreign key (Cour_Id) references Course (C_ID)
				on update Cascade on delete set null,
	constraint CK_Correct_Ans check (Q_Correct_Answer in('T','F','A','B','C','D')),
	constraint CK_CH1 check (Q_CH1 like 'A%') ,
	constraint CK_CH2 check (Q_CH2 like 'B%') ,
	constraint CK_CH3 check (Q_CH3 like 'C%') ,
	constraint CK_CH4 check (Q_CH4 like 'D%') 
)on ExamAndQuestion_FG


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
CONSTRAINT CHECK CK_ST_age(ST_age < 30),
CONSTRAINT ST_PR_K PRIMARY KEY (ST_id),
CONSTRAINT ST_TCK FOREIGN KEY (ST_TCK_id) REFERENCES Track(TCK_id)
ON DELETE SET NULL ON UPDATE CASCADE ,
CONSTRAINT ST_TR FOREIGN KEY (ST_TR_id) REFERENCES Traning_Manager(TR_id)
ON DELETE SET NULL ON UPDATE CASCADE ,
CONSTRAINT ST_IN FOREIGN KEY (ST_IN_id) REFERENCES Intake(INT_id)
ON DELETE SET NULL ON UPDATE CASCADE ,
CONSTRAINT ST_BR FOREIGN KEY (ST_BR_id) REFERENCES Branch (BR_id)
ON DELETE SET NULL ON UPDATE CASCADE 
)ON Student_FG


-- Exam table
Create table Instructor.Exam 
(
	EX_ID  int identity (1,1),
	EX_Type Nvarchar(20) not null ,
	EX_Start_Time time not null ,
	EX_End_Time time not null ,
	EX_total_Time  as (EX_End_Time -EX_Start_Time),
	EX_Year date default( Year( getdate() )) ,
	EX_Multi_Q_Num  int not null ,
	EX_Multi_Q_Degree  float not null ,
	EX_T_F_Q_Num  int not null ,
	EX_T_F_Q_Degree  float not null ,
	--WHEN 1 then 'TRUE' / WHEN 0 then 'FALSE'
	EX_Allowance_Options bit default(0) not null ,
	Cour_Id int,
	Inst_Id int,
	Tck_Id int,
	Br_Id int,
	Intake_Id int ,
	constraint PK_Exam primary Key (EX_ID),
	constraint FK_Exam_Course_CoursID foreign key (Cour_Id) references Course (C_ID)
				on update Cascade on delete set null,
	constraint FK_Exam_Instructor_InstID foreign key (Inst_Id) references Instructor (INS_ID)
				on update Cascade on delete set null,
	constraint FK_Exam_Track_TckID foreign key (Tck_Id) references Track (TCK_id)
				on update Cascade on delete set null,
	constraint FK_Exam_Branch_CouID foreign key (Br_Id) references Branch (BR_id)
				on update Cascade on delete set null,
	constraint FK_Exam_Intake_IntakID foreign key (Intake_Id) references Intake (INT_id)
				on update Cascade on delete set null,
	constraint CK_Exam_type check (EX_Start_Time < EX_End_Time),
	constraint CK_time check (EX_Start_Time < EX_End_Time),
	constraint CK_MultiNum check (EX_Multi_Q_Num>=1) ,
	constraint CK_T_F_Num check (EX_T_F_Q_Num>=1),
	constraint CK_MultiDegree check (EX_Multi_Q_Degree>0) ,
	constraint CK_T_F_Degree check (EX_T_F_Q_Degree>0)
)on ExamAndQuestion_FG

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


----start Relation tables
----
 CREATE TABLE Student.Student_Takes_Course
(
    St_ID INT,
    Cour_ID INT,
    CONSTRAINT PK_StudentTakesCourse PRIMARY KEY (St_ID, Cour_ID),
    CONSTRAINT FK_StudentTakesCourse_StudentID FOREIGN KEY (St_ID) REFERENCES Student.Student(Student_ID)
				on update cascade on delete set null,
	CONSTRAINT FK_StudentTakesCourse_CourseID FOREIGN KEY (Cour_ID) REFERENCES Course(C_ID) 
				on update cascade on delete set null
)ON Student_FG;

-----

CREATE TABLE Exam_Has_Question
(
    Exam_ID INT,
    Question_ID INT,
    CONSTRAINT PK_Exam_Has_Question_ID  PRIMARY KEY  (Exam_ID, Question_ID),
	CONSTRAINT FK_Exam_Has_Question_ExamID FOREIGN KEY (Exam_ID) REFERENCES Instructor.Exam (Ex_ID)
				on update cascade on delete set null ,
	CONSTRAINT FK_Exam_Has_Question_QuestionID FOREIGN KEY (Question_ID) REFERENCES Question(Q_ID) 
				on update cascade on delete set null ,
)ON ExamAndQuestion_FG;
-----
CREATE TABLE Student.Student_Perform_Exam
(
    Student_ID INT,
    Exam_ID INT,
    Total_Result float,
   CONSTRAINT PK_Student_Perform_Exam  PRIMARY KEY (Student_ID, Exam_ID),
   CONSTRAINT KF_StudentID FOREIGN KEY (Student_ID) REFERENCES Student.Student(Student_ID) 
				on update cascade on delete set null,
   CONSTRAINT FK_ExamID FOREIGN KEY (Exam_ID) REFERENCES Instructor.Exam(Ex_ID) 
				on update cascade on delete set null
)ON Student_FG;
----end Relation tables

--- Student Answer Table
Create table Student_Answer
(
    StuPerEX_Student_ID INT,
    Stu_Q_Exam_ID INT,
    ExHasQ_Question_ID INT,
    CONSTRAINT PK_Student_Answer_ID  PRIMARY KEY  (StuPerEX_Student_ID, Stu_Q_Exam_ID,ExHasQ_Question_ID),
	CONSTRAINT FK_Exam_Has_Question_ExamID FOREIGN KEY (Stu_Q_Exam_ID) REFERENCES Exam_Has_Question (PK_Exam_Has_Question_ID)
				on update cascade on delete set null ,
	CONSTRAINT FK_Exam_Has_Question_QuestionID FOREIGN KEY (Question_ID) REFERENCES Question(Q_ID) 
				on update cascade on delete set null ,
)ON ExamAndQuestion_FG;
