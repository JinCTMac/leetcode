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
Each row of this table indicates the ID of an employee, their name, salary, and the ID of their manager.

Write an SQL query to find the employees who earn more than their managers.

Return the result table in any order.

The query result format is in the following example.

Example 1:

Input:
Employee table:
+----+-------+--------+-----------+
| id | name  | salary | managerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | Null      |
| 4  | Max   | 90000  | Null      |
+----+-------+--------+-----------+
Output:
+----------+
| Employee |
+----------+
| Joe      |
+----------+
Explanation: Joe is the only employee who earns more than his manager.

*/

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
/* We join on employee id = manager id, to put the managers salary into the same row as the employee, and then we can just compare the salary of the employee to the manager in the WHERE clause */
