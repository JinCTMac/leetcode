-- 1667 - Fix names in a table

/* Table: Users

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| user_id        | int     |
| name           | varchar |
+----------------+---------+
user_id is the primary key for this table.
This table contains the ID and the name of the user. The name consists of only lowercase and uppercase characters.


Write an SQL query to fix the names so that only the first character is uppercase and the rest are lowercase.

Return the result table ordered by user_id.

The query result format is in the following example.



Example 1:

Input:
Users table:
+---------+-------+
| user_id | name  |
+---------+-------+
| 1       | aLice |
| 2       | bOB   |
+---------+-------+
Output:
+---------+-------+
| user_id | name  |
+---------+-------+
| 1       | Alice |
| 2       | Bob   |
+---------+-------+

*/

SELECT user_id, CONCAT(UPPER(LEFT(name, 1)), LOWER(SUBSTRING(name, 2, LENGTH(name)))) AS name
FROM Users
ORDER BY user_id;

/* SOLUTION - to capitalise the first letter of a string and lowercase the left, we need to make use of multiple string manipulation functions.

1) We use LEFT to extract the first letter of the string, and wrap it in the UPPER function to uppercase the first letter.

2) We then use LOWER and SUBSTRING to extractt the rest of the string past the first letter, using the LENGTH function to return the length of the string up to which we extract the string characters.

3) Finally, we use the CONCAT function with the results of these two string functions as paramters, to join them into a new column name, and order the whole table by user_id. */

/* URLS:

https://www.w3resource.com/mysql/string-functions/mysql-concat-function.php

https://www.w3schools.com/sql/func_mysql_length.asp

https://www.w3schools.com/mysql/func_mysql_left.asp

https://www.w3schools.com/mysql/func_mysql_lower.asp

https://www.w3schools.com/sql/func_mysql_upper.asp

*/
