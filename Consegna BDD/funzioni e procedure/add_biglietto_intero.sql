CREATE OR REPLACE PROCEDURE add_biglietto_intero(
  
  Importo_totale float NOT NULL,
  Sovrapprezzo_tot float default 0,
  N_bagagli int default 0,
  Veicolo varchar(10),
  Prenotazione timestamp,
  Corsa int NOT NULL,
  Passeggero int NOT NULL,

) AS $$

    DECLARE

    BEGIN
        INSERT INTO biglietto_intero (Importo_totale,Sovrapprezzo_tot,N_bagagli,Veicolo,Prenotazione,Corsa,Passeggero) 
        VALUES (Importo_totale,Sovrapprezzo_tot,N_bagagli,Veicolo,Prenotazione,Corsa,Passeggero);
    END;

$$LANGUAGE plpgsql;