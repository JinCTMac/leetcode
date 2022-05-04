-- 620 - Not boring movies

/* Table: Cinema

+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| id             | int      |
| movie          | varchar  |
| description    | varchar  |
| rating         | float    |
+----------------+----------+
id is the primary key for this table.
Each row contains information about the name of a movie, its genre, and its rating.
rating is a 2 decimal places float in the range [0, 10]


Write an SQL query to report the movies with an odd-numbered ID and a description that is not "boring".

Return the result table ordered by rating in descending order. */

SELECT *
FROM Cinema
WHERE id % 2 != 0
AND description NOT LIKE '%boring%'
ORDER BY rating DESC;

/* SOLUTION - use simple arithmetic function to check modulo 2 is not 0 (otherwise it would be even), and then make sure the description does not contain the word boring, then order by rating in desc order */
