USE rtu_assignment;

-- Joins Q1: RTU details with sensor details for all RTUs.
-- Still working on this question. These were the two attempts so far.
-- Both queries only return RTUs with matching sensors (R105 is left out).

-- Attempt 1: join condition in WHERE clause
SELECT *
FROM rtu r, sensors s
WHERE r.rtu_id = s.rtu_id;

-- Attempt 2: explicit INNER JOIN
SELECT *
FROM rtu r
INNER JOIN sensors s ON r.rtu_id = s.rtu_id;

-- Pending: update this after solving the question for all RTUs.
