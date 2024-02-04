CREATE or REPLACE  PROCEDURE register_passeggero(nome VARCHAR(100),login VARCHAR(100), password VARCHAR(100),eta INTEGER)
AS $$
    DECLARE

    BEGIN
        /*Se esiste gia un utente con le credenziali fornite allora viene lanciato un errore che lo notifica*/
        IF(EXISTS(SELECT * FROM passeggero AS p WHERE p.Login=login AND p.Password=login)) THEN
            RAISE EXCEPTION 'l'' utente con queste credenziali esiste gia';
        END IF;

        INSERT INTO passeggero VALUES (nome,login,password,eta);
    END;

$$ LANGUAGE plpgsql;