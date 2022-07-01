-- 1050 - Actors and Directors who cooperated at least 3 times

/* Table: ActorDirector

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| actor_id    | int     |
| director_id | int     |
| timestamp   | int     |
+-------------+---------+
timestamp is the primary key column for this table.


Write a SQL query for a report that provides the pairs (actor_id, director_id) where the actor has cooperated with the director at least three times.

Return the result table in any order. */

WITH t1 AS (SELECT actor_id, director_id, COUNT(*) collab_no
    FROM ActorDirector
    GROUP BY actor_id, director_id)
SELECT actor_id, director_id
FROM t1
WHERE collab_no >= 3;

/* SOLUTION - you need to group a count by both actor_id and director_id together, so that the count is for the different pairings of actor_id and director_id, and we can look for counts that are 3 or greater. View this for more explanation as to why group by with multiple parameters works (https://stackoverflow.com/questions/2421388/using-group-by-on-multiple-columns)*/
