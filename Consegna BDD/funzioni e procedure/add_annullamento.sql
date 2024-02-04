CREATE or REPLACE PROCEDURE add_annullamento(descrizione_in VARCHAR(1000),rimborso_in FLOAT,id_corsa INTEGER,id_prossimo INTEGER) AS $$

    DECLARE

    BEGIN
        /*se la corsa indicata non esiste lancia un errore per notificarlo*/
        IF (NOT EXISTS(SELECT * FROM corsa AS c WHERE c.id_corsa=id_corsa)) THEN
            RAISE EXCEPTION 'La corsa indicata non esiste';
        END IF;

        /*se esiste gia un annullamento per una corsa allora lancia un errore per notificarlo*/

        IF (EXISTS(SELECT * FROM annullamento WHERE corsa=id_corsa)) THEN
            RAISE EXCEPTION 'La corsa e gia stata annullata';
        ELSE
            INSERT INTO annullamento VALUES (id_corsa, id_prossimo, rimborso_in, descrizione_in);
        END IF;
    END;

$$ LANGUAGE plpgsql;