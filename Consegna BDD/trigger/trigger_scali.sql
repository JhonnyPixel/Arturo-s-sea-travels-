CREATE FUNCTION add_scalo() RETURNS trigger AS $add_scalo$
    BEGIN
        
        boolean condizione = porto_partenza=new.porto_scalo AND porto_arrivo=new.porto_arrivo AND giorni_servizio_attivo=new.giorni_servizio_attivo 
                            AND Orario_partenza=new.Orario_partenza_scalo AND Orario_arrivo=new.Orario_arrivo AND Data_inizio_servizio=new.Data_inizio_servizio 
                            AND Data_fine_servizio=new.Data_fine_servizio AND Compagnia=new.Compagnia AND Natante=new.Natante;

        boolean condizione2 = porto_partenza=new.porto_partenza AND porto_arrivo=new.porto_scalo AND giorni_servizio_attivo=new.giorni_servizio_attivo 
                              AND Orario_partenza=new.Orario_partenza AND Orario_arrivo=new.Orario_arrivo_scalo AND Data_inizio_servizio=new.Data_inizio_servizio 
                              AND Data_fine_servizio=new.Data_fine_servizio AND Compagnia=new.Compagnia AND Natante=new.Natante

        /*partiamo dal presupposto che cio che il trigger fa e' scomporre una corsa A->B(scalo)->C aggiungendo alla base di dati le due corse A->B E B->C*/

        /*il primo not exists controlla tramite condizione 1 che non esista gia la corsa B->C , nel caso in cui non esiste la aggiunge*/

        IF(NOT EXISTS(SELECT * FROM corsa WHERE condizione)) THEN
            INSERT INTO corsa (Orario_partenza,Orario_arrivo,Orario_partenza_scalo,Orario_arrivo_scalo,Data_inizio_servizio,Data_fine_servizio,
                                Giorni_Servizio_Attivo,Sovr_prenotazione,Sovr_bagaglio,Sovr_veicolo,Prezzo_intero,Prezzo_ridotto,Sconto_residente,
                                Porto_partenza,Porto_arrivo,porto_scalo,Compagnia,Natante)

                VALUES(new.Orario_partenza_scalo,new.Orario_arrivo,null,null,new.Data_inizio_servizio,new.Data_fine_servizio,
                new.Giorni_Servizio_Attivo,new.Sovr_prenotazione,new.Sovr_bagaglio,new.Sovr_veicolo,new.Prezzo_intero,new.Prezzo_ridotto,new.Sconto_residente,
                new.Porto_scalo,new.Porto_arrivo,null,new.Compagnia,new.Natante);
        END IF;

        /*il secondo not exists controlla tramite condizione 2 che non esista gia la corsa A->B , nel caso in cui non esiste la aggiunge*/

        IF(NOT EXISTS(SELECT * FROM corsa WHERE condizione2)) THEN
            INSERT INTO corsa (Orario_partenza,Orario_arrivo,Orario_partenza_scalo,Orario_arrivo_scalo,Data_inizio_servizio,Data_fine_servizio,
                                Giorni_Servizio_Attivo,Sovr_prenotazione,Sovr_bagaglio,Sovr_veicolo,Prezzo_intero,Prezzo_ridotto,Sconto_residente,
                                Porto_partenza,Porto_arrivo,porto_scalo,Compagnia,Natante)

            VALUES(new.Orario_partenza,new.Orario_arrivo_scalo,null,null,new.Data_inizio_servizio,new.Data_fine_servizio,
                new.Giorni_Servizio_Attivo,new.Sovr_prenotazione,new.Sovr_bagaglio,new.Sovr_veicolo,new.Prezzo_intero,new.Prezzo_ridotto,new.Sconto_residente,
                new.Porto_partenza,new.Porto_scalo,null,new.Compagnia,new.Natante);
        END IF;

        RETURN NULL;
    END;
