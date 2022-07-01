-- 587 - Customer placing largest amount of orders https://leetcode.com/problems/customer-placing-the-largest-number-of-orders/

/* Table: Orders

+-----------------+----------+
| Column Name     | Type     |
+-----------------+----------+
| order_number    | int      |
| customer_number | int      |
+-----------------+----------+
order_number is the primary key for this table.
This table contains information about the order ID and the customer ID.


Write an SQL query to find the customer_number for the customer who has placed the largest number of orders.

The test cases are generated so that exactly one customer will have placed more orders than any other customer. */

WITH t1 AS (SELECT customer_number, COUNT(order_number) no_orders
    FROM Orders
    GROUP BY customer_number)
SELECT customer_number
FROM t1
WHERE no_orders = (SELECT MAX(no_orders) FROM t1);

/* SOLUTION - we need to count up the number of orders for each customer, so we count orders, grouping by customer_number to get the number of orders made per customer. We can then put this into a subquery and select the customer number for which their number of orders is equal to the maximum number of orders made in the table. */

SELECT
    customer_number, COUNT(*)
FROM
    orders
GROUP BY customer_number
ORDER BY COUNT(*) DESC
LIMIT 1;

/* ALTERNATIVE AND EASIER SOLUTION - just group the orders as before, then order by count descending, then limit 1 to get the right customer number. */
