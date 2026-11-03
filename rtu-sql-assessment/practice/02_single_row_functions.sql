USE rtu_assignment;

-- Q1. Uppercase username, formatted role, username length
SELECT
    UPPER(user_name),
    CONCAT(UPPER(LEFT(`ROLE`, 1)), LOWER(SUBSTRING(`ROLE`, 2))),
    LENGTH(user_name)
FROM users;

-- Q2. Percentage deviation from required reading, rounded
SELECT
    sensor_id,
    ROUND(ABS((req_val - curr_val) / req_val * 100), 0) AS percentage_diff
FROM sensors;
