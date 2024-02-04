CREATE or REPLACE FUNCTION retrieve_accompagnatori() RETURNS refcursor AS $$

    DECLARE
        cursore_passeggeri refcursor;
    BEGIN
        OPEN cursore_passeggeri FOR SELECT * FROM passeggero WHERE Eta >= 16;

        RETURN cursore_passeggeri;
    END;


$$ LANGUAGE plpgsql;