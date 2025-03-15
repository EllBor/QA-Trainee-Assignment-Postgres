SELECT C.title, C.hours, AVG(score) AS avg_score 
FROM Courses AS C
JOIN Exams AS E ON C.c_no = E.c_no
GROUP BY C.title, C.hours
ORDER BY avg_score DESC;