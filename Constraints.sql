/****Parametrized Queries****/
-- employees with no shifts
SELECT e.empid, e.name 
FROM "Employee" e 
LEFT JOIN works w ON e.empid = w.empid 
WHERE w.empid IS NULL;
-- Time: 180.442 ms
-- Time after indexing: 191.169 ms

-- list all employees working today
SELECT e.empid, e.name, w.day_of_week, w.timeslot 
FROM "Employee" e 
JOIN works w ON e.empid = w.empid 
WHERE w.day_of_week = (SELECT RTRIM(to_char(current_date, 'Day'))::days);
-- Time: 44.389 ms
-- Time after indexing: 67.274 ms

-- employees per shift
SELECT day_of_week, timeslot, COUNT(empid) AS num_employees 
FROM works 
GROUP BY day_of_week, timeslot 
ORDER BY day_of_week, timeslot;
-- Time: 9.803 ms
-- Time after indexing: 11.136 ms

-- calculate employee's seniority (years working)
SELECT empid, start_date, 
	EXTRACT(YEAR FROM AGE(current_date, start_date)) AS years_worked 
FROM "Employee";
-- Time: 475.961 ms
-- Time after indexing: 513.751 ms

