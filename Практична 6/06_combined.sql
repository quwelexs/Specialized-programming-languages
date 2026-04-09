-- 5.1) Активні студенти з avg_grade >= 90,
--      сортувати за avg_grade DESC, при однаковому — за full_name ASC
SELECT *
FROM students
WHERE is_active = 1
  AND avg_grade >= 90
ORDER BY avg_grade DESC, full_name ASC;

-- 5.2) Студенти без стипендії (scholarship = 0) з avg_grade >= 75
SELECT *
FROM students
WHERE scholarship = 0
  AND avg_grade >= 75;

-- 5.3) Студенти 1–2 курсу з avg_grade < 60 (група ризику),
--      сортувати за avg_grade ASC
SELECT *
FROM students
WHERE course IN (1, 2)
  AND avg_grade < 60
ORDER BY avg_grade ASC;

-- 5.4) Студенти групи ІПЗ-21, які вступили після 2023 року,
--      сортувати за enrolled_year DESC
SELECT *
FROM students
WHERE group_name = 'ІПЗ-21'
  AND enrolled_year > 2023
ORDER BY enrolled_year DESC;
