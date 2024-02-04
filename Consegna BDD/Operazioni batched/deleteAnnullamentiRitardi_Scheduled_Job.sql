DO $$
DECLARE
    jid integer;
    scid integer;
BEGIN
-- Creiamo un nuovo job
INSERT INTO pgagent.pga_job(
    jobjclid, jobname, jobdesc, jobhostagent, jobenabled
) VALUES (
    1::integer, 'delete Annullamenti e Ritardi'::text, ''::text, ''::text, true
) RETURNING jobid INTO jid;

-- Steps
-- Inseriamo uno step (delete annullamenti)(jobid: NULL)
INSERT INTO pgagent.pga_jobstep (
    jstjobid, jstname, jstenabled, jstkind,
    jstconnstr, jstdbname, jstonerror,
    jstcode, jstdesc
) VALUES (
    jid, 'delete annullamenti'::text, true, 's'::character(1),
    'host=''ep-holy-pine-64797515.eu-central-1.aws.neon.tech'' dbname=''Arturo%27s%20Sea%20Travels'' user=''riccpuggio'' password=''owYA6Z4KklUN'''::text, ''::name, 'f'::character(1),
    'DELETE FROM annullamento;'::text, ''::text
) ;
-- Inseriamo uno step (delete ritardi)(jobid: NULL)
INSERT INTO pgagent.pga_jobstep (
    jstjobid, jstname, jstenabled, jstkind,
    jstconnstr, jstdbname, jstonerror,
    jstcode, jstdesc
) VALUES (
    jid, 'delete ritardi'::text, true, 's'::character(1),
    'host=''ep-holy-pine-64797515.eu-central-1.aws.neon.tech'' dbname=''Arturo%27s%20Sea%20Travels'' user=''riccpuggio'' password=''owYA6Z4KklUN'''::text, ''::name, 'f'::character(1),
    'DELETE FROM ritardo;'::text, ''::text
) ;

-- Schedules
-- Inseriamo uno schedule per l esecuzione automatica
INSERT INTO pgagent.pga_schedule(
    jscjobid, jscname, jscdesc, jscenabled,
    jscstart,     jscminutes, jschours, jscweekdays, jscmonthdays, jscmonths
) VALUES (
    jid, 'deleteRitardoAnnullamenti'::text, ''::text, true,
    '2024-01-26 12:25:51 +01:00'::timestamp with time zone, 
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