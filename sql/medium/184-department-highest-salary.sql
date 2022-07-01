-- 184 - Department Highest Salary
-- https://leetcode.com/problems/department-highest-salary/

/* Table: Employee

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| id           | int     |
| name         | varchar |
| salary       | int     |
| departmentId | int     |
+--------------+---------+
id is the primary key column for this table.
departmentId is a foreign key of the ID from the Department table.
Each row of this table indicates the ID, name, and salary of an employee. It also contains the ID of their department.


Table: Department

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
+-------------+---------+
id is the primary key column for this table.
Each row of this table indicates the ID of a department and its name.


Write an SQL query to find employees who have the highest salary in each of the departments.

Return the result table in any order.

The query result format is in the following example.



Example 1:

Input:
Employee table:
+----+-------+--------+--------------+
| id | name  | salary | departmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 70000  | 1            |
| 2  | Jim   | 90000  | 1            |
| 3  | Henry | 80000  | 2            |
| 4  | Sam   | 60000  | 2            |
| 5  | Max   | 90000  | 1            |
+----+-------+--------+--------------+
Department table:
+----+-------+
| id | name  |
+----+-------+
| 1  | IT    |
| 2  | Sales |
+----+-------+
Output:
+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Jim      | 90000  |
| Sales      | Henry    | 80000  |
| IT         | Max      | 90000  |
+------------+----------+--------+
Explanation: Max and Jim both have the highest salary in the IT department and Henry has the highest salary in the Sales department. */

WITH rank_table AS (SELECT d.name Department, e.name Employee, e.salary Salary,
    DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS salary_ranking
    FROM Employee e
    JOIN Department d
    ON e.departmentId = d.id)

SELECT Department, Employee, Salary
FROM rank_table
WHERE salary_ranking = 1;

/* SOLUTION - difficult question that requires you to use a window function to rank each of the employees in each department, partitioning by department and ranking by salary in descending order. We use the DENSE_RANK() function so that ranks are not skipped over, and so we can build a new column using this window function that represents each employee's rank, and partition the results of the query based on department and ordered by salary.

1) Select the department, employee and salary
2) Use DENSE_RANK() to partition by department and order by salary
3) Query this subquery result to find the employees where their salary_ranking is equal to 1, aka the highest rank */
