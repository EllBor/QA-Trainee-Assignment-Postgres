-- Добавление записей в таблицу Students
INSERT INTO Students (name, start_year) VALUES 
  ('Alice', 2020),
  ('Bob', 2019),
  ('Charlie', 2021);

-- Добавление записей в таблицу Courses
INSERT INTO Courses (title, hours) VALUES 
  ('Mathematics', 60),
  ('Programming', 80),
  ('History', 40);

-- Добавление записей в таблицу Exams
INSERT INTO Exams (s_id, c_no, score) VALUES 
  (1, 1, 85),  -- Alice сдает Mathematics
  (1, 2, 88),  -- Alice сдает Programming
  (2, 1, 92),  -- Bob сдает Mathematics
  (2, 2, 90),  -- Bob сдает Programming
  (3, 3, 75);  -- Charlie сдает History