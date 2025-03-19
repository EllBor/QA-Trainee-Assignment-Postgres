SELECT S.name, S.start_year, COUNT(*) AS count_score 
FROM Students AS S
JOIN Exams AS E ON S.s_id = E.s_id
GROUP BY S.name, S.start_year;