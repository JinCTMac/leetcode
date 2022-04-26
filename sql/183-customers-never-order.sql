-- 183 - Customers who never order https://leetcode.com/problems/customers-who-never-order/

/* Table: Customers

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
+-------------+---------+
id is the primary key column for this table.
Each row of this table indicates the ID and name of a customer.


Table: Orders

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| customerId  | int  |
+-------------+------+
id is the primary key column for this table.
customerId is a foreign key of the ID from the Customers table.
Each row of this table indicates the ID of an order and the ID of the customer who ordered it.


Write an SQL query to report all customers who never order anything.

Return the result table in any order.

The query result format is in the following example. */

SELECT c.name
FROM Customers c
LEFT JOIN Orders o
ON c.id = o.customerId
WHERE o.customerId IS NULL;

-- OR

SELECT c.name
FROM Customers c
LEFT JOIN Orders o
ON c.id = o.customerId
WHERE o.id IS NULL;

/* SOLUTION - we just need to join the tables together, and then select only the customers for whom the order id is NULL, or the orders for whom the customer id is null */
