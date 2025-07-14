-- schema/create_tables.sql

CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);

CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    DeptID INT,
    Designation VARCHAR(50),
    JoinDate DATE,
    Salary DECIMAL(10,2),
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

CREATE TABLE Attendance (
    AttendID INT PRIMARY KEY,
    EmpID INT,
    AttendDate DATE,
    Status VARCHAR(10),
    FOREIGN KEY (EmpID) REFERENCES Employee(EmpID)
);
