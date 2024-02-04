CREATE or REPLACE PROCEDURE change_login(old_login VARCHAR(1000),new_login VARCHAR(1000),password_in VARCHAR(1000)) AS $$

    DECLARE

    BEGIN
        /*Se esiste l utente corrispondente con le credenziali fornite allora si puo procedere ad aggiornarle,altrimenti lancia un errore*/
        IF(EXISTS(SELECT * FROM passeggero WHERE  password=password_in AND login=old_login)) THEN
            UPDATE passeggero SET login=new_login WHERE password=password_in AND login=old_login;
        ELSE
            RAISE EXCEPTION 'il passeggero con questa password e questa login non esiste';
        END IF;

        
    END;

$$ LANGUAGE plpgsql;