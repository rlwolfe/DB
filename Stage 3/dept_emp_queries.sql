-- INSERT
INSERT INTO "Employee" (empid, name, start_date, birthdate, department)
VALUES (300999, 'Joe Shmo', '2010-10-10', '1948-04-14', 'Security');

Insert INTO "Security" (empid, location)
VALUES (300999, 'Archives');

-- UPDATE
UPDATE "Security"
SET location = 'Front door'
WHERE EmpID = 35;

-- DELETE
DELETE FROM "Security"
WHERE empID = 23;

DELETE FROM "Employee"
WHERE empID = 23;
