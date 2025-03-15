SELECT C.title, S.houre, AVG(score) AS avg_score 
FROM Courses AS C
JOIN Exams AS E ON C.c_no = E.c_no
GROUP BY S.name
ORDER BY avg_score;