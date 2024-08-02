-- Table: public.Employee

-- DROP TABLE IF EXISTS public."Employee";

CREATE TABLE IF NOT EXISTS public."Employee"
(
    empid integer NOT NULL DEFAULT nextval('seq_employee_empid'::regclass),
    name character varying COLLATE pg_catalog."default" NOT NULL,
    start_date date NOT NULL,
    birthdate date NOT NULL,
    department dept NOT NULL,
    CONSTRAINT pk_employee PRIMARY KEY (empid),
    CONSTRAINT check_age CHECK (start_date >= (birthdate + '16 years'::interval))
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Employee"
    OWNER to postgres;

GRANT ALL ON TABLE public."Employee" TO PUBLIC;

GRANT ALL ON TABLE public."Employee" TO postgres;
-- Index: emp_bday_id

-- DROP INDEX IF EXISTS public.emp_bday_id;

CREATE INDEX IF NOT EXISTS emp_bday_id
    ON public."Employee" USING btree
    (birthdate ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: emp_start_id

-- DROP INDEX IF EXISTS public.emp_start_id;

CREATE INDEX IF NOT EXISTS emp_start_id
    ON public."Employee" USING btree
    (start_date ASC NULLS LAST)
    TABLESPACE pg_default;
