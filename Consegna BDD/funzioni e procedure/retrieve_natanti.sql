CREATE or REPLACE FUNCTION retrieve_natanti() RETURNS refcursor AS $$
    DECLARE
        cursore_natanti refcursor;
    BEGIN
        OPEN cursore_natanti FOR SELECT * FROM natante;
        RETURN cursore_natanti;
    END;

$$LANGUAGE plpgsql;