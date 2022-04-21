-- 196 - Delete Duplicate Emails https://leetcode.com/problems/delete-duplicate-emails/

/* Table: Person

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
+-------------+---------+
id is the primary key column for this table.
Each row of this table contains an email. The emails will not contain uppercase letters.


Write an SQL query to delete all the duplicate emails, keeping only one unique email with the smallest id. Note that you are supposed to write a DELETE statement and not a SELECT one.

Return the result table in any order. */

DELETE p2
FROM Person p1
JOIN Person p2
ON p1.email = p2.email
AND p1.id < p2.id;

/* SOLUTION - it is possible to use a WHERE statement, deleting where the ID does not match the min(id) in the table, but performing a self join makes it much easier to visualise what we are doing. In this case, we want to delete all the duplicate emails, leaving only the email with the smallest ID on its own. To do so, we can just join the table onto itself with a self join, joining on the emails and thus creating another table with the IDs of both tables in the self join. We then attach the condition p1.id < p2.id, which will look for the ids in table 2 with id value higher than in p1, and delete those, leaving us just with the table t1 */

WITH t1 AS (SELECT email, MIN(id) AS id_to_keep
    FROM Person
    GROUP BY email)
DELETE FROM Person
WHERE id NOT IN (SELECT id_to_keep FROM t1);

/* SOLUTION 2 - A much more intuitive solution:
To solve this question, you must first:
1) Identify the smallest id for each email (using a group by)
2) Delete all IDs not in this group of ids from the table

Using a WITH subquery, we can identify the MIN(id) for each email using a group by, and then DELETE FROM the table where the id is not in that group of ids from the subquery t1, which is provided via a simple select of the id_to_keep(s) from the subquery table */
