-- 1890 - The latest login in 2020

/* Table: Logins

+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| user_id        | int      |
| time_stamp     | datetime |
+----------------+----------+
(user_id, time_stamp) is the primary key for this table.
Each row contains information about the login time for the user with ID user_id.


Write an SQL query to report the latest login for all users in the year 2020. Do not include the users who did not login in 2020.

Return the result table in any order.

The query result format is in the following example.



Example 1:

Input:
Logins table:
+---------+---------------------+
| user_id | time_stamp          |
+---------+---------------------+
| 6       | 2020-06-30 15:06:07 |
| 6       | 2021-04-21 14:06:06 |
| 6       | 2019-03-07 00:18:15 |
| 8       | 2020-02-01 05:10:53 |
| 8       | 2020-12-30 00:46:50 |
| 2       | 2020-01-16 02:49:50 |
| 2       | 2019-08-25 07:59:08 |
| 14      | 2019-07-14 09:00:00 |
| 14      | 2021-01-06 11:59:59 |
+---------+---------------------+
Output:
+---------+---------------------+
| user_id | last_stamp          |
+---------+---------------------+
| 6       | 2020-06-30 15:06:07 |
| 8       | 2020-12-30 00:46:50 |
| 2       | 2020-01-16 02:49:50 |
+---------+---------------------+
Explanation:
User 6 logged into their account 3 times but only once in 2020, so we include this login in the result table.
User 8 logged into their account 2 times in 2020, once in February and once in December. We include only the latest one (December) in the result table.
User 2 logged into their account 2 times but only once in 2020, so we include this login in the result table.
User 14 did not login in 2020, so we do not include them in the result table. */

WITH correct_logins AS (SELECT user_id, time_stamp
  FROM Logins
  WHERE time_stamp BETWEEN '2020-01-01' AND '2021-01-01')

SELECT user_id, MAX(time_stamp)
FROM correct_logins
GROUP BY user_id;

/* SOLUTION - we need to do this in two steps, the first is to isolate the logins that occurred in 2020. We can do this with a WITH statement, to query the Logins table and only select user_ids and time_stamps between 2020-01-01 and 2021-01-01. Then, we can query this common table expression and select each user_id and its MAX(time_stamp) to get the latest date, which we then group by user_id. */
