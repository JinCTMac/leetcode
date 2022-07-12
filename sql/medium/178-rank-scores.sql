-- 178 - Rank Scores

/* Table: Scores

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| score       | decimal |
+-------------+---------+
id is the primary key for this table.
Each row of this table contains the score of a game. Score is a floating point value with two decimal places.


Write an SQL query to rank the scores. The ranking should be calculated according to the following rules:

The scores should be ranked from the highest to the lowest.
If there is a tie between two scores, both should have the same ranking.
After a tie, the next ranking number should be the next consecutive integer value. In other words, there should be no holes between ranks.
Return the result table ordered by score in descending order.

The query result format is in the following example.



Example 1:

Input:
Scores table:
+----+-------+
| id | score |
+----+-------+
| 1  | 3.50  |
| 2  | 3.65  |
| 3  | 4.00  |
| 4  | 3.85  |
| 5  | 4.00  |
| 6  | 3.65  |
+----+-------+
Output:
+-------+------+
| score | rank |
+-------+------+
| 4.00  | 1    |
| 4.00  | 1    |
| 3.85  | 2    |
| 3.65  | 3    |
| 3.65  | 3    |
| 3.50  | 4    |
+-------+------+ */

WITH t1 AS (SELECT score, DENSE_RANK() OVER (PARTITION BY score ORDER BY score DESC) AS rank1
    FROM Scores)

SELECT score, DENSE_RANK() OVER (PARTITION BY rank1 ORDER BY score DESC) AS rank
FROM t1
ORDER BY score DESC;

SELECT score, DENSE_RANK() OVER (ORDER BY score DESC) rank
FROM Scores
ORDER BY score DESC;

/* SOLUTION - the first was my brute force attempt, I knew I needed to use DENSE_RANK() to get the required rankings of the scores without any gaps in between the ranks, but I was unaware you could remove the PARTITION BY aspect of this window function. So I needed to get a column with the same values to partition by, and a first DENSE_RANK() yielded a rank column with all the values of 1 so I used that as a subquery to actually get the scores to be ranked with a partition.

The smarter solution is to use DENSE_RANK() but without a partition, instead only having the ORDER BY score to ensure that the window function doesn't take a partition and considers everything within the table to rank. */
