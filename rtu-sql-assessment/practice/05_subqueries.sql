    SELECT sensor_id
    FROM controller
    WHERE user_id IN (
        SELECT user_id
        FROM users
        WHERE user_name = 'smitha'
    )
);

-- Q4. Display user details controlling sensors between S803 and S808
SELECT *
FROM users
WHERE user_id IN (
    SELECT user_id
    FROM controller
    WHERE sensor_id BETWEEN 'S803' AND 'S808'
);

-- Q5. Display user details controlling the most sensors
-- Includes ties when two or more users control the same maximum count.
SELECT *
FROM users
WHERE user_id IN (
    SELECT user_id
    FROM controller
    GROUP BY user_id
    HAVING COUNT(*) = (
        SELECT MAX(sensor_count)
        FROM (
            SELECT COUNT(*) AS sensor_count
            FROM controller
            GROUP BY user_id
        ) AS user_counts
    )
);

-- Q6. Display RTU details for the RTU(s) having the most sensors
-- Includes ties when two or more RTUs have the same maximum count.
SELECT *
FROM rtu
WHERE rtu_id IN (
    SELECT rtu_id
    FROM sensors
    GROUP BY rtu_id
    HAVING COUNT(*) = (
        SELECT MAX(sensor_count)
        FROM (
            SELECT COUNT(*) AS sensor_count
            FROM sensors
            GROUP BY rtu_id
        ) AS rtu_counts
    )
);
