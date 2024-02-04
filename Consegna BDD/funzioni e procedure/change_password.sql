CREATE or REPLACE PROCEDURE change_password(login_in VARCHAR(1000),new_password VARCHAR(1000),old_password VARCHAR(1000)) AS $$

    DECLARE

    BEGIN
        /*Se esiste l utente corrispondente con le credenziali fornite allora si puo procedere ad aggiornarle,altrimenti lancia un errore*/
        IF(EXISTS(SELECT * FROM passeggero WHERE login=login_in AND password=old_password)) THEN
            UPDATE passeggero SET password=new_password WHERE login=login_in AND password=old_password;

        ELSE
            RAISE EXCEPTION 'il passeggero con questa login e questa password non esiste';
        END IF;

        
    END;

$$ LANGUAGE plpgsql;