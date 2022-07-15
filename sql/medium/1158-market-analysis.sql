-- 1158 - Market Analysis I

/* Table: Users

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| user_id        | int     |
| join_date      | date    |
| favorite_brand | varchar |
+----------------+---------+
user_id is the primary key of this table.
This table has the info of the users of an online shopping website where users can sell and buy items.


Table: Orders

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| order_id      | int     |
| order_date    | date    |
| item_id       | int     |
| buyer_id      | int     |
| seller_id     | int     |
+---------------+---------+
order_id is the primary key of this table.
item_id is a foreign key to the Items table.
buyer_id and seller_id are foreign keys to the Users table.


Table: Items

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| item_id       | int     |
| item_brand    | varchar |
+---------------+---------+
item_id is the primary key of this table.


Write an SQL query to find for each user, the join date and the number of orders they made as a buyer in 2019.

Return the result table in any order.

The query result format is in the following example.



Example 1:

Input:
Users table:
+---------+------------+----------------+
| user_id | join_date  | favorite_brand |
+---------+------------+----------------+
| 1       | 2018-01-01 | Lenovo         |
| 2       | 2018-02-09 | Samsung        |
| 3       | 2018-01-19 | LG             |
| 4       | 2018-05-21 | HP             |
+---------+------------+----------------+
Orders table:
+----------+------------+---------+----------+-----------+
| order_id | order_date | item_id | buyer_id | seller_id |
+----------+------------+---------+----------+-----------+
| 1        | 2019-08-01 | 4       | 1        | 2         |
| 2        | 2018-08-02 | 2       | 1        | 3         |
| 3        | 2019-08-03 | 3       | 2        | 3         |
| 4        | 2018-08-04 | 1       | 4        | 2         |
| 5        | 2018-08-04 | 1       | 3        | 4         |
| 6        | 2019-08-05 | 2       | 2        | 4         |
+----------+------------+---------+----------+-----------+
Items table:
+---------+------------+
| item_id | item_brand |
+---------+------------+
| 1       | Samsung    |
| 2       | Lenovo     |
| 3       | LG         |
| 4       | HP         |
+---------+------------+
Output:
+-----------+------------+----------------+
| buyer_id  | join_date  | orders_in_2019 |
+-----------+------------+----------------+
| 1         | 2018-01-01 | 1              |
| 2         | 2018-02-09 | 2              |
| 3         | 2018-01-19 | 0              |
| 4         | 2018-05-21 | 0              |
+-----------+------------+----------------+ */

WITH t1 AS (SELECT buyer_id, COUNT(buyer_id) AS orders_in_2019
  FROM Orders
  WHERE order_date BETWEEN '2019-01-01' AND '2019-12-31'
  GROUP BY buyer_id)

SELECT u.user_id AS buyer_id, u.join_date, COALESCE(t1.orders_in_2019, 0) AS orders_in_2019
FROM Users u
LEFT JOIN t1
ON u.user_id = t1.buyer_id;

/* SOLUTION - we only care about two tables here, Users and Orders, as they are what we need to provide the user_id, join_date and number of orders in 2019.

1) Firstly, we want to get the number of orders in 2019, which we can obtain just from the Orders table alone. We can group by buyer_id and count the number of orders each buyer_id makes, as this corresponds to the user_id and hence the orders made by each user_id. We provide a WHERE condition to filter only for orders made in 2019, and make this subquery into a CTE.

2) Then, we can select the user_id and join_date from the Users table, and then left join the CTE on the user_id to get all of the user_ids in the table. This returns each user_id, their join date and all the orders they made in 2019, but if they made no orders in 2019 their order number will be NULL. To avoid this, we use the COALESCE function to replace all of those NULL values with 0. */
