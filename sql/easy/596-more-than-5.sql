-- 596 - Classes with more than 5 students

/* Table: Courses

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| student     | varchar |
| class       | varchar |
+-------------+---------+
(student, class) is the primary key column for this table.
Each row of this table indicates the name of a student and the class in which they are enrolled.


Write an SQL query to report all the classes that have at least five students.

Return the result table in any order.

The query result format is in the following example. */

WITH t1 AS (SELECT class, COUNT(CLASS) num
  FROM Courses
  GROUP BY class)
SELECT class
FROM t1
WHERE num >= 5;

/* SOLUTION - fairly simple, we just need to get a group by count of each occurrence of each class, since the student name isn't relevant to that, and then we can just select the classes where the number of occurrences in the table exceeds 5 */
