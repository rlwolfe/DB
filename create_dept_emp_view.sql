-- View: public.dept_employees (all employees under a particular manager in dept)

-- DROP VIEW public.dept_employees;

CREATE OR REPLACE VIEW public.dept_employees
 AS
 SELECT empid,
    name,
    start_date,
    birthdate
   FROM "Employee" e
  WHERE department = 'Security'::dept;

ALTER TABLE public.dept_employees
    OWNER TO postgres;

