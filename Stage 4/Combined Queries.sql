-- Queries for EmployeeWages
-- Select employees ordered by age (oldest first) that make less than 500 
SELECT empid, name, birthdate, wage
FROM public."EmployeeWages"
WHERE wage < 500
ORDER BY birthdate

-- Insert new payment for an employee
INSERT INTO public."Payment" (EmpID, ID, payDate, status)
	VALUES (456, 4, '2024-08-20', 'FALSE');
	
-- Queries for PaymentStatus
-- Select employees who haven't been paid yet
SELECT empid, wage, paydate, status
FROM public."PaymentStatus"
WHERE status = 'False';

-- Update all archives employees payment status to True
Update public."Payment"
SET status = 'True'
WHERE ID = 2;
