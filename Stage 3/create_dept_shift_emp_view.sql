-- View: public.all_employee_shifts_per_dept (all shifts of employees in one department)

-- DROP VIEW public.all_employee_shifts_per_dept;

CREATE OR REPLACE VIEW public.all_employee_shifts_per_dept
 AS
 SELECT e.empid,
    e.name,
    w.day_of_week,
    w.timeslot
   FROM "Employee" e
     JOIN works w ON e.empid = w.empid
  WHERE e.department = 'Desk'::dept;

ALTER TABLE public.all_employee_shifts_per_dept
    OWNER TO postgres;

