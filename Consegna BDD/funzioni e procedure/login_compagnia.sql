CREATE OR REPLACE FUNCTION loginCompagnia(login VARCHAR(10),password VARCHAR(10)) RETURNS refcursor AS $$

DECLARE
	command VARCHAR(100);

	res refcursor;

BEGIN
    /*Seleziona la compagnia con login e password corrispondenti e restituisce il cursore (potenzialmente vuoto)*/
	command='SELECT * FROM compagnia WHERE login=''' || login || ''' AND ' || 'password=''' || password || '''';
	OPEN res FOR EXECUTE command;
	RETURN res;
	
END;
$$ LANGUAGE plpgsql;