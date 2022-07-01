-- 607 - Sales Person

/* Table: SalesPerson

+-----------------+---------+
| Column Name     | Type    |
+-----------------+---------+
| sales_id        | int     |
| name            | varchar |
| salary          | int     |
| commission_rate | int     |
| hire_date       | date    |
+-----------------+---------+
sales_id is the primary key column for this table.
Each row of this table indicates the name and the ID of a salesperson alongside their salary, commission rate, and hire date.


Table: Company

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| com_id      | int     |
| name        | varchar |
| city        | varchar |
+-------------+---------+
com_id is the primary key column for this table.
Each row of this table indicates the name and the ID of a company and the city in which the company is located.


Table: Orders

+-------------+------+
| Column Name | Type |
+-------------+------+
| order_id    | int  |
| order_date  | date |
| com_id      | int  |
| sales_id    | int  |
| amount      | int  |
+-------------+------+
order_id is the primary key column for this table.
com_id is a foreign key to com_id from the Company table.
sales_id is a foreign key to com_id from the SalesPerson table.
Each row of this table contains information about one order. This includes the ID of the company, the ID of the salesperson, the date of the order, and the amount paid.


Write an SQL query to report the names of all the salespersons who did not have any orders related to the company with the name "RED". */

SELECT name
FROM Salesperson
WHERE sales_id NOT IN (SELECT o.sales_id
    FROM Orders o
    JOIN Company c
    ON o.com_id = c.com_id
    WHERE o.com_id = (SELECT com_id FROM Company WHERE name = "RED"));

/* same solution but faster since it doesn't use 2nd subquery */

SELECT name
FROM Salesperson
WHERE sales_id NOT IN (SELECT o.sales_id
    FROM Orders o
    JOIN Company c
    ON o.com_id = c.com_id
    WHERE c.name = "RED");

/* MY SOLUTION - sub optimal, uses 2 subqueries within the main query, but premise goes:

- 1) Join the orders table and company table together, joining only where the company name is "RED", as so to select only orders which are from the company we don't want and the sales_ids associated.
- 2) Then, we can specify we only want the sales_id of those orders where the company name is red, and then put the result of 1) into a subquery, selecting only the name from the Salesperson table where the sales_id is not contained within the results of 1), which house the sales_ids of the salespeople who have done a deal with the company named "RED". */

WITH t1 AS (SELECT sales_id
    FROM Orders o
    JOIN Company c
    ON o.com_id = c.com_id
    WHERE c.name = "RED")
SELECT name
FROM Salesperson
WHERE sales_id NOT IN (SELECT sales_id FROM t1);

/* MORE OPTIMAL - same logic as the subquery version, but places it into a WITH statement to make it easier, note you have to use a subquery to select from the WITH statement if you don't explicitly query from it in the FROM clause */
