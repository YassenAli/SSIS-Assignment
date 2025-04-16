-- Q1
CREATE TABLE  University 
(
     [Name]  NVARCHAR(250),
     Country  NVARCHAR(100),
     Alpha_two_code  NVARCHAR(10)
);
SELECT * FROM University;
DELETE FROM University;


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