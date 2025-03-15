-- Добавление записей в таблицу Students
INSERT INTO Students (name, start_year) VALUES 
  ('Alice', 2020),
  ('Bob', 2019),
  ('Charlie', 2021),
  ('Kate', 2021);

-- Добавление записей в таблицу Courses
INSERT INTO Courses (title, hours) VALUES 
  ('Mathematics', 60),
  ('Programming', 80),
  ('History', 40);

-- Добавление записей в таблицу Exams
INSERT INTO Exams (s_id, c_no, score) VALUES 
  (1, 1, 85),  -- Alice сдала Mathematics
  (1, 2, 88),  -- Alice сдала Programming
  (2, 1, 92),  -- Bob сдал Mathematics
  (2, 2, 90),  -- Bob сдал Programming
  (3, 3, 75);  -- Charlie сдала History