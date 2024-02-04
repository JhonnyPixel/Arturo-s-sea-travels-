CREATE or REPLACE PROCEDURE delete_corsa(id_corsa INTEGER) AS $$
    DECLARE
        
    BEGIN
        DELETE FROM corsa AS c WHERE c.id_corsa=id_corsa;
    END;
$$LANGUAGE plpgsql;