-- 627 - Swap Salary

/*

*/

UPDATE Salary
SET CASE sex WHEN "m" THEN 'f'
ELSE "m"
END;

/* SOLUTION - when you need multiple conditions to evaluate without using OR or AND, then a CASE statement makes sense, and this works in the case since we need to change the value based on if the original value is m or f */
