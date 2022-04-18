/* 175 - Combine Two Tables https://leetcode.com/problems/combine-two-tables/*/

/* Write an SQL query to report the first name, last name, city, and state of each person in the Person table. If the address of a personId is not present in the Address table, report null instead.

Return the result table in any order.

The query result format is in the following example. */

-- # Write your MySQL query statement below
SELECT p.firstName firstName, p.lastName lastName, a.city city, a.state state
FROM Person p
LEFT JOIN Address a
ON p.personId = a.personId;
