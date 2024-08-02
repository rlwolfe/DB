-- INSERT
INSERT INTO "Employee" (empid, name, start_date, birthdate, department)
VALUES (399999, 'Plony Almoni', '2020-01-01', '2000-11-11', 'Library');

-- UPDATE
UPDATE "Employee"
SET start_date = '2024-07-15'
WHERE EmpID = 101;

-- DELETE
DELETE FROM "Employee"
WHERE EmpID = 102;
