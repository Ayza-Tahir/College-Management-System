

-----------------------------------------------------College Management System-------------------------------------------



--------------------------------------------------------------------------------------------------------------------------


CREATE DATABASE [College Management System];
USE [College Management System];

-------------------------------------------------------------DROP-------------------------------------------------------------------

DROP TABLE [Admin];
DROP TABLE Teacher;
DROP TABLE Student;
DROP TABLE Fees;
DROP TABLE Books;
DROP TABLE Exams;
DROP TABLE Section;
DROP TABLE [Year];
DROP TABLE Class_Scheduling;
DROP TABLE Student_Attendance;
DROP TABLE Teacher_Attendance;

------------------------------------------------------------Tables---------------------------------------------------------------------

-----------Admin Table

CREATE TABLE [Admin]
(
 Admin_id INT PRIMARY KEY IDENTITY(1,1) not NULL,
 Admin_Name VARCHAR(20),
 Admin_Password VARCHAR (20)Null,  

);

----------Teacher Table

CREATE TABLE Teacher
(
 Teacher_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,  --primary key
 Teacher_name VARCHAR(50) NULL,
 Date_of_Birth VARCHAR(30) NULL,
 Gender VARCHAR(10) NULL,
 contact_info VARCHAR(20) NULL,
 [Address] VARCHAR(MAX) NULL,
 Email VARCHAR(50) NULL,
 [Password] VARCHAR(50) NULL,
  
);

-------------Student

CREATE TABLE Student
(
Student_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,   --primary key
Roll_no VARCHAR(20) NULL,
Student_Name VARCHAR(30) NULL,
Date_of_Birth VARCHAR(30) NULL,
Gender VARCHAR(10) NULL,
Contact_info VARCHAR(20) NULL,
[Address] VARCHAR(MAX) NULL,

--foreign key

Year_id INT null ,
section_id INT null,

);

--------------------Year

CREATE TABLE [Year]
(
 Year_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,   --primary key
 Year_name VARCHAR(20) null
);

-------------------fees

CREATE TABLE Fees
(
fees_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,  --primary key 
fees_amount VARCHAR(20) null,

--foreign key

Year_id INT null 

);
----section

CREATE TABLE Section
(
section_id INT PRIMARY KEY IDENTITY(1,1)NOT NULL,  --primary key
section_name VARCHAR(10) NULL,

--foreign key

Year_id int NULL

);

---------Books

CREATE TABLE Books
(  
book_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
book_name VARCHAR(50) NULL,

--foreign key

Year_id INT null

);

------Exam Management

CREATE TABLE Exams
(
Exam_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL, --primary key
Exam_date VARCHAR(20) NULL,
Timing VARCHAR(10) null,

---Foreign key

Year_id INT null, 
Book_id INT null

);

-----------Class Scheduling

CREATE TABLE Class_Scheduling
(
Scheduling_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL, --primary key
Timing VARCHAR(10) null,
Class_day VARCHAR(20) NULL,

--foreign key

Year_id INT  null, 
Book_id INT  null, 
Teacher_id INT null, 

);


------Studence Attendance

CREATE TABLE Student_Attendance
(
Student_Attendance_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL, --primary key
[Status] VARCHAR(2) NULL,
[Date] varchar(10) NULL,
Student_id INT NULL,

--foreign key

Year_id INT null, 
section_id INT null
);


------Teacher Attendance

CREATE TABLE Teacher_Attendance
(
Teaacher_Attendance_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL, --primary key
[Status] VARCHAR(2) null,
[Date] date NULL,

--foreign key

Teacher_id INT  null, 

);



---------------------------------------------------Foreign Keys of Students----------------------------------------------------------------------------


