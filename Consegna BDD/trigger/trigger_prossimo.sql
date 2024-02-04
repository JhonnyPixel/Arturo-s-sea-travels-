CREATE or replace FUNCTION add_prossimo() RETURNS trigger AS $add_prossimo$
    
    DECLARE

        ann_partenza corsa.porto_partenza%TYPE;
        ann_arrivo corsa.porto_arrivo%TYPE;
		ann_orario_partenza corsa.orario_partenza%TYPE;
        day_of_week INTEGER;

    
    BEGIN

        /*seleziona il giorno della settimana corrente, abbiamo bisogno del modulo perche extract restituisce i giorni da 0 a 6 partendo da domenica*/

        day_of_week = mod(extract( dow from CURRENT_DATE) +6,7) +1;

        

        /*seleziono la corsa annullata*/

        SELECT porto_partenza,porto_arrivo,orario_partenza INTO ann_partenza,ann_arrivo,ann_orario_partenza FROM corsa WHERE id_corsa=new.corsa;

        /*se esistono corse che partono dallo stesso punto , arrivano nello stesso punto, disponibili nel giorno corrente , nella data corrente ad un orario piu tardo allora seleziona quella tra queste corse che parte prima*/
            
        IF(EXISTS(SELECT * FROM corsa WHERE SUBSTRING(Giorni_Servizio_Attivo,day_of_week+1,1) = '1' AND porto_partenza=ann_partenza AND porto_arrivo=ann_arrivo AND orario_partenza>ann_orario_partenza AND(CURRENT_DATE BETWEEN Data_inizio_servizio AND Data_fine_servizio)) ) THEN
          
            new.prossimo:= (SELECT id_corsa 
                            FROM corsa 
                            WHERE SUBSTRING(Giorni_Servizio_Attivo,day_of_week+1,1) = '1' AND porto_partenza=ann_partenza 
                                    AND porto_arrivo=ann_arrivo AND orario_partenza>ann_orario_partenza 
                                    AND(CURRENT_DATE BETWEEN Data_inizio_servizio AND Data_fine_servizio)
                            ORDER BY Orario_partenza ASC LIMIT 1);
        END IF;
        

        RETURN new;
    END;
$add_prossimo$ LANGUAGE plpgsql;

CREATE or replace TRIGGER add_prossimo 
BEFORE INSERT ON annullamento
FOR EACH ROW
WHEN (new.prossimo IS NULL)
EXECUTE FUNCTION add_prossimo();

