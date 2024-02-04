CREATE or REPLACE FUNCTION retrieve_biglietti_interi(id_passeggero INTEGER) RETURNS refcursor AS 
$$

    DECLARE
        cursore_biglietti refcursor;
       
    BEGIN
        /*se non esiste un utente con l id fornito allora lancia un errore per notificarlo,altrimenti procedi al recupero dei biglietti*/
        IF(NOT EXISTS(SELECT * FROM passeggero as p WHERE p.Id_passeggero=id_passeggero)) THEN

            RAISE EXCEPTION 'l'' utente con questo id non esiste';

        END IF;


        OPEN cursore_biglietti FOR SELECT * FROM biglietto_intero WHERE Passeggero=id_passeggero;

        RETURN cursore_biglietti;
        
    END;

$$LANGUAGE plpgsql;