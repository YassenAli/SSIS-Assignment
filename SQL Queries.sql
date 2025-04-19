-- Q1
CREATE TABLE  University 
(
     [Name]  NVARCHAR(250),
     Country  NVARCHAR(100),
     Alpha_two_code  NVARCHAR(10)
);
SELECT * FROM University;
DELETE FROM University;

-- Q2

CREATE TABLE Employee_Q2 (
    ID INT PRIMARY KEY,
    Name NVARCHAR(100),
    City NVARCHAR(100),
    Email NVARCHAR(100),
    Update_Date DATETIME
);

CREATE TABLE Employee_Current (
    ID INT PRIMARY KEY,
    Name NVARCHAR(100),
    City NVARCHAR(100),
    Email NVARCHAR(100),
	Update_Date DateTime,
);

CREATE TABLE Employee_History (
    ID INT Primary Key Identity(1,1),
	Employee_ID INT,
    Name NVARCHAR(100),
    City NVARCHAR(100),
    Email NVARCHAR(100),
    Start_Date DATETIME,
    End_Date DATETIME
);


CREATE TABLE ETL_Variables (
    Table_Name NVARCHAR(100) PRIMARY KEY,
    Last_Updated_Date DATETIME
);

insert into ETL_Variables values
('Employee_Q2','1999-03-27');



insert INto Employee_q2 (ID,Name , City , Email , Update_Date)Values 
(1001 , 'Ahmed' ,'Cairo', 'ahmed@mail.com' , '2025-03-27'),
(1002 , 'Nehal', 'Giza', 'nehal@mail.com', '2025-03-27'),
(1003 , 'Samaa', 'Cairo', 'samaa@mail.com', '2025-03-27');


select * from Employee_Q2
select * from Employee_History
select * from Employee_Current


-- Q3
CREATE TABLE dbo.Employee_Q3 (
    ID            INT,
    [Name]        VARCHAR(50),
    City          VARCHAR(50),
    Email         VARCHAR(100),
    Schedule_Date DATE
);

INSERT INTO dbo.Employee_Q3 (ID, [Name], City, Email, Schedule_Date)
VALUES
    (1001, 'Ahmad', 'Cairo', 'ahmed1@mail.com', '2025-03-27'),
    (1002, 'Nehal', 'Giza',  'nehal@mail.com',  '2025-03-27'),
    (1003, 'Samaa', 'Cairo', 'samaa1@mail.com', '2025-03-27');

update Employee_Q3
	set Schedule_Date='2025-03-27';

CREATE TABLE Employee_Q3_Target (
     Emp_Key  INT IDENTITY(1,1) PRIMARY KEY,
     ID  INT,
     [Name]  VARCHAR(50),
     City  VARCHAR(50),
     Email  VARCHAR(50),
     Schedule_Date  DATE,
     Insert_Date  DATETIME DEFAULT (GETDATE()),
     Active_Flag  BIT,
     Version_No  INT
);
SELECT * FROM Employee_Q3;
SELECT * FROM Employee_Q3_Target;
DELETE FROM Employee_Q3_Target

-- Q4

CREATE TABLE Attendance_Device (
    ID             INT           IDENTITY(1,1) PRIMARY KEY,
    Employee_Id    INT           NOT NULL,
    Finger_Print_TS DATETIME     NOT NULL,
    In_Out         VARCHAR(3)    NOT NULL
);

INSERT INTO Attendance_Device (Employee_Id, Finger_Print_TS, In_Out) VALUES
(101, '2025-03-12 09:00:00', 'in'),
(101, '2025-03-12 10:00:00', 'in'),
(102, '2025-03-12 09:00:00', 'in'),
(103, '2025-03-12 11:00:00', 'in'),
(104, '2025-03-12 09:15:00', 'in'),
(105, '2025-03-12 10:00:00', 'in'),
(105, '2025-03-12 11:00:00', 'in'),
(105, '2025-03-12 11:30:00', 'in'),
(106, '2025-03-12 09:00:00', 'in'),
(107, '2025-03-12 09:00:00', 'in'),
(108, '2025-03-12 09:00:00', 'in'),
(101, '2025-03-12 09:00:00', 'out'),
(101, '2025-03-12 17:00:00', 'out'),
(101, '2025-03-12 19:00:00', 'out'),
(102, '2025-03-12 17:00:00', 'out'),
(103, '2025-03-12 17:00:00', 'out'),
(105, '2025-03-12 10:00:00', 'out'),
(105, '2025-03-12 11:00:00', 'out'),
(105, '2025-03-12 18:00:00', 'out'),
(106, '2025-03-12 19:00:00', 'out'),
(107, '2025-03-12 14:00:00', 'out'),
(108, '2025-03-12 17:00:00', 'out');


CREATE TABLE EmployeeAttendance (
    Att_Key        INT      IDENTITY(1,1) PRIMARY KEY,
    Emp_ID         INT      NOT NULL,
    [Date]         DATE     NOT NULL,
    Time_In        TIME     NULL,
    Time_Out       TIME     NULL,
    Worked_Hours   INT      NULL,
    State          VARCHAR(50) NULL
);


	select * from Attendance_Device
	select * from EmployeeAttendance
