USE QuanLySinhVien;

SELECT SubId, SubName, Credit, AVG(Credit) FROM ClassSubject
GROUP BY SubId
HAVING AVG(Credit) >= ALL (SELECT AVG(Credit) FROM ClassSubject GROUP BY ClassSubject.Credit);

SELECT ClassSubject.SubId, SubName, Credit, AVG(Mark) FROM ClassSubject
JOIN Mark ON ClassSubject.SubId = Mark.SubId
GROUP BY SubId
HAVING AVG(Mark) >= ALL (SELECT AVG(Mark) FROM Mark GROUP BY Mark.SubId);

SELECT Student.*, AVG(Mark) FROM Student
JOIN Mark
ON Student.StudentId = Mark.StudentId
GROUP BY StudentId
ORDER BY AVG(Mark) DESC;
