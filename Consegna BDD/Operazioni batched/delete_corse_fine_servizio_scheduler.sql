DO $$
DECLARE
    jid integer;
    scid integer;
BEGIN
-- crea un nuovo job
INSERT INTO pgagent.pga_job(
    jobjclid, jobname, jobdesc, jobhostagent, jobenabled
) VALUES (
    1::integer, 'delete corse fine periodo'::text, ''::text, ''::text, true
) RETURNING jobid INTO jid;

-- Steps
-- inseriamo gli steps
INSERT INTO pgagent.pga_jobstep (
    jstjobid, jstname, jstenabled, jstkind,
    jstconnstr, jstdbname, jstonerror,
    jstcode, jstdesc
) VALUES (
    jid, 'delete corse'::text, true, 's'::character(1),
    'host=''ep-holy-pine-64797515.eu-central-1.aws.neon.tech'' dbname=''Arturo%27s%20Sea%20Travels'' user=''riccpuggio'' password=''owYA6Z4KklUN'''::text, ''::name, 'f'::character(1),
    'DELETE FROM corsa WHERE data_fine_servizio>= CURRENT_DATE'::text, ''::text
) ;

-- Schedules
-- inseriamo uno schedule
INSERT INTO pgagent.pga_schedule(
    jscjobid, jscname, jscdesc, jscenabled,
    jscstart,     jscminutes, jschours, jscweekdays, jscmonthdays, jscmonths
) VALUES (
    jid, 'scheduler cancella data_fine_servizio'::text, ''::text, true,
    '2024-02-04 19:17:00 +01:00'::timestamp with time zone, 
    -- Minutes
    '{t,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f}'::bool[]::boolean[],
    -- Hours
    '{t,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f}'::bool[]::boolean[],
    -- Week days
    '{f,f,f,f,f,f,f}'::bool[]::boolean[],
    -- Month days
    '{f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f,f}'::bool[]::boolean[],
    -- Months
    '{f,f,f,f,f,f,f,f,f,f,f,f}'::bool[]::boolean[]
) RETURNING jscid INTO scid;
END
$$;