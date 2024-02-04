CREATE or REPLACE PROCEDURE add_ritardo(motivazione_in VARCHAR(1000),ritardo_in TIME,id_corsa INTEGER) AS $$

    DECLARE

    BEGIN
        /*se la corsa indicata non esiste lancia un errore per notificarlo*/
        IF (NOT EXISTS(SELECT * FROM corsa AS c WHERE c.id_corsa=id_corsa)) THEN
            RAISE EXCEPTION 'La corsa indicata non esiste';
        END IF;

        /*se esiste gia un ritardo per la corsa allora aggiorna i dati del ritardo sommando i tempi di tutti i ritardi e concatenando le motivazioni fra loro*/
        IF (EXISTS(SELECT * FROM ritardo WHERE corsa=id_corsa)) THEN
            UPDATE ritardo SET motivazione= motivazione || '--' ||  motivazione_in, ritardo= ritardo + ritardo_in WHERE corsa=id_corsa;
        /*altrimenti procedi a creare il ritardo*/
        ELSE
            INSERT INTO ritardo VALUES (id_corsa, ritardo_in, motivazione_in);
        END IF;
    END;

$$ LANGUAGE plpgsql;