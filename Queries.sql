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


/****FUNCS****/
-- counts all employees
CREATE OR REPLACE FUNCTION total_employees()
RETURNS TABLE (department TEXT, num_employees INTEGER)
AS $$
BEGIN
    RETURN QUERY
    SELECT e.department::TEXT, COUNT(*) AS num_employees
    FROM "Employee" e
END;
$$
LANGUAGE plpgsql;


-- displays all employees working today
CREATE OR REPLACE FUNCTION employees_working_today()
RETURNS TABLE (empid INTEGER, name VARCHAR, day_of_week days, timeslot INTERVAL)
AS $$
BEGIN
    RETURN QUERY
    SELECT e.empid, e.name, w.day_of_week, w.timeslot
    FROM "Employee" e
    JOIN works w ON e.empid = w.empid
    WHERE w.day_of_week = to_char(current_date, 'Day'::text)::days;
END;
$$
LANGUAGE plpgsql;


-- displays all secrataries
CREATE OR REPLACE FUNCTION all_secretaries()
RETURNS TABLE (empid INTEGER, name VARCHAR, day_of_week days, timeslot INTERVAL)
AS $$
BEGIN
    RETURN QUERY
    SELECT e.empid, e.name, w.day_of_week, w.timeslot
    FROM "Employee" e
    JOIN works w ON e.empid = w.empid
    WHERE e.department = 'Library'::dept;
END;
$$
LANGUAGE plpgsql;


-- displays all preservers ordered by their specialty
CREATE OR REPLACE FUNCTION preservers_by_specialty()
RETURNS TABLE (empid INTEGER, name VARCHAR, specialty specialty)
AS $$
BEGIN
    RETURN QUERY
    SELECT e.empid, e.name, w.day_of_week, w.timeslot
    FROM "Employee" e
    JOIN works w ON e.empid = w.empid
	WHERE e.department = 'Archives'::dept
	ORDER BY w.day_of_week, w.timeslot;
END;
$$
LANGUAGE plpgsql;
