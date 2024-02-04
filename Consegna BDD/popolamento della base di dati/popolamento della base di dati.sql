--inserimento in porto--

insert into porto (Indirizzo, Comune, Tel_info) VALUES

('via marina 12','bari','+339234569'),
('corso marittimo 34','genova','+233456901'),
('via della palude 98','mordor','+298374489'),
('corso romano 5','venezia','+293484773'),
('via marco aurelio 132','otranto','+489021789'),
('via della madonna 45','procida','+390498292'),
('via dei fiori 1','tropea','+234907632'),
('corso san settimino 53','palermo','+233400482'),
('via della granita 9','livorno','+801733940'),
('via italia 168','trieste','+12904873');

INSERT INTO natante (Nome, Trasporta, Tipo) VALUES
('Santa maria','persone/veicoli','traghetto'),
('aurelia','persone','motonave'),
('san giorgio','persone','aliscafo'),
('smeralda','persone','motonave'),
('giulia','persone','aliscafo'),
('stella poalre','persone/veicoli','traghetto'),
('ondina','persone','aliscafo'),
('onda storta','persone/veicoli','traghetto'),
('chiaro di luna','persone','motonave'),
('la norvegese','persone','motonave');

INSERT INTO compagnia (Nome, Login, Password, Telefono, Mail, Sito_web) VALUES 
('Caremar', 'comp1', 'pass1', '+390001234567', 'email1@compagnia.it', 'http://www.compagnia1.it'),
('costa azzurra', 'comp2', 'pass2', '+390001234568', 'email2@compagnia.it', 'http://www.compagnia2.it'),
('sncm', 'comp3', 'pass3', '+390001234568', 'email3@compagnia.it', 'http://www.compagnia3.it'),
('caronte tourist', 'comp4', 'pass4', '+390001234568', 'email4@compagnia.it', 'http://www.compagnia4.it'),
('afadria', 'comp5', 'pass5', '+390001234568', 'email5@compagnia.it', 'http://www.compagnia5.it'),
('finni lines', 'comp6', 'pass6', '+390001234568', 'email6@compagnia.it', 'http://www.compagnia6.it'),
('fiordi lines', 'comp7', 'pass7', '+390001234568', 'email7@compagnia.it', 'http://www.compagnia7.it'),
('elba ferries', 'comp8', 'pass8', '+390001234568', 'email8@compagnia.it', 'http://www.compagnia8.it'),
('ctn', 'comp9', 'pass9', '+390001234568', 'email9@compagnia.it', 'http://www.compagnia9.it'),
('napoli lines', 'comp10', 'pass10', '+390001234585', 'email10@compagnia.it', 'http://www.compagnia10.it'),
('brittany ferries', 'comp11', 'pass11', '+390001234586', 'email11@compagnia.it', 'http://www.compagnia11.it');


INSERT INTO corsa (Orario_partenza, Orario_arrivo, Data_inizio_servizio, Data_fine_servizio,Prezzo_intero, Prezzo_ridotto,Sconto_residente, Porto_partenza,Porto_arrivo, Compagnia, Natante) VALUES 
('08:00', '10:00', '2024-08-07', '2024-08-31', 50, 40, 0.4,1, 2, 1, 1),
('11:00', '12:00', '2024-08-01', '2024-08-31', 50, 40, 0.4,1, 2, 1, 1),
('11:00', '13:00', '2024-02-03', '2024-02-10', 50, 40, 0.6,2, 3, 2, 2),
('13:02','14:00','2024-02-03','2024-02-10', 50, 40, 0.6, 2, 3, 2, 5),
('16:00','17:00','2024-03-01', '2024-03-10', 50, 40, 0.32, 4, 7, 5, 6),
('20:00','22:00','2024-04-01', '2024-04-10', 50, 40, 0.12, 7, 2, 3, 3),
('23:00','23:55','2024-05-01', '2024-05-10', 50, 40, 0.89, 10, 1, 4, 7),
('08:00', '10:00', '2024-06-13', '2024-06-30', 50, 40, 0.6, 5, 8, 7, 9),
('11:00', '13:00', '2024-07-25', '2024-08-18', 50, 40, 0.67, 6, 1, 9, 10);

INSERT INTO passeggero (Nome, Login, Password, Eta) VALUES 
('Mario Rossi', 'mario.rossi', 'password1', 35),
('Luca Bianchi', 'luca.bianchi', 'password2', 28),
('Francesco Trotti','francesco','1234',20),
('Ginevra Rossi', 'ginevra', '0000',10),
('Riccardo Puggioni','riccardo','ilovenapoli',21),
('Giorgia Verdi', 'giorgia.verdi', 'password3', 13),
('Federica Neri', 'federica.neri', 'password4', 14);

INSERT INTO biglietto_intero (Importo_totale, Corsa, Passeggero, Veicolo) VALUES 
(50.00, 1, 1, null),
(55.00, 2, 3, 'moto'),
(50.00, 3, 5, 'automobile'),
(55.00, 4, 1, 'moto'),
(20.00, 1, 2,'moto'),
(60.00, 2, 1,'automobile'),
(70.00, 5, 3, null);

INSERT INTO biglietto_ridotto (Importo_totale, Corsa, Passeggero, Accompagnatore) VALUES 
(25.00, 1, 6, 2),
(30.00, 2, 7, 1),
(12.00, 5, 4, 3);

INSERT INTO social (Compagnia, Nome_social, Indirizzo_social) VALUES 
(1, 'Facebook', 'http://fb.me/Compagnia1'),
(2, 'Instagram', 'http://instagram.com/Compagnia2'),
(7, 'Facebook', 'http://fb.me/Compagnia7'),
(8, 'Instagram', 'http://instagram.com/Compagnia8');

INSERT INTO ritardo (Corsa, Ritardo, Motivazione) VALUES 
(1, '00:30', 'Maltempo'),
(2, '01:00', 'Guasto tecnico'),
(8, '00:45', 'Problemi di traffico'),
(6, '00:30', 'Maltempo');

INSERT INTO annullamento (Corsa, Prossimo, Rimborso, Descrizione) VALUES 
(1, null, 100.00, 'Guasto non riparabile'),
(2, null, 100.00, 'Condizioni meteo avverse'),
(7, NULL, 100.00, 'Sciopero'),
(3, 4, 100.00, 'Problemi logistici');