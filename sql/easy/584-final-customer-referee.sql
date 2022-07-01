-- 584 - Find Customer Referee (https://leetcode.com/problems/find-customer-referee/)

/* Table: Customer

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| referee_id  | int     |
+-------------+---------+
id is the primary key column for this table.
Each row of this table indicates the id of a customer, their name, and the id of the customer who referred them.

Write an SQL query to report the IDs of the customer that are not referred by the customer with id = 2. */

SELECT name
FROM Customer
WHERE referee_id != 2 OR referee_id IS NULL;

/* SOLUTION - all you have to do is return all customers who have a referral id of NULL or not 2. */

/* I tried a very roundabout way of getting it to work at first and it doesn't work with some edge cases */

# SELECT DISTINCT c1.name
# FROM Customer c1
# LEFT JOIN Customer c2
# ON c1.id = c2.referee_id
# WHERE c1.referee_id != 2
# OR c1.referee_id IS NULL;
