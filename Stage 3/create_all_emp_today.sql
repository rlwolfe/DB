-- View: public.employees_working_today (get all employees working today)

-- DROP VIEW public.employees_working_today;

CREATE OR REPLACE VIEW public.employees_working_today
 AS
 SELECT e.empid,
    e.name,
    w.day_of_week,
    w.timeslot
   FROM "Employee" e
     JOIN works w ON e.empid = w.empid
  WHERE w.day_of_week = (( SELECT current_day_alias.current_day
           FROM ( SELECT RTRIM(to_char(CURRENT_DATE::timestamp with time zone, 'Day'::text))::days AS current_day) current_day_alias));

ALTER TABLE public.employees_working_today
    OWNER TO postgres;

