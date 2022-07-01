-- 1581 - Customers who visited but did not make transactions

/* Table: Visits

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| visit_id    | int     |
| customer_id | int     |
+-------------+---------+
visit_id is the primary key for this table.
This table contains information about the customers who visited the mall.


Table: Transactions

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| transaction_id | int     |
| visit_id       | int     |
| amount         | int     |
+----------------+---------+
transaction_id is the primary key for this table.
This table contains information about the transactions made during the visit_id.


Write an SQL query to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.

Return the result table sorted in any order.

The query result format is in the following example.



Example 1:

Input:
Visits
+----------+-------------+
| visit_id | customer_id |
+----------+-------------+
| 1        | 23          |
| 2        | 9           |
| 4        | 30          |
| 5        | 54          |
| 6        | 96          |
| 7        | 54          |
| 8        | 54          |
+----------+-------------+
Transactions
+----------------+----------+--------+
| transaction_id | visit_id | amount |
+----------------+----------+--------+
| 2              | 5        | 310    |
| 3              | 5        | 300    |
| 9              | 5        | 200    |
| 12             | 1        | 910    |
| 13             | 2        | 970    |
+----------------+----------+--------+
Output:
+-------------+----------------+
| customer_id | count_no_trans |
+-------------+----------------+
| 54          | 2              |
| 30          | 1              |
| 96          | 1              |
+-------------+----------------+

*/

SELECT customer_id, COUNT(customer_id) count_no_trans
FROM Visits v
JOIN Transactions t
ON t.visit_id = v.visit_id
WHERE transaction_id IS NULL
GROUP BY customer_id;

/* SOLUTION - We want to select all the customer ids who made at least one visit where they didn't also make a transaction. Transactions have a visit_id, indicating that when the customer made that visit, they also made a transaction, so the simple way of telling if a customer made a visit without a transaction is looking at visits where the transaction_id is NULL. Therefore, all we need to do is join the Visits table to the Transactions table on visit id, group by customer_id and select only visits where the transaction_id is NULL. */
