-- 4.1) Вивести студентів, відсортованих за avg_grade за спаданням
SELECT *
FROM students
ORDER BY avg_grade DESC;

-- 4.2) Вивести студентів, відсортованих за full_name за зростанням (алфавіт)
SELECT *
FROM students
ORDER BY full_name ASC;

-- 4.3) Вивести студентів групи ІПЗ-21, відсортованих за avg_grade за спаданням
SELECT *
FROM students
WHERE group_name = 'ІПЗ-21'
ORDER BY avg_grade DESC;

-- 4.4) Вивести всіх студентів, відсортованих спочатку за group_name, потім за full_name
SELECT *
FROM students
ORDER BY group_name ASC, full_name ASC;

-- 4.5) Вивести студентів 3 курсу, відсортованих за scholarship DESC,
--      при однаковій стипендії — за avg_grade DESC
SELECT *
FROM students
WHERE course = 3
ORDER BY scholarship DESC, avg_grade DESC;
