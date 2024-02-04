CREATE or REPLACE FUNCTION retrieve_corse(id_compagnia INTEGER) RETURNS refcursor AS 
$$

    DECLARE
        cursore_corse refcursor;
        
    BEGIN
        /*se la compagnia con l id fornito non esiste allora lancia un errore per notificarlo*/
        IF(NOT EXISTS(SELECT * FROM compagnia as c WHERE p.Id_compagnia=id_compagnia)) THEN

            RAISE EXCEPTION 'la compagnia con questo id non esiste';

        END IF;

        /*altrimenti procedi a recuperare tutte le corse della compagnia*/

        OPEN cursore_corse FOR SELECT * FROM vista_corsa_porti_natante WHERE compagnia=id_compagnia;

        RETURN cursore_corse;
        
    END;

$$LANGUAGE plpgsql;