-- 1. Наполнение таблицы Students (12 студентов)
INSERT INTO Students (name, start_year)
SELECT 'Student ' || gs,
       floor(random() * 25 + 2000)::smallint  -- генерирует год от 2000 до 2024
FROM generate_series(1, 12) AS gs;

-- 2. Наполнение таблицы Courses (8 курсов)
INSERT INTO Courses (title, hours)
SELECT 'Course ' || gs,
       floor(random() * 101 + 20)::smallint  -- генерирует часы от 20 до 120
FROM generate_series(1, 8) AS gs;

-- 3. Наполнение таблицы Exams
INSERT INTO Exams (s_id, c_no, score)
SELECT s.s_id, c.c_no,
       round((random() * 40 + 60)::numeric, 2)  -- генерирует баллы от 60 до 100 с 2 знаками после запятой
FROM Students s CROSS JOIN Courses c
WHERE random() < 0.7
ON CONFLICT (s_id, c_no) DO NOTHING;