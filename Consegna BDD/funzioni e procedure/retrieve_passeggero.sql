CREATE or REPLACE FUNCTION retrieve_passeggero(id_passeggero INTEGER) RETURNS refcursor AS $$

    DECLARE
        cursore_passeggeri refcursor;
    BEGIN 
        OPEN cursore_passeggeri FOR SELECT * FROM passeggero AS p WHERE p.id_passeggero=id_passeggero;
        RETURN cursore_passeggeri;
    END;

$$LANGUAGE plpgsql;