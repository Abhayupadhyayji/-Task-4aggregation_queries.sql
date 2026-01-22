-- Task 5: Aggregate Functions & GROUP BY
-- Tool: MySQL Workbench
-- Internship Level SQL Practice

---

-- Table Structure (Reference)

---

-- students(
--   student_id INT,
--   name VARCHAR(50),
--   age INT,
--   department VARCHAR(50),
--   marks INT
-- );

---

-- 1. COUNT: Total number of students

---

SELECT COUNT(*) AS total_students
FROM students;

---

-- 2. Group students by age

---

SELECT age, COUNT(*) AS students_count
FROM students
GROUP BY age;

---

-- 3. Aggregate functions with GROUP BY

---

SELECT
department,
COUNT(*) AS total_students,
AVG(marks) AS average_marks,
MIN(marks) AS minimum_marks,
MAX(marks) AS maximum_marks,
SUM(marks) AS total_marks
FROM students
GROUP BY department;

---

-- 4. HAVING: Filter grouped data

---

SELECT
department,
COUNT(*) AS student_count
FROM students
GROUP BY department
HAVING COUNT(*) > 3;

---

-- 5. WHERE vs HAVING comparison
-- WHERE filters rows BEFORE grouping
-- HAVING filters groups AFTER grouping

---

-- Using WHERE
SELECT department, COUNT(*) AS student_count
FROM students
WHERE age > 20
GROUP BY department;

-- Using HAVING
SELECT department, COUNT(*) AS student_count
FROM students
GROUP BY department
HAVING AVG(age) > 20;

---

-- 6. Real-world example:
-- Department-wise average marks

---

SELECT
department,
ROUND(AVG(marks), 2) AS avg_marks
FROM students
GROUP BY department;

---

-- 7. Analyzing result sets
-- Identify departments with low performance

---

SELECT
department,
AVG(marks) AS avg_marks
FROM students
GROUP BY department
HAVING AVG(marks) < 60;

---

-- 8. Handling NULL values in aggregates

---

SELECT
department,
COUNT(marks) AS non_null_marks_count,
AVG(COALESCE(marks, 0)) AS avg_marks_handled
FROM students
GROUP BY department;


