-- First set of inserts for EmployeeWages view
-- Insert employee
INSERT INTO "Employee" (EmpID, name, start_date, birthdate, department)
VALUES (13, 'John Doe', '2020-08-21', '1985-06-15', 'Library');

-- Insert librarian
INSERT INTO "Librarian" (EmpID, specialty)
VALUES (13, 'mystery');

-- Insert payment
INSERT INTO "Payment" (EmpID, id, cashflowid, paydate, status)
VALUES (13, 0, 13, '2024-08-01', 'True');

-- First set of inserts for PaymentStatus view
-- Insert payment
INSERT INTO "Payment" (EmpID, id, cashflowid, paydate, status)
VALUES (13, 0, 13, '2024-10-09', 'False');
