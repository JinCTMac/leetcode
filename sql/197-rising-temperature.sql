-- 197 - Rising Temperature

/* Table: Weather

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| recordDate    | date    |
| temperature   | int     |
+---------------+---------+
id is the primary key for this table.
This table contains information about the temperature on a certain day.

Weather table:
+----+------------+-------------+
| id | recordDate | temperature |
+----+------------+-------------+
| 1  | 2015-01-01 | 10          |
| 2  | 2015-01-02 | 25          |
| 3  | 2015-01-03 | 20          |
| 4  | 2015-01-04 | 30          |
+----+------------+-------------+
Output:
+----+
| id |
+----+
| 2  |
| 4  |
+----+

Write an SQL query to find all dates' Id with higher temperatures compared to its previous dates (yesterday).

Return the result table in any order. */

With t1 AS (SELECT id, temperature,
LAG(temperature) OVER (ORDER BY id) AS previous_temp
FROM Weather)

SELECT id
FROM t1
WHERE temperature > previous_temp;

/* SOLUTION - our goal is to compare the values in the temperature with those in the previous row. We can look at the value of the previous row by using the LAG window function, which returns the value of the previous row based on the columns we want. We can create a subquery table with the temperature, and the temperature on the previous day, and then query that table to select only ids where the temperature is greater (>) than the previous temperature. */
