-- 3.1) Вивести студентів групи ІПЗ-21
SELECT *
FROM students
WHERE group_name = 'ІПЗ-21';

-- 3.2) Вивести студентів з avg_grade не менше 80
--      (AND: активний І середній бал >= 80)
SELECT *
FROM students
WHERE avg_grade >= 80
  AND is_active = 1;

-- 3.3) Вивести студентів з avg_grade від 60 до 80 включно
--      (OR: з різних груп, але в межах 60–80)
SELECT *
FROM students
WHERE avg_grade BETWEEN 60 AND 80
  AND (group_name = 'ІПЗ-11' OR group_name = 'ІПЗ-31');

-- 3.4) Вивести неактивних студентів (is_active = 0)
SELECT *
FROM students
WHERE is_active = 0;

-- 3.5) Вивести студентів 2 курсу, у яких avg_grade вище 85
--      (AND + NOT: 2 курс, бал > 85, але НЕ ті, хто без стипендії)
SELECT *
FROM students
WHERE course = 2
  AND avg_grade > 85
  AND NOT scholarship = 0;

-- 3.6) Вивести студентів, у яких scholarship більше 0
--      (OR + AND: стипендія > 0, і при цьому курс 1 або 2)
SELECT *
FROM students
WHERE scholarship > 0
  AND (course = 1 OR course = 2);

-- 3.7) Вивести студентів, які вступили у 2024 році
SELECT *
FROM students
WHERE enrolled_year = 2024;

-- 3.8) Вивести студентів, у яких ПІБ містить фрагмент "енко"
SELECT *
FROM students
WHERE full_name LIKE '%енко%';
