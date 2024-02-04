CREATE or REPLACE FUNCTION check_intero() RETURNS trigger AS $check_intero$
    
    DECLARE

       eta_passeggero integer;
    
    BEGIN

        /*il trigger controlla che il passeggero abbia effettivamente piu o almeno 16 anni, se non vero allora lo notifica con un errore*/

        SELECT eta INTO eta_passeggero FROM passeggero WHERE Id_passeggero=new.passeggero;

        IF(eta_passeggero<16) THEN
            RAISE EXCEPTION 'Un passeggero di eta minore non puo acquistare un biglietto intero';
        END IF;
        

        RETURN new;
    END;
$check_intero$ LANGUAGE plpgsql;

CREATE or REPLACE TRIGGER check_intero
BEFORE INSERT OR UPDATE OF corsa ON biglietto_intero
FOR EACH ROW
EXECUTE FUNCTION check_intero();