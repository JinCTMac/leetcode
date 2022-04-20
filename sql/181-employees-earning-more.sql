-- 181 - find out which employees earn more than their managers

/* +-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| salary      | int     |
| managerId   | int     |
+-------------+---------+
id is the primary key column for this table.
Each row of this table indicates the ID of an employee, their name, salary, and the ID of their manager. */

-- Write your MySQL query statement below
-- SELECT a.name as 'Employee'
-- FROM Employee a, Employee b
-- WHERE a.salary > b.salary
-- AND a.managerId = b.id;
SELECT a.name AS 'Employee'
FROM Employee a
JOIN Employee b
ON a.managerId = b.id
WHERE a.salary > b.salary;

/* SOLUTION - we need to do a self-join, as both employees and managers share the same table, and so we can use the same table to join on, splitting into a table A which represents the employees, and a table B which represents the managers, but only select employees where they
1) have a manager id i.e. they are an employee with a manager, and
2) have a salary higher than their manager i.e. the salary in table A is greater than in table B */
