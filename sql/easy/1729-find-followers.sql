-- 1729 - Find followers count

/* https://leetcode.com/problems/find-followers-count/ */

/* Table: Followers

+-------------+------+
| Column Name | Type |
+-------------+------+
| user_id     | int  |
| follower_id | int  |
+-------------+------+
(user_id, follower_id) is the primary key for this table.
This table contains the IDs of a user and a follower in a social media app where the follower follows the user.


Write an SQL query that will, for each user, return the number of followers.

Return the result table ordered by user_id.

The query result format is in the following example.



Example 1:

Input:
Followers table:
+---------+-------------+
| user_id | follower_id |
+---------+-------------+
| 0       | 1           |
| 1       | 0           |
| 2       | 0           |
| 2       | 1           |
+---------+-------------+
Output:
+---------+----------------+
| user_id | followers_count|
+---------+----------------+
| 0       | 1              |
| 1       | 1              |
| 2       | 2              |
+---------+----------------+
Explanation:
The followers of 0 are {1}
The followers of 1 are {0}
The followers of 2 are {0,1} */

SELECT user_id, COUNT(user_id) followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id;

/* SOLUTION - the user_id column tells us the user that is being followed, and the follower_id column tells us the id of the follower. In reality, the follower_id column is useless, as we just need to look at the user_id column which tells us the number of followers that each user_id has, and the frequency of the same user_id occurring in the column represents their follower count. Hence, all we need to do is use COUNT on the user_id column and group by user_id, which returns the values we need. */
