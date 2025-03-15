SELECT S.* FROM Students AS S
LEFT JOIN Exams AS E ON S.s_id = E.s_id
WHERE E.s_id IS NULL;