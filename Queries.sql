/****SELECTS****/
-- all employees and their shifts
SELECT * FROM works 
ORDER BY day_of_week ASC, timeslot ASC;
-- Time: 52.063 ms
-- Time after indexing: 120.413 ms

-- employees with birthdays this month
SELECT empid, name, birthdate 
FROM "Employee" 
WHERE EXTRACT(MONTH FROM birthdate) = EXTRACT(MONTH FROM CURRENT_DATE);
-- Time: 216.421 ms
-- Time after indexing: 85.316 ms

-- total number of shifts each employee has this week
SELECT e.empid, e.name, count(*) AS total_shifts 
FROM works w 
JOIN "Employee" e ON w.empid = e.empid 
GROUP BY e.empid;
-- Time: 221.055 ms
-- Time after indexing: 171.578 ms

-- shifts with no employees
SELECT s.day_of_week, s.timeslot 
FROM "Shift" s 
LEFT JOIN works w ON s.day_of_week = w.day_of_week AND s.timeslot = w.timeslot 
WHERE w.empid IS NULL; 
-- Time: 9.563 ms
-- Time after indexing: 9.994 ms


/****UPDATES****/
-- update the specialtiy of a librarian
UPDATE "Librarian" 
SET specialty = 'fantasy' 
WHERE empid = 4;
-- Time: 14.378 ms
-- Time after indexing: 1.249 ms

-- change an employee's shift
UPDATE works 
SET empid = 9 
WHERE day_of_week = 'Monday' AND timeslot = '18:00';
-- Time: 12.382 ms
-- Time after indexing: 4.006 ms

/****DELETES****/
-- delete an employee's shifts
DELETE FROM works 
WHERE empid = 187881;
-- Time: 1.140 ms
-- Time after indexing: 5.135 ms

-- delete all shifts on a day that the library will be closed
DELETE FROM works 
WHERE day_of_week = 'Monday';
-- Time: 18.032 ms
-- Time after indexing: 10.508 ms