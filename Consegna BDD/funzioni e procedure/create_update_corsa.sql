CREATE or REPLACE PROCEDURE create_update_corsa(Id_corsa int,
  Orario_partenza time ,
  Orario_arrivo time ,
  Data_inizio_servizio date ,
  Data_fine_servizio date ,
  Giorni_Servizio_Attivo BIT(7) ,
  Sovr_prenotazione float,
  Sovr_bagaglio float,
  Sovr_veicolo float,
  Prezzo_intero float ,
  Prezzo_ridotto float ,
  Sconto_residente float,
  Porto_partenza int ,
  Porto_arrivo int ,
  Compagnia int ,
  Natante int ) AS $$

    DECLARE

    BEGIN
        /*Se l id corsa non e' null ed esiste la corsa con quell id allora procedi con un UDPATE dei dati*/
        IF (Id_corsa IS NOT NULL AND EXISTS(SELECT * FROM corsa AS c WHERE c.id_corsa=Id_corsa)) THEN
            UPDATE corsa AS c SET c.Orario_partenza=Orario_partenza, c.Orario_arrivo=Orario_arrivo, c.Data_inizio_Servizio=Data_inizio_Servizio, c.Data_fine_servizio=Data_fine_servizio, c.Giorni_Servizio_Attivo=Giorni_Servizio_Attivo, c.Sovr_prenotazione=Sovr_prenotazione, c.Sovr_bagaglio=Sovr_bagaglio, c.Sovr_veicolo=Sovr_veicolo, c.Prezzo_intero=Prezzo_intero, c.Prezzo_ridotto=c.Prezzo_ridotto, c.Sconto_residente=Sconto_residente, c.Porto_partenza=Porto_partenza, c.Porto_arrivo=Porto_arrivo, c.Compagnia=Compagnia,c.Natante=Natante
            WHERE c.id_corsa=Id_corsa;

        /*altrimenti crea una nuova corsa con i dati forniti*/
        ELSE
            INSERT INTO corsa(Orario_partenza, Orario_arrivo, Data_inizio_Servizio, Data_fine_servizio,Giorni_Servizio_Attivo,Sovr_prenotazione,Sovr_bagaglio,Sovr_veicolo,Prezzo_intero,Prezzo_ridotto,Sconto_residente,Porto_partenza,Porto_arrivo,Compagnia,Natante) 
            VALUES(Orario_partenza, Orario_arrivo, Data_inizio_Servizio, Data_fine_servizio,Giorni_Servizio_Attivo,Sovr_prenotazione,Sovr_bagaglio,Sovr_veicolo,Prezzo_intero,Prezzo_ridotto,Sconto_residente,Porto_partenza,Porto_arrivo,Compagnia,Natante);
        END IF;

        
    END;

$$ LANGUAGE plpgsql;