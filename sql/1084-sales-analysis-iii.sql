-- 1084 - Sales Analysis III

/* WORKING SOLUTION */

# Write your MySQL query statement below

# WITH t1 AS (SELECT p.product_id product_id_main, p.product_name product_name_main, sale_date
#     FROM Sales s
#     JOIN Product p
#     ON p.product_id = s.product_id)
# SELECT product_id_main, product_name_main
# FROM t1
# WHERE sale_date BETWEEN '2019-01-01' AND '2019-03-31';

# SELECT *
# FROM Sales s
# JOIN Product p
# ON p.product_id = s.product_id;

# we want to select all products that were sold earlier than 2019-01-01 and later than 2019-03-31

# SELECT *
# FROM Sales s
# JOIN Product p
# ON p.product_id = s.product_id
# WHERE sale_date < '2019-01-01' OR sale_date > '2019-03-31';

WITH t1 AS (SELECT DISTINCT p.product_id, p.product_name, sale_date
    FROM Sales s
    JOIN Product p
    ON p.product_id = s.product_id
    WHERE sale_date NOT BETWEEN '2019-01-01' AND '2019-03-31')
SELECT p.product_id, p.product_name
FROM Sales s
JOIN Product p
ON p.product_id = s.product_id
WHERE p.product_id NOT IN (SELECT product_id FROM t1)
AND sale_date BETWEEN '2019-01-01' AND '2019-03-31';
