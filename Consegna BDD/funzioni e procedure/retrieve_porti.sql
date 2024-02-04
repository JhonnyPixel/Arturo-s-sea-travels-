CREATE or REPLACE FUNCTION retrieve_porti() RETURNS refcursor AS $$
    DECLARE
        cursore_porti refcursor;
    BEGIN
        OPEN cursore_porti FOR SELECT * FROM porto;
        RETURN cursore_porti;
    END;

$$LANGUAGE plpgsql;