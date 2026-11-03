USE rtu_assignment;

-- Q1. Total pressure sensors
SELECT COUNT(sensor_type)
FROM sensors
WHERE sensor_type = 'pressure';

-- Q2. Count enabled and disabled sensors, sorted by count
SELECT status, COUNT(*)
FROM sensors
GROUP BY status
ORDER BY COUNT(*);

-- Q3. Count sensors for every sensor type
SELECT sensor_type, COUNT(*)
FROM sensors
GROUP BY sensor_type;

-- Q4. Count sensors under each RTU
SELECT rtu_id, COUNT(sensor_id)
FROM sensors
GROUP BY rtu_id;

-- Q5. Count sensors for each user, minimum 3, excluding U503
SELECT user_id, COUNT(sensor_id)
FROM controller
WHERE user_id != 'u503'
GROUP BY user_id
HAVING COUNT(sensor_id) >= 3
ORDER BY user_id;
