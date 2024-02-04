CREATE DOMAIN sconto AS float CONSTRAINT sconto_check check(VALUE BETWEEN 0.1 AND 0.99);

CREATE TABLE corsa(
  Id_corsa SERIAL,
  Orario_partenza time NOT NULL,
  Orario_arrivo time NOT NULL,
  Orario_partenza_scalo time ,
  Orario_arrivo_scalo time,
  Data_inizio_servizio date NOT NULL,
  Data_fine_servizio date NOT NULL,
  Giorni_Servizio_Attivo BIT(7) NOT NULL DEFAULT B'1111111',
  Sovr_prenotazione float,
  Sovr_bagaglio float,
  Sovr_veicolo float,
  Prezzo_intero float NOT NULL,
  Prezzo_ridotto float NOT NULL,
  Sconto_residente sconto,
  Porto_partenza int NOT NULL,
  Porto_arrivo int NOT NULL,
  Porto_scalo int ,
  Compagnia int NOT NULL,
  Natante int NOT NULL,
  
   CONSTRAINT pk_corsa PRIMARY KEY(Id_corsa),
   CONSTRAINT prezzo_intero_ridotto_check check(Prezzo_ridotto<=Prezzo_intero),
   CONSTRAINT periodo_check check((Data_inizio_servizio <= Data_fine_servizio) AND (Data_fine_servizio > CURRENT_DATE)),
   CONSTRAINT endpoints_check check(Porto_partenza <> Porto_arrivo AND Porto_Scalo<>Porto_partenza AND Porto_Scalo<>Porto_arrivo),
   CONSTRAINT scalo_check check((Porto_scalo IS NULL AND Orario_partenza_scalo IS NULL AND Orario_arrivo_scalo IS NULL) OR (Porto_scalo IS NOT NULL AND Orario_partenza_scalo IS NOT NULL AND Orario_arrivo_scalo IS NOT NULL)),
   CONSTRAINT orario_check check(Orario_partenza <= Orario_arrivo),
   CONSTRAINT orario_scalo_check check((Orario_partenza_scalo BETWEEN Orario_partenza AND Orario_arrivo) AND (Orario_arrivo_scalo BETWEEN Orario_partenza AND Orario_arrivo) AND Orario_arrivo_scalo<=Orario_partenza_scalo)
  
);


CREATE DOMAIN numero_telefono AS varchar(13) CONSTRAINT tel_check check(VALUE SIMILAR TO '\+[0-9]*');

CREATE TABLE porto(
  Id_porto SERIAL,
  Indirizzo varchar(30) NOT NULL,
  Comune varchar(20) NOT NULL,
  Tel_info numero_telefono NOT NULL,
  
  
   CONSTRAINT pk_porto PRIMARY KEY(Id_porto)
  
);


CREATE or REPLACE TYPE tipo_trasporto AS enum('persone','persone/veicoli');
CREATE or REPLACE TYPE tipo_natante AS enum('traghetto','aliscafo','motonave');


CREATE TABLE natante(
  Id_natante SERIAL,
  Nome varchar(20) UNIQUE NOT NULL,
  Trasporta tipo_trasporto NOT NULL,
  Tipo tipo_natante NOT NULL,
  
  
   CONSTRAINT pk_natante PRIMARY KEY(Id_natante),
   CONSTRAINT tipo_tipo_trasporto CHECK((tipo='traghetto' AND trasporta='persone/veicoli')or(tipo<>'traghetto' AND trasporta<>'persone/veicoli'))
  
);


CREATE TABLE biglietto_ridotto(
  Id_biglietto SERIAL,
  Importo_totale float NOT NULL,
  Sovrapprezzo_tot float default 0,
  N_bagagli int default 0,
  Prenotazione timestamp,
  Corsa int NOT NULL,
  Passeggero int NOT NULL,
  Accompagnatore int NOT NULL,
  
  
  CONSTRAINT pk_biglietto_r PRIMARY KEY(Id_biglietto)
  
);

CREATE or REPLACE TYPE tipo_veicolo AS enum('automobile','moto','furgone');

CREATE TABLE biglietto_intero(
  Id_biglietto SERIAL,
  Importo_totale float NOT NULL,
  Sovrapprezzo_tot float default 0,
  N_bagagli int default 0,
  Veicolo tipo_veicolo,
  Prenotazione timestamp,
  Corsa int NOT NULL,
  Passeggero int NOT NULL,
  
  
  
   CONSTRAINT pk_biglietto_i PRIMARY KEY(Id_biglietto)
  
);



