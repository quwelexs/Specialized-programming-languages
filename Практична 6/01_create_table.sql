-- Створення таблиці students
CREATE TABLE IF NOT EXISTS students (
    id            INTEGER PRIMARY KEY,
    full_name     TEXT    NOT NULL,
    group_name    TEXT    NOT NULL,
    course        INTEGER NOT NULL CHECK (course BETWEEN 1 AND 4),
    avg_grade     REAL    NOT NULL CHECK (avg_grade BETWEEN 0 AND 100),
    is_active     INTEGER NOT NULL CHECK (is_active IN (0, 1)),
    scholarship   REAL    NOT NULL DEFAULT 0,
    enrolled_year INTEGER NOT NULL
);
