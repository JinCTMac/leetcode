-- 511 - Gameplay Analysis 1

/* Table: Activity

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| player_id    | int     |
| device_id    | int     |
| event_date   | date    |
| games_played | int     |
+--------------+---------+
(player_id, event_date) is the primary key of this table.
This table shows the activity of players of some games.
Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on someday using some device.


Write an SQL query to report the first login date for each player.

Return the result table in any order. */

SELECT player_id, MIN(player_id) first_login
FROM Activity
GROUP BY player_id;

/* SOLUTION - simple query that uses the MIN function to find the lowest value in a column, which for dates returns the earliest date, and groups this by player_id, hence finding the first login date for each player_id */
