CREATE TABLE Students (
    s_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    start_year SMALLINT CHECK (start_year >= 1900)
);

CREATE TABLE Courses (
    c_no SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    hours SMALLINT CHECK (hours > 0) 
);

CREATE TABLE Exams (
    s_id INTEGER NOT NULL,
    c_no INTEGER NOT NULL,
    score FLOAT CHECK (score >= 0),
    PRIMARY KEY (s_id, c_no),
    FOREIGN KEY (s_id) REFERENCES Students (s_id),
    FOREIGN KEY (c_no) REFERENCES Courses (c_no)
);
