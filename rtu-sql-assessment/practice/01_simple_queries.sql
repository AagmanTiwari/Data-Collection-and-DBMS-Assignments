USE rtu_assignment;

-- Q1. All disabled sensors
SELECT * FROM sensors WHERE status = 'disabled';

-- Q2. Required value less than current value
SELECT * FROM sensors WHERE req_val < curr_val;

-- Q3. Temperature sensors with required value above 96
SELECT * FROM sensors
WHERE sensor_type = 'temperature' AND req_val > 96
ORDER BY req_val DESC;

-- Q4. Sensors with no current value
SELECT * FROM sensors WHERE curr_val IS NULL;

-- Q5. Temperature and pressure sensors
SELECT * FROM sensors
WHERE sensor_type IN ('temperature', 'pressure');

-- Q6. Pressure sensors in R102 with required value above 30
SELECT * FROM sensors
WHERE rtu_id = 'r102' AND sensor_type = 'pressure' AND req_val > 30;
