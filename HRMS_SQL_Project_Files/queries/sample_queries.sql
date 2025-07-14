-- queries/sample_queries.sql

-- Update salary
UPDATE Employee
SET Salary = 45000
WHERE EmpID = 101;

-- Delete attendance record
DELETE FROM Attendance
WHERE AttendID = 2;

-- Join to get employee with department name
SELECT e.EmpName, d.DeptName
FROM Employee e
JOIN Department d ON e.DeptID = d.DeptID;

-- Count present days
SELECT EmpID, COUNT(*) AS PresentDays
FROM Attendance
WHERE Status = 'Present'
GROUP BY EmpID;
