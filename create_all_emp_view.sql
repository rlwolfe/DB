-- View: public.all_employees (all employees can be seen my the CEO)

-- DROP VIEW public.all_employees;

CREATE OR REPLACE VIEW public.all_employees AS
 SELECT empid,
    name,
    start_date,
    birthdate,
    department
   FROM "Employee";

ALTER TABLE public.all_employees
    OWNER TO postgres;

