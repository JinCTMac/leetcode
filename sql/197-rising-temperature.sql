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

With t1 AS (SELECT id, temperature, recordDate,
LAG(temperature) OVER (ORDER BY recordDate) AS previous_temp,
LAG(recordDate) OVER (ORDER BY recordDate) AS previous_date
FROM Weather)

SELECT id
FROM t1
WHERE temperature > previous_temp
AND recordDate > previous_date;

/* possible SOLUTION - our goal is to compare the values in the temperature with those in the previous row. We can look at the value of the previous row by using the LAG window function, which returns the value of the previous row based on the columns we want. We can create a subquery table with the temperature, and the temperature on the previous day, and then query that table to select only ids where the temperature is greater (>) than the previous temperature. */

/* HOWEVER, with questions like these when you need to compare the information on one row against the information on another row in the same table, you need to do a self join.

In our case, we can self join on recordDate, as this is what we want to remain consistent and compare against, and use the DATEDIFF function to ensure that the dates being compared are exactly one day apart. This question doesn't like it if the dates are more than a day apart, so we need to use DATEDIFF instead of LAG, which would allow us to compare records regardless of if the date is a day apart or a month apart. */

SELECT *
FROM Weather w1
JOIN Weather w2
ON DATEDIFF(w1.recordDate, w2.recordDate) = -1

/* The above code ensures that we are able to return a second recordDate column that lists the date of the following day. w1 is considered to be the previous day, and w2 is considered to be the current day for our calculations. */

SELECT w2.id
FROM Weather w1
JOIN Weather w2
ON DATEDIFF(w1.recordDate, w2.recordDate) = -1
WHERE w2.temperature > w1.temperature;

/* So in order to select the ids we want, we select ids from table w2, on the conditional that w2's temperature is greater than w1's temperature aka the previous day temperature.*/
