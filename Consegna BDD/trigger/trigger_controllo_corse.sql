CREATE or REPLACE FUNCTION check_corsa() RETURNS trigger AS $check_corsa$
    
    BEGIN

       /*il trigger verifica se esiste gia un altra corsa per il natante tale che le corse hanno periodi e orari in overlapping, se esiste lancia un arrore per notificarlo*/

        IF(EXISTS(SELECT * FROM corsa WHERE natante=new.natante AND (CAST(new.giorni_servizio_attivo & giorni_servizio_attivo AS VARCHAR(7)) LIKE '%1%') 
        AND (Data_inizio_Servizio<=new.Data_fine_servizio AND Data_fine_servizio>=new.Data_inizio_Servizio) AND 
        (Orario_partenza<=new.Orario_arrivo AND Orario_arrivo>=new.Orario_partenza))) THEN

            RAISE EXCEPTION 'il natante specificato per questa corsa esegue gia un altra corsa nelle date, nei giorni e negli orari specificati';

        END IF;
        
        

        RETURN NEW;
    END;
$check_corsa$ LANGUAGE plpgsql;

CREATE or REPLACE TRIGGER check_corsa 
BEFORE INSERT OR UPDATE ON corsa
FOR EACH ROW
EXECUTE FUNCTION check_corsa();