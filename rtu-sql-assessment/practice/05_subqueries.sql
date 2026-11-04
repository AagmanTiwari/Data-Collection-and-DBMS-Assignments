
USE rtu_assignment;

-- Q1. Display sensor details located in CHENNAI

SELECT *
FROM sensors
WHERE rtu_id = (
    SELECT rtu_id
    FROM rtu
    WHERE location = 'chennai'
);


-- Q2. Display user details controlling sensors in MUMBAI

SELECT *
FROM users
WHERE user_id IN (
    SELECT user_id
    FROM controller
    WHERE sensor_id IN (
        SELECT sensor_id
        FROM sensors
        WHERE rtu_id IN (
            SELECT rtu_id
            FROM rtu
            WHERE location = 'mumbai'
        )
    )
);


-- Q3. Display sensor details controlled by SMITHA

SELECT *
FROM sensors
WHERE sensor_id IN (
    SELECT sensor_id
    FROM controller
    WHERE user_id IN (
        SELECT user_id
        FROM users
        WHERE user_name = 'smitha'
    )
);


-- Q4. Display user details controlling sensors
-- with IDs between S803 and S808

SELECT *
FROM users
WHERE user_id IN (
    SELECT user_id
    FROM controller
    WHERE sensor_id BETWEEN 'S803' AND 'S808'
);


-- Q5. Display user details controlling
-- the maximum number of sensors

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


-- Q6. Display RTU details having
-- the maximum number of sensors

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
