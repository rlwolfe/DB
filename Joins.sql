-- get the schedule of managers and what dept they work in 
SELECT e.name, m.team, w.day_of_week, w.timeslot
FROM "Employee" e
JOIN "Manager" m ON e.EmpID = m.EmpID
JOIN works w ON e.EmpID = w.EmpID;
-- Time: 142.547 ms

-- get the post and schedule for all security guards
SELECT e.name, s.location, w.day_of_week, w.timeslot 
FROM "Employee" e 
JOIN "Security" s ON e.EmpID = s.EmpID 
JOIN works w ON e.EmpID = w.EmpID;
-- Time: 179.776 ms

-- gets all secretaries that work on sundays and orders by hour
SELECT e.name, w.day_of_week, w.timeslot 
FROM "Employee" e 
JOIN "Secratary" s ON e.EmpID = s.EmpID 
JOIN works w ON e.EmpID = w.EmpID 
WHERE w.day_of_week = 'Sunday'
ORDER BY w.timeslot;
-- Time: 184.895 ms