ALTER TABLE Student ADD CONSTRAINT fk_section_id FOREIGN KEY (section_id) REFERENCES Section (section_id)
ON DELETE CASCADE
ON UPDATE CASCADE;
ALTER TABLE Student ADD CONSTRAINT c_fk_Year_id FOREIGN KEY (Year_id)REFERENCES [Year] (Year_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

---------------------------------------------------Foreign Keys of Fees----------------------------------------------------------------------------

ALTER TABLE Fees ADD CONSTRAINT ffk_Year_id FOREIGN KEY (Year_id) REFERENCES [Year] (Year_id)
ON DELETE CASCADE
ON UPDATE CASCADE;

---------------------------------------------------Foreign Keys of Studence_Attendance----------------------------------------------------------------------------

ALTER TABLE Student_Attendance ADD CONSTRAINT s_fk_Year_id FOREIGN KEY (Year_id) REFERENCES [Year] (Year_id)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE Student_Attendance ADD CONSTRAINT s_fk_section_id FOREIGN KEY (section_id) REFERENCES Section (section_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION;


 ALTER TABLE Student_Attendance ADD CONSTRAINT s_fk_Student_id FOREIGN KEY (Student_id) REFERENCES Student (Student_id)
 ON DELETE CASCADE
ON UPDATE CASCADE;

---------------------------------------------------Foreign Keys of Teacher Attendance----------------------------------------------------------------------------

ALTER TABLE Teacher_Attendance ADD CONSTRAINT fk_Teacher_id FOREIGN KEY (Teacher_id) REFERENCES Teacher (Teacher_id)
ON DELETE CASCADE
ON UPDATE CASCADE;

---------------------------------------------------Foreign Keys of Exams----------------------------------------------------------------------------

ALTER TABLE Exams ADD CONSTRAINT eX_fk_Year_id FOREIGN KEY (Year_id) REFERENCES [Year] (Year_id)
ON DELETE NO Action
ON UPDATE NO Action;

ALTER TABLE Exams ADD CONSTRAINT e_fk_book_id FOREIGN KEY (book_id) REFERENCES Books (book_id)
ON DELETE NO Action
ON UPDATE NO Action;

---------------------------------------------------Foreign Keys of Books----------------------------------------------------------------------------

ALTER TABLE Books ADD CONSTRAINT b_fk_Year_id FOREIGN KEY (Year_id) REFERENCES [Year] (Year_id)
ON DELETE CASCADE
ON UPDATE CASCADE;

-------------------------------------------------Foreign key of section----------------------------

ALTER TABLE Section ADD CONSTRAINT se_fk_Year_id FOREIGN KEY (Year_id) REFERENCES [Year] (Year_id)
ON DELETE NO Action
ON UPDATE NO Action;

--------------------------------------------------Class_Scheduling----------------------------

ALTER TABLE Class_Scheduling ADD CONSTRAINT cs_fk_Year_id FOREIGN KEY (Year_id)REFERENCES [Year] (Year_id)
ON DELETE NO Action
ON UPDATE NO Action;

ALTER TABLE Class_Scheduling ADD CONSTRAINT cs_fk_book_id FOREIGN KEY (Book_id)REFERENCES Books (book_id)
ON DELETE NO Action
ON UPDATE NO Action;

ALTER TABLE Class_Scheduling ADD CONSTRAINT cs_fk_Teacher_id FOREIGN KEY(Teacher_id) REFERENCES Teacher (Teacher_id)
ON DELETE NO Action
ON UPDATE NO Action;

--------------------------------------------------------------Testing Data--------------------------------------------------------------

---------------------------------------------------------INSERTION---------------------------------------------------------------


-------------insert into year
INSERT INTO [Year] VALUES ('1st Year');
INSERT INTO [Year] VALUES ('2nd Year');

SELECT*FROM [Year];

----insert into Fees

INSERT INTO Fees VALUES('10,000',1);
INSERT INTO Fees VALUES('20,000',2);

select*from Fees;

-------insert into section

INSERT INTO Section VALUES('A',1);
INSERT INTO Section VALUES('B',1);
INSERT INTO Section VALUES('C',1);

INSERT INTO Section VALUES('A',2);
INSERT INTO Section VALUES('B',2);
INSERT INTO Section VALUES('C',2);

SELECT*FROM Section;

----------insert into books

INSERT INTO Books VALUES('English I',1);
INSERT INTO Books VALUES('Urdu I',1);
INSERT INTO Books VALUES('Physics I',1);
INSERT INTO Books VALUES('Mathematics I',1);
INSERT INTO Books VALUES('Computer Science I',1);


INSERT INTO Books VALUES('English II',2);
INSERT INTO Books VALUES('Urdu II',2);
INSERT INTO Books VALUES('Physics II',2);
INSERT INTO Books VALUES('Mathematics II',2);
INSERT INTO Books VALUES('Computer Science II',2);

Select*FROM Books;

----------Insert into Exams
INSERT INTO Exams VALUES('01-10-2023','12:30 PM',1,1);
INSERT INTO Exams VALUES('02-10-2023','1:00 PM',1,2);
INSERT INTO Exams VALUES('03-10-2023','2:30 PM',1,3);
INSERT INTO Exams VALUES('04-10-2023','2:30 PM',1,4);
INSERT INTO Exams VALUES('05-10-2023','12:30 PM',1,5);

INSERT INTO Exams VALUES('01-10-2023','2:30 PM',2,6);
INSERT INTO Exams VALUES('02-10-2023','12:00 PM',2,7);
INSERT INTO Exams VALUES('03-10-2023','4:30 PM',2,8);
INSERT INTO Exams VALUES('04-10-2023','12:30 PM',2,9);
INSERT INTO Exams VALUES('05-10-2023','4:30 PM',2,10);

SELECT*FROM Exams;

-----------------insert into Teacher

INSERT INTO Teacher (Teacher_name,Date_of_Birth,Gender,contact_info,[Address],Email,[Password])VALUES('Maham javed','11-Feburary 1995','Female','0300-1234567','Johar town','maham@gmail.com','maham123');
INSERT INTO Teacher (Teacher_name,Date_of_Birth,Gender,contact_info,[Address],Email,[Password]) VALUES('Daniyal','13-September 1994','Male','0313-12706567','N.F.C','daniyal@gmail.com','123daniyal123');
INSERT INTO Teacher (Teacher_name,Date_of_Birth,Gender,contact_info,[Address],Email,[Password])VALUES('Ali Farooq','20-April 1992','Male','0345-8754567','Wapda town','ali@gmail.com','ali_i_123');
INSERT INTO Teacher (Teacher_name,Date_of_Birth,Gender,contact_info,[Address],Email,[Password])VALUES('Eisha Amir','19-March 1996','Female','0313-986567','Wapda town','eisha@gmail.com','eisha_amir34');
INSERT INTO Teacher (Teacher_name,Date_of_Birth,Gender,contact_info,[Address],Email,[Password])VALUES('Adeen','23-June 1994','Male','0309-6787567','Valencia town','adeen_9@gmail.com','adeen_y154');

SELECT*FROM Teacher;

-----------INSERT INTo class_scheduling

INSERT INTO Class_Scheduling VALUES('12:30 PM','Monday, Wednesday',1,1,1);
INSERT INTO Class_Scheduling VALUES('2:30 PM','Tuesday, Thursday',1,2,2);
INSERT INTO Class_Scheduling VALUES('2:30 PM','Monday, Wednesday',1,3,3);
INSERT INTO Class_Scheduling VALUES('12:30 PM','Tuesday,Thusday',1,4,4);
INSERT INTO Class_Scheduling VALUES('3:30 PM','Friday,satursday',1,5,5);


INSERT INTO Class_Scheduling VALUES('12:30 PM','Tuesday, Thursday',2,6,1);
INSERT INTO Class_Scheduling VALUES('2:30 PM','Monday, Wednesday',2,7,2);
INSERT INTO Class_Scheduling VALUES('2:30 PM','Tuesday, Thursday',2,8,3);
INSERT INTO Class_Scheduling VALUES('12:30 PM','Monday, Wednesday',2,9,4);
INSERT INTO Class_Scheduling VALUES('10:30 PM','Friday,satursday',2,10,5);

SELECT*FROM Class_Scheduling;

----Insert into student
INSERT INTO Student VALUES('22L-1234','Alina','22-March 2004','Female','0300-12345678','Johar town',1,1);
INSERT INTO Student VALUES('22L-4567','Maham','12-April 2005','Female','0310-1456778','Wapda town',1,1);
INSERT INTO Student VALUES('22L-9876','Eisha','2-June 2004','Female','0323-2355678','Bahira town',1,1);

INSERT INTO Student VALUES('22L-1678','Saba','27-August 2005','Female','0300-14355678','Johar town',1,2);
INSERT INTO Student VALUES('22L-3456','Muntaha','09-June 2004','Female','0325-9995678',' N.F.C',1,2);
INSERT INTO Student VALUES('22L-2534','Farwa','14-March 2003','Female','0304-88845678','Wapda town',1,2);

INSERT INTO Student VALUES('22L-1111','Alia','21-August 2005','Female','0309-66645678','Johar town',1,3);
INSERT INTO Student VALUES('22L-6767','Adeena','11-March 2004','Female','0345-55545678','N.F.C town',1,3);
INSERT INTO Student VALUES('22L-3432','fliza','15-April 2005','Female','0312-4445678','Wapda town',1,3);

INSERT INTO Student VALUES('21L-7787','Noor','19-July 2003','Female','0323-33345678','Johar town',2,4);
INSERT INTO Student VALUES('21L-1268','Amna','20-August 2006','Female','0309-22345678','Wapda town',2,4);
INSERT INTO Student VALUES('21L-9865','Sava','18-March 2003','Female','0300-345118','Valencia town',2,4);

INSERT INTO Student VALUES('21L-3468','Batool','16-July 2005','Female','0315-2345678','Wapda town',2,5);
INSERT INTO Student VALUES('21L-7635','Rijja','28-June 2003','Female','0320-9875678','Johar town',2,5);
INSERT INTO Student VALUES('21L-2357','Alina','07-March 2003','Female','0300-65445678','N.F.C town',2,5);

INSERT INTO Student VALUES('21L-8534','Maham','15-July 2004','Female','0300-4245678','Johar town',2,6);
INSERT INTO Student VALUES('21L-2931','Komal','26-April 2003','Female','0315-76545678','Wapda town',2,6);
INSERT INTO Student VALUES('21L-4433','Bisma','11-June 2004','Female','0302-2145678','Johar town',2,6);

SELECT*FROM Student;

----insert into student attendance

--1st year

INSERT INTO Student_Attendance VALUEs('P' ,'2023-10-08',1,1,1);
INSERT INTO Student_Attendance VALUEs('P','2023-10-08',2,1,1);
INSERT INTO Student_Attendance VALUEs('A','2023-10-08',3,1,1);

INSERT INTO Student_Attendance VALUES('P','2023-10-09',1,1,1);
INSERT INTO Student_Attendance VALUES('P','2023-10-09',2,1,1);
INSERT INTO Student_Attendance VALUES('P','2023-10-09',3,1,1);


INSERT INTO Student_Attendance VALUES('P' ,'2023-10-08',4,1,2);
INSERT INTO Student_Attendance VALUES('A','2023-10-08',5,1,2);
INSERT INTO Student_Attendance VALUES('P','2023-10-08',6,1,2);

INSERT INTO Student_Attendance VALUES('P','2023-10-09',4,1,2);
INSERT INTO Student_Attendance VALUES('P','2023-10-09',5,1,2);
INSERT INTO Student_Attendance VALUES('P','2023-10-09',6,1,2);



INSERT INTO Student_Attendance VALUES('P' ,'2023-10-08',7,1,3);
INSERT INTO Student_Attendance VALUES('P','2023-10-08',8,1,3);
INSERT INTO Student_Attendance VALUES('P','2023-10-08',9,1,3);

INSERT INTO Student_Attendance VALUES('P','2023-10-09',7,1,3);
INSERT INTO Student_Attendance VALUES('P','2023-10-09',8,1,3);
INSERT INTO Student_Attendance VALUES('P','2023-10-09',9,1,3);


----2nd year 

INSERT INTO Student_Attendance VALUES('A','2023-10-08',10,2,4);
INSERT INTO Student_Attendance VALUES('P','2023-10-08',11,2,4);
INSERT INTO Student_Attendance VALUES('P','2023-10-08',12,2,4);

INSERT INTO Student_Attendance VALUES('P','2023-10-09',10,2,4);
INSERT INTO Student_Attendance VALUES('P','2023-10-09',11,2,4);
INSERT INTO Student_Attendance VALUES('P','2023-10-09',12,2,4);


INSERT INTO Student_Attendance VALUES('A' ,'2023-10-08',13,2,5);
INSERT INTO Student_Attendance VALUES('P','2023-10-08',14,2,5);
INSERT INTO Student_Attendance VALUES('P','2023-10-08',15,2,5);

INSERT INTO Student_Attendance VALUES('P','2023-10-09',13,2,5);
INSERT INTO Student_Attendance VALUES('P','2023-10-09',14,2,5);
INSERT INTO Student_Attendance VALUES('P','2023-10-09',15,2,5);


INSERT INTO Student_Attendance VALUES('A' ,'2023-10-08',16,2,6);
INSERT INTO Student_Attendance VALUES('P','2023-10-08',17,2,6);
INSERT INTO Student_Attendance VALUES('P','2023-10-08',18,2,6);

INSERT INTO Student_Attendance VALUES('P','2023-10-09',16,2,6);
INSERT INTO Student_Attendance VALUES('A','2023-10-09',17,2,6);
INSERT INTO Student_Attendance VALUES('P','2023-10-09',18,2,6);

SELECT*FROM Student_Attendance;

----INsert into teacher_Attendance

INSERT INTO Teacher_Attendance VALUES('A' ,'2023-10-08',1);
INSERT INTO Teacher_Attendance VALUES('P','2023-10-08',2);
INSERT INTO Teacher_Attendance VALUES('P','2023-10-08',3);
INSERT INTO Teacher_Attendance VALUES('P','2023-10-08',4);
INSERT INTO Teacher_Attendance VALUES('P','2023-10-08',5);

INSERT INTO Teacher_Attendance VALUES('P','2023-10-09',1);
INSERT INTO Teacher_Attendance VALUES('P','2023-10-09',2);
INSERT INTO Teacher_Attendance VALUES('P','2023-10-09',3);
INSERT INTO Teacher_Attendance VALUES('P','2023-10-09',4);
INSERT INTO Teacher_Attendance VALUES('P','2023-10-09',5);

-----INSERT Into Admin

INSERT INTO [Admin] VALUES('Ayza Tahir','ayza1234');

-------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------Select Statements-------------------------------------------


SELECT*FROM [Admin];
SELECT*FROM Teacher;
SELECT*FROM Student;
SELECT*FROM [Year];
SELECT*FROM Fees;
SELECT*FROM Section;
SELECT*FROM Books;
SELECT*FROM Class_Scheduling;
SELECT*FROM Teacher_Attendance;
SELECT*FROM Student_Attendance;
SELECT*FROM Exams;

-------------------------------------------------------------------------------------------------------------------------------


