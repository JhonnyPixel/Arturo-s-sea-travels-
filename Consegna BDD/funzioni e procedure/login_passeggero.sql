CREATE OR REPLACE FUNCTION loginPasseggero(login VARCHAR(10),password VARCHAR(10)) RETURNS refcursor AS $$

DECLARE
	command VARCHAR(100);

	res refcursor;

BEGIN
	/*Seleziona il passeggero con login e password corrispondenti e restituisce il cursore (potenzialmente vuoto)*/
	command='SELECT * FROM passeggero WHERE login=''' || login || ''' AND ' || 'password=''' || password || '''';
	OPEN res FOR EXECUTE command;
	RETURN res;
	
END;
$$ LANGUAGE plpgsql;