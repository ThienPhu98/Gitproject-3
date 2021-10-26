USE QuanLySinhVien;
SELECT * FROM Student
WHERE StudentName LIKE 'H%';
SELECT * FROM Class
WHERE StartDate LIKE '%-12-%';
SELECT * FROM ClassSubject
WHERE Credit >= 3 AND Credit <= 5;
UPDATE Student SET ClassID = 2
WHERE StudentName = 'Hung';
SELECT StudentName, SubName, Mark FROM Mark
JOIN Student ON Student.StudentId = Mark.StudentId
JOIN ClassSubject ON ClassSubject.SubId = Mark.SubId
ORDER BY StudentName, SubName, Mark ASC;