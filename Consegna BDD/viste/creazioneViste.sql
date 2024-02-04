CREATE or REPLACE VIEW VISTA_CORSA_PORTI_COMPAGNIA_AGGIORNAMENTO(Id_corsa,Orario_partenza, 
  Orario_arrivo,Orario_partenza_scalo,Orario_arrivo_scalo,Data_inizio_servizio,Data_fine_servizio,Giorni_Servizio_Attivo,Sovr_prenotazione,Sovr_bagaglio,Sovr_veicolo, Prezzo_intero,Prezzo_ridotto,Sconto_residente,Porto_partenza, Porto_arrivo,Porto_scalo,Compagnia,Natante,P1_id_porto,P1_indirizzo,P1_comune,P1_tel_info,P2_id_porto,P2_indirizzo,P2_comune,P2_tel_info,PS_id_porto,PS_indirizzo,PS_comune,PS_tel_info,C_compagnia,C_nome,C_login,C_password,C_telefono,C_mail,C_sito_web,
R_corsa,R_ritardo,R_motivazione,A_corsa,A_prossimo,A_rimborso,A_descrizione)AS 

SELECT * FROM corsa JOIN porto AS p ON p.id_porto=porto_partenza JOIN porto AS a ON a.id_porto=porto_arrivo LEFT JOIN porto AS s ON s.id_porto=porto_scalo JOIN compagnia ON compagnia=id_compagnia LEFT JOIN ritardo AS r ON r.corsa=id_corsa LEFT JOIN annullamento AS an ON an.corsa=id_corsa JOIN natante ON natante=id_natante


CREATE or REPLACE VIEW VISTA_CORSA_PORTI_NATANTE(Id_corsa,Orario_partenza, 
  Orario_arrivo,Orario_partenza_scalo,Orario_arrivo_scalo,Data_inizio_servizio,Data_fine_servizio,Giorni_Servizio_Attivo,Sovr_prenotazione,Sovr_bagaglio,
  Sovr_veicolo, Prezzo_intero,Prezzo_ridotto,Sconto_residente,porto_partenza,porto_arrivo,porto_scalo,compagnia,natante,P1_id_porto,P1_indirizzo,P1_comune,P1_tel_info,
  P2_id_porto,P2_indirizzo,P2_comune,P2_tel_info,ps_id_porto,Ps_indirizzo,Ps_comune,Ps_tel_info,id_natante,nome_natante,trasporta,tipo_natante) AS

  SELECT * FROM corsa JOIN porto as p ON p.id_porto=porto_partenza JOIN porto AS a ON a.id_porto=porto_arrivo LEFT JOIN porto AS s ON s.id_porto=porto_scalo JOIN natante as n ON n.id_natante=natante; 