$add_scalo$ LANGUAGE plpgsql;

CREATE TRIGGER add_scalo 
AFTER INSERT OR UPDATE OF porto_scalo ON corsa
FOR EACH ROW
WHEN (new.porto_scalo IS NOT NULL)
EXECUTE FUNCTION add_scalo();

/* quella che è andata effettivamente

CREATE or REPLACE FUNCTION add_scalo() RETURNS trigger AS $add_scalo$
    BEGIN
        
        
       
        IF(NOT EXISTS(SELECT * FROM corsa WHERE porto_partenza=new.porto_scalo AND porto_arrivo=new.porto_arrivo AND giorni_servizio_attivo=new.giorni_servizio_attivo 
                            AND Orario_partenza=new.Orario_partenza_scalo AND Orario_arrivo=new.Orario_arrivo AND Data_inizio_servizio=new.Data_inizio_servizio 
                            AND Data_fine_servizio=new.Data_fine_servizio AND Compagnia=new.Compagnia AND Natante=new.Natante)) THEN
							
            INSERT INTO corsa (Orario_partenza,Orario_arrivo,Orario_partenza_scalo,Orario_arrivo_scalo,Data_inizio_servizio,Data_fine_servizio,
                                Giorni_Servizio_Attivo,Sovr_prenotazione,Sovr_bagaglio,Sovr_veicolo,Prezzo_intero,Prezzo_ridotto,Sconto_residente,
                                Porto_partenza,Porto_arrivo,porto_scalo,Compagnia,Natante)

                VALUES(new.Orario_partenza_scalo,new.Orario_arrivo,null,null,new.Data_inizio_servizio,new.Data_fine_servizio,
                new.Giorni_Servizio_Attivo,new.Sovr_prenotazione,new.Sovr_bagaglio,new.Sovr_veicolo,new.Prezzo_intero,new.Prezzo_ridotto,new.Sconto_residente,
                new.Porto_scalo,new.Porto_arrivo,null,new.Compagnia,new.Natante);

               
        END IF;

        IF(NOT EXISTS(SELECT * FROM corsa WHERE porto_partenza=new.porto_partenza AND porto_arrivo=new.porto_scalo AND giorni_servizio_attivo=new.giorni_servizio_attivo 
                              AND Orario_partenza=new.Orario_partenza AND Orario_arrivo=new.Orario_arrivo_scalo AND Data_inizio_servizio=new.Data_inizio_servizio 
                              AND Data_fine_servizio=new.Data_fine_servizio AND Compagnia=new.Compagnia AND Natante=new.Natante
)) THEN
            INSERT INTO corsa (Orario_partenza,Orario_arrivo,Orario_partenza_scalo,Orario_arrivo_scalo,Data_inizio_servizio,Data_fine_servizio,
                                Giorni_Servizio_Attivo,Sovr_prenotazione,Sovr_bagaglio,Sovr_veicolo,Prezzo_intero,Prezzo_ridotto,Sconto_residente,
                                Porto_partenza,Porto_arrivo,porto_scalo,Compagnia,Natante)

            VALUES(new.Orario_partenza,new.Orario_arrivo_scalo,null,null,new.Data_inizio_servizio,new.Data_fine_servizio,
                new.Giorni_Servizio_Attivo,new.Sovr_prenotazione,new.Sovr_bagaglio,new.Sovr_veicolo,new.Prezzo_intero,new.Prezzo_ridotto,new.Sconto_residente,
                new.Porto_partenza,new.Porto_scalo,null,new.Compagnia,new.Natante);
			
        END IF;

        RETURN NULL;
    END;
$add_scalo$ LANGUAGE plpgsql;

CREATE or REPLACE TRIGGER add_scalo 
AFTER INSERT OR UPDATE OF porto_scalo ON corsa
FOR EACH ROW
WHEN (new.porto_scalo IS NOT NULL)
EXECUTE FUNCTION add_scalo();

*/