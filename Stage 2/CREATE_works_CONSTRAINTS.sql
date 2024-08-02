-- Table: public.works

-- DROP TABLE IF EXISTS public.works;

CREATE TABLE IF NOT EXISTS public.works
(
    empid integer NOT NULL,
    day_of_week days NOT NULL,
    timeslot interval NOT NULL,
    CONSTRAINT pk_works PRIMARY KEY (empid, day_of_week, timeslot),
    CONSTRAINT fk_works FOREIGN KEY (empid)
        REFERENCES public."Employee" (empid) MATCH FULL
        ON UPDATE CASCADE
        ON DELETE NO ACTION,
    CONSTRAINT fk_works2 FOREIGN KEY (day_of_week, timeslot)
        REFERENCES public."Shift" (day_of_week, timeslot) MATCH FULL
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT check_timeslot CHECK (timeslot >= '08:00:00'::time without time zone::interval AND timeslot <= '20:00:00'::time without time zone::interval)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.works
    OWNER to postgres;
