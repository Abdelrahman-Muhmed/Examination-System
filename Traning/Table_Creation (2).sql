--  DB table Creation
use T4_Examination_System

 --...........................Create Traning Manger Table.................................. 
 CREATE TABLE Traning_Manager (
	 TR_ID INT IDENTITY (1 , 1),
	 TR_Name NVARCHAR(30) NOT NULL,
	 TR_UserName NVARCHAR(50) NOT NULL,
	 CONSTRAINT PK_Traning_Manager PRIMARY KEY(TR_ID),
	 CONSTRAINT Unique_TraningManager_UserName UNIQUE(TR_UserName)
 ) ON HR_FG

  --...........................Create Department Table.................................. 
 CREATE TABLE Training_Manager.Department (
	 DEP_ID INT IDENTITY (1 , 1),
	 DEP_Name NVARCHAR(30) NOT NULL,
	 TR_id INT,
	 CONSTRAINT PK_Department PRIMARY KEY(DEP_ID),
	 CONSTRAINT FK_Department_TraningManager_TrId FOREIGN KEY (TR_id) REFERENCES Traning_Manager(TR_ID)
					ON DELETE SET NULL ON UPDATE CASCADE
 ) ON HR_FG

   --...........................Create Track Table.................................. 
 CREATE TABLE Training_Manager.Track (
	 TCK_ID INT IDENTITY (1 , 1),
	 TCK_Name NVARCHAR(30) NOT NULL,     
	 TR_id INT,
	 DEP_id INT ,
	 CONSTRAINT PK_Track PRIMARY KEY (TCK_ID),
	 CONSTRAINT FK_Track_TraningManager_TrId FOREIGN KEY (TR_id) REFERENCES Traning_Manager(TR_ID)
				 ON DELETE SET NULL ON UPDATE CASCADE ,
	 CONSTRAINT FK_Track_Department_DEP_id FOREIGN KEY (DEP_id) REFERENCES Training_Manager.Department(DEP_ID)
	 ON DELETE SET NULL 
 ) ON HR_FG

 --...........................Create Branch Table.................................. 
 CREATE TABLE Training_Manager.Branch (
	 BR_ID INT IDENTITY (1 , 1),
	 BR_Name NVARCHAR(30) NOT NULL,
	 TR_id INT,
	 CONSTRAINT Pk_Branch PRIMARY KEY(BR_ID),
	 CONSTRAINT FK_Branch_TraningManager_TrId FOREIGN KEY (TR_id) REFERENCES Traning_Manager(TR_ID)
					ON DELETE SET NULL ON UPDATE CASCADE 
 ) ON HR_FG
 
 --...........................Create Intake Table.................................. 
 CREATE TABLE Training_Manager.Intake (
	 INT_ID INT IDENTITY (1 , 1),
	 INT_Name NVARCHAR(30) NOT NULL,
	 TR_id INT,
	 CONSTRAINT PK_Intake PRIMARY KEY(INT_ID),
	 CONSTRAINT FK_Intake_TraningManager_TrId FOREIGN KEY (TR_id) REFERENCES Traning_Manager(TR_ID)
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
	INS_UserName nvarchar(50)not null,
	constraint PK_Instructor primary Key (INS_ID),
	CONSTRAINT CK_Inst_Age CHECK(INS_Age > 22),
	constraint Unique_Instructor_UserName UNIQUE(INS_UserName)
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
CREATE TABLE Training_Manager.Student (
	ST_ID INT IDENTITY (1 , 1),
	ST_Name NVARCHAR(30) NOT NULL,            
	ST_Age INT NOT NULL,
	ST_Address NVARCHAR(50),
	ST_Personal_Data NVARCHAR(50),
	ST_UserName NVARCHAR(30)  NOT NULL,
	ST_TCK_id INT,
	ST_TR_id INT,
	ST_IN_id INT,
	ST_BR_id INT,
	CONSTRAINT PK_Student PRIMARY KEY (ST_id),
	CONSTRAINT FK_Student_Track_TckId FOREIGN KEY (ST_TCK_id) REFERENCES Training_Manager.Track(TCK_ID)
				ON DELETE SET NULL ON UPDATE No Action ,
	CONSTRAINT FK_Student_TraningManager_TrId FOREIGN KEY (ST_TR_id) REFERENCES Traning_Manager(TR_ID)
				ON DELETE SET NULL ON UPDATE No Action ,
	CONSTRAINT FK_Student_Intake_IntId FOREIGN KEY (ST_IN_id) REFERENCES Training_Manager.Intake(INT_ID)
				ON DELETE SET NULL ON UPDATE No Action ,
	CONSTRAINT FK_Student_Branch_BrId FOREIGN KEY (ST_BR_id) REFERENCES Training_Manager.Branch (BR_ID)
				ON DELETE SET NULL ON UPDATE No Action ,
	CONSTRAINT CK_ST_age CHECK (ST_age < 30) ,
	constraint Unique_Student_UserName UNIQUE(ST_UserName)
)ON Student_FG


-- Exam table
Create table Instructor.Exam 
(
	EX_ID  int identity (1,1),
	EX_Type Nvarchar(20) not null default ('Exam')  ,
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
	constraint FK_Exam_Track_TckID foreign key (Tck_Id) references Training_Manager.Track (TCK_id)
				on update Cascade on delete set null,
	constraint FK_Exam_Branch_CouID foreign key (Br_Id) references Training_Manager.Branch (BR_id)
				on update Cascade on delete set null,
	constraint FK_Exam_Intake_IntakID foreign key (Intake_Id) references Training_Manager.Intake (INT_id)
				on update Cascade on delete set null,
	constraint CK_Exam_type check (EX_Type in ('Exam','Corrective')),
	constraint CK_time check (EX_Start_Time < EX_End_Time),
	constraint CK_MultiNum check (EX_Multi_Q_Num>=1) ,
	constraint CK_T_F_Num check (EX_T_F_Q_Num>=1),
	constraint CK_MultiDegree check (EX_Multi_Q_Degree>0) ,
	constraint CK_T_F_Degree check (EX_T_F_Q_Degree>0)
)on ExamAndQuestion_FG

 --...........  Create Chosen_Student Table  ............................... 
 CREATE TABLE Instructor.Chosen_Student (
	 CH_ST_ID INT ,
	 CH_ST_EX_id INT,
	 EX_Date date not null,
	 [Chosen?] bit default(0) not null,
	 INS_id INT not null,
	 CONSTRAINT PK_ChosenStudent PRIMARY KEY (CH_ST_ID, CH_ST_EX_id),
	 CONSTRAINT Fk_ChosenStudent_StuId FOREIGN KEY (CH_ST_ID) REFERENCES Training_Manager.Student(ST_ID)
					ON DELETE SET NULL ON UPDATE CASCADE ,
	 CONSTRAINT Fk_ChosenStudent_Exam_ExId FOREIGN KEY (CH_ST_EX_id) REFERENCES Instructor.Exam(EX_ID)
					ON DELETE SET NULL ON UPDATE CASCADE ,
	 CONSTRAINT Fk_ChosenStudent_Instructor_Ins_Id FOREIGN KEY(INS_id) REFERENCES Training_Manager.Instructor(INS_ID)
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
