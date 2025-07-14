-- data/insert_data.sql

INSERT INTO Department VALUES (1, 'HR'), (2, 'IT'), (3, 'Finance');

INSERT INTO Employee VALUES 
(101, 'Krushna Vidhate', 2, 'Data Analyst', '2024-06-01', 40000),
(102, 'Anita Sharma', 1, 'HR Manager', '2023-02-10', 50000);

INSERT INTO Attendance VALUES 
(1, 101, '2025-07-13', 'Present'),
(2, 102, '2025-07-13', 'Absent');
