-- 2.1) Вивести всі поля всіх студентів
SELECT *
FROM students;

-- 2.2) Вивести тільки full_name, group_name, avg_grade
SELECT full_name, group_name, avg_grade
FROM students;

-- 2.3) Вивести список унікальних груп (без повторів)
SELECT DISTINCT group_name
FROM students;
