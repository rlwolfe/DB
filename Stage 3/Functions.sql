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
