CREATE or REPLACE FUNCTION check_ridotto() RETURNS trigger AS $check_ridotto$
    
    DECLARE

       eta_passeggero integer;
       eta_accompagnatore integer;
    
    BEGIN

        /*il trigger controlla che il passeggero abbia effettivamente meno di 16 anni e che l 'accompagnatore abbia piu o almeno 16 anni, se non vero allora lo notifica con un errore*/

        SELECT eta INTO eta_passeggero FROM passeggero WHERE Id_passeggero=new.passeggero;
        SELECT eta INTO eta_accompagnatore FROM passeggero WHERE Id_passeggero=new.Accompagnatore;

        /*controlla inoltre prima che l'accompagnatore abbia comprato un biglietto per la stessa corsa*/

        IF (new.accompagnatore NOT IN (SELECT passeggero FROM biglietto_intero WHERE corsa=new.corsa)) THEN
            RAISE EXCEPTION 'l'' accompagnatore deve prima acquistare il biglietto per la stessa corsa';
        END IF;

        IF(eta_accompagnatore<16) THEN
            RAISE EXCEPTION 'l'' accompagnatore non puo avere meno di 16 anni';
        END IF;
        

        IF(eta_passeggero>=16) THEN
            RAISE EXCEPTION 'Un passeggero di eta maggiore non puo acquistare un biglietto ridotto';
        END IF;
        

        RETURN new;
    END;
$check_ridotto$ LANGUAGE plpgsql;

CREATE or REPLACE TRIGGER check_ridotto 
BEFORE INSERT OR UPDATE OF corsa ON biglietto_ridotto
FOR EACH ROW
EXECUTE FUNCTION check_ridotto();