-- 1527 - Patients with a condition

/* Table: Patients

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| patient_id   | int     |
| patient_name | varchar |
| conditions   | varchar |
+--------------+---------+
patient_id is the primary key for this table.
'conditions' contains 0 or more code separated by spaces.
This table contains information of the patients in the hospital.


Write an SQL query to report the patient_id, patient_name all conditions of patients who have Type I Diabetes. Type I Diabetes always starts with DIAB1 prefix

Return the result table in any order. */

SELECT patient_id, patient_name, conditions
FROM Patients
WHERE conditions LIKE '% DIAB1%'
OR conditions LIKE 'DIAB1%';

/* SOLUTION - not just a simple %DIAB1% since there are edge cases, so we need to do two LIKE conditions where one is testing for DIAB1 at the start of the string, the other is testing for DIAB1 later in the string but still at the start of a word */
