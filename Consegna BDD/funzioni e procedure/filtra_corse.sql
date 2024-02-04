CREATE OR REPLACE FUNCTION filtra_corse(id_corsa int ,portoPartenza VARCHAR(100) , portoArrivo VARCHAR(100) ,dataPartenza DATE , orarioPartenza TIME ,prezzo float , tipo_natante VARCHAR(100) ) RETURNS refcursor AS $$
DECLARE
	corse_cursor refcursor;
	comando VARCHAR(1000)='SELECT * FROM vista_corsa_porti_compagnia_aggiornamento';
	day_of_week INTEGER;
BEGIN

	/*Se qualcuno degli attributi non è null allora vuol dire che devi filtrare per uno o piu parametri quindi aggiungo un where*/

	IF portoPartenza IS NOT NULL or portoArrivo IS NOT NULL or dataPartenza IS NOT NULL or orarioPartenza IS NOT NULL or prezzo IS NOT NULL or tipo_natante IS NOT NULL THEN

		comando= comando || ' WHERE ';

		/*A questo punto capisco per quali attributi devo filtrare e modifico la query di conseguenza*/

		IF id_corsa IS NOT NULL THEN
			comando=comando || 'id_corsa=' || id_corsa || ' AND ';
		END IF;

		IF portoPartenza IS NOT NULL THEN
			comando = comando || 'Porto_partenza IN (SELECT id_porto FROM porto WHERE Comune=''' ||portoPartenza ||''') AND ';
			
		END IF;
		

		IF portoArrivo IS NOT NULL THEN
			comando = comando || 'Porto_arrivo IN (SELECT id_porto FROM porto WHERE Comune=''' || portoArrivo || ''') AND ';
		
		END IF;

		IF dataPartenza IS NOT NULL THEN
			day_of_week = select mod(extract( dow from DATE dataPartenza) +6,7) +1;
			comando = comando || '('''||dataPartenza||''' BETWEEN Data_inizio_servizio AND Data_fine_servizio) AND SUBSTRING(Giorni_Servizio_Attivo,'||day_of_week||'+1,1)= ''1'' AND';

        END IF;

		IF orarioPartenza IS NOT NULL THEN
			comando = comando || 'Orario_partenza >= ''' || orarioPartenza || ''' AND ';
		
		END IF;

		IF prezzo IS NOT NULL THEN
			comando = comando || 'Prezzo_intero <= ' || prezzo || ' AND ';
		
        END IF;
    
		IF tipo_natante IS NOT NULL THEN
			comando = comando || '''' || tipo_natante ||''' =(SELECT tipo FROM natante WHERE Id_natante = Natante) AND ';
		
		END IF;

		/*ora mi sarà rimasto un AND ballerino finale + uno spazio quindi li elimino operando un comando di substring*/
		
		comando=SUBSTRING(comando,1,LENGTH(comando)-4) || ';';
	
	 END IF;

	OPEN corse_cursor FOR EXECUTE comando;
	RETURN corse_cursor; 

	
END;
$$ LANGUAGE plpgsql;