CREATE TABLE passeggero(
  Id_passeggero SERIAL,
  Nome varchar(20) NOT NULL,
  Login varchar(30) NOT NULL,
  Password varchar(30) NOT NULL,
  Eta int NOT NULL,

   CONSTRAINT pk_passeggero PRIMARY KEY(Id_passeggero),
   CONSTRAINT unique_login_password_passeggero UNIQUE(Login,Password)
  
);


CREATE TABLE compagnia(
  Id_compagnia SERIAL,
  Nome varchar(20) NOT NULL UNIQUE,
  Login varchar(30) NOT NULL,
  Password varchar(30) NOT NULL,
  Telefono numero_telefono NOT NULL,
  Mail varchar(30) NOT NULL,
  Sito_web varchar(30) NOT NULL,
  
   CONSTRAINT pk_compagnia PRIMARY KEY(Id_compagnia),
   CONSTRAINT unique_login_password_compagnia UNIQUE(Login,Password)
  
);


CREATE TABLE social(
  Id_social SERIAL,
  Compagnia int NOT NULL,
  Nome_social varchar(10) NOT NULL,
  Indirizzo_social varchar(60) NOT NULL,
 
  
   CONSTRAINT pk_social PRIMARY KEY(Id_social)
  
);


CREATE TABLE ritardo(
  Corsa SERIAL,
  Ritardo time NOT NULL,
  Motivazione text,
 
  
   CONSTRAINT pk_ritardo PRIMARY KEY(Corsa)
  
);


CREATE TABLE annullamento(
  Corsa SERIAL,
  Prossimo int,
  Rimborso float,
  Descrizione text,
 
  
   CONSTRAINT pk_annullamento PRIMARY KEY(Corsa)
  
);



--##### chiavi esterne di corsa #####

ALTER TABLE corsa ADD CONSTRAINT fk_corsa_porto_partenza FOREIGN KEY(Porto_partenza) REFERENCES porto ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE corsa ADD CONSTRAINT fk_corsa_porto_arrivo FOREIGN KEY(Porto_arrivo) REFERENCES porto ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE corsa ADD CONSTRAINT fk_corsa_porto_scalo FOREIGN KEY(Porto_scalo) REFERENCES porto ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE corsa ADD CONSTRAINT fk_corsa_natante FOREIGN KEY(Natante) REFERENCES natante ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE corsa ADD CONSTRAINT fk_corsa_compagnia FOREIGN KEY(Compagnia) REFERENCES compagnia ON DELETE CASCADE ON UPDATE CASCADE;

--##### chiavi esterne di biglietto_ridotto #####

ALTER TABLE biglietto_ridotto ADD CONSTRAINT fk_biglietto_ridotto_corsa FOREIGN KEY(Corsa) REFERENCES corsa ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE biglietto_ridotto ADD CONSTRAINT fk_biglietto_ridotto_passeggero FOREIGN KEY(Passeggero) REFERENCES passeggero ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE biglietto_ridotto ADD CONSTRAINT fk_biglietto_ridotto_accompagnatore FOREIGN KEY(Accompagnatore) REFERENCES passeggero ON DELETE CASCADE ON UPDATE CASCADE;

--##### chiavi esterne di biglietto_intero #####

ALTER TABLE biglietto_intero ADD CONSTRAINT fk_biglietto_intero_corsa FOREIGN KEY(Corsa) REFERENCES corsa ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE biglietto_intero ADD CONSTRAINT fk_biglietto_intero_passeggero FOREIGN KEY(Passeggero) REFERENCES passeggero ON DELETE CASCADE ON UPDATE CASCADE;

--##### chiavi esterne di social #####

ALTER TABLE social ADD CONSTRAINT fk_social_compagnia FOREIGN KEY(Compagnia) REFERENCES compagnia ON DELETE CASCADE ON UPDATE CASCADE;

--##### chiavi esterne di ritardo #####

ALTER TABLE ritardo ADD CONSTRAINT fk_ritardo_corsa FOREIGN KEY(Corsa) REFERENCES corsa ON DELETE CASCADE ON UPDATE CASCADE;

--##### chiavi esterne di annullamento #####

ALTER TABLE annullamento ADD CONSTRAINT fk_annullamento_corsa FOREIGN KEY(Corsa) REFERENCES corsa ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE annullamento ADD CONSTRAINT fk_annullamento_prossimo FOREIGN KEY(Prossimo) REFERENCES corsa ON DELETE SET NULL ON UPDATE CASCADE;