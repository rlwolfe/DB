-- view combines Employee info and wages (for managers)
CREATE OR REPLACE VIEW "EmployeeWages" AS
SELECT e.EmpID, e.name, e.start_date, e.birthdate, e.department, pay.status, w.wage
FROM "Employee" e
JOIN "Payment" pay ON e.EmpID = pay.EmpID
JOIN "Wages" w ON pay.ID = w.ID
ORDER BY e.EmpID;

-- view to get all payment details (for accountant)
CREATE OR REPLACE VIEW "PaymentStatus" AS
SELECT p.EmpID, p.ID AS Wages_ID, p.CashflowID, p.payDate, p.status, w.wage
FROM "Payment" p
JOIN "Wages" w ON p.ID = w.ID;