CREATE or REPLACE FUNCTION retrieve_social(id_compagnia INTEGER) RETURNS refcursor AS $$
    DECLARE
        cursore_social refcursor;
    BEGIN
        OPEN cursore_social FOR SELECT * FROM social WHERE compagnia=id_compagnia;
        RETURN cursore_social;
    END;

$$LANGUAGE plpgsql;
