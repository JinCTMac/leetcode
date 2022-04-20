-- 182 - duplicate emails

/* Table: Person

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
+-------------+---------+
id is the primary key column for this table.
Each row of this table contains an email. The emails will not contain uppercase letters.*/

/* Write an SQL query to report all the duplicate emails.

Return the result table in any order.

The query result format is in the following example.



Example 1:

Input:
Person table:
+----+---------+
| id | email   |
+----+---------+
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |
+----+---------+
Output:
+---------+
| Email   |
+---------+
| a@b.com |
+---------+
Explanation: a@b.com is repeated two times. */

-- # Write your MySQL query statement below
WITH t1 AS (SELECT email, COUNT(email) number
    FROM Person
    GROUP BY email)
SELECT email
FROM t1
WHERE number > 1;

/* SOLUTION - simply create a subquery table that has a grouping of the emails by count, and then select emails from that table where the count is greater than 1, which returns all emails with duplicates */

select Email
from Person
group by Email
having count(Email) > 1;

/* an even easier solution is just to using the having keyword, which lets you specify commands 
