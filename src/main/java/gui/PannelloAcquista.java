package gui;

import controller.Controller;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowEvent;
import java.sql.Timestamp;

public class PannelloAcquista extends JFrame implements ActionListener {

    JButton btn_confirm;

    float tot;
    float sovr_totale;

    int id_corsa;

    int n_bagagli;

    String veicolo;

    public PannelloAcquista(float prezzo,Float sconto_residente,Float sovr_veicolo,float sovr_prenotazione,Float sovr_bagagli,Integer n_bagagli,String veicolo,int id_corsa){

        this.setSize(450,370);
        this.setDefaultCloseOperation(JFrame.HIDE_ON_CLOSE);
        this.setResizable(false);
        this.setLayout(new FlowLayout(FlowLayout.LEFT,12,12));

        this.id_corsa=id_corsa;
        this.n_bagagli=n_bagagli;
        this.veicolo=veicolo;

        JPanel all=new JPanel();
        all.setLayout(new BoxLayout(all, BoxLayout.PAGE_AXIS));

        JLabel riepilogo=new JLabel("<html>RIEPILOGO<br/><br/></html>");
        riepilogo.setHorizontalTextPosition(JLabel.CENTER);
        riepilogo.setFont(new Font("sans serif",Font.BOLD,30));


        all.add(riepilogo);

        tot=prezzo;
        sovr_totale=sovr_prenotazione;

        all.add(new JLabel("<html>Prezzo biglietto:"+prezzo+"$<br/><br/></html>"));
        if(sconto_residente!=null){
            all.add(new JLabel("<html>Sconto residente: "+sconto_residente+"<br/><br/></html>"));
            tot= tot * sconto_residente;
        }
        if(sovr_veicolo!=null){
            all.add(new JLabel("<html>Sovrapprezzo veicolo: "+sovr_veicolo+"$<br/><br/></html>"));
            tot+=sovr_veicolo;
            sovr_totale+=sovr_veicolo;
        }
        if(sovr_bagagli!=null){
            all.add(new JLabel("<html>Sovrapprezzo bagagli: "+n_bagagli+" bagagli x "+sovr_bagagli+"$ = "+n_bagagli*sovr_bagagli+"$<br/><br/></html>"));
            tot += n_bagagli*sovr_bagagli;
            sovr_totale+= n_bagagli*sovr_bagagli;
        }
        all.add(new JLabel("<html>Sovrapprezzo prenotazione: "+sovr_prenotazione+"$<br/><br/></html>"));

        tot+=sovr_prenotazione;


        all.add(new JLabel("<html>Totale: "+ tot + "<br/><br/><br/></html>"));

        btn_confirm=new JButton("Conferma");
        btn_confirm.addActionListener(this);

        all.add(btn_confirm);

        this.add(all);
        this.pack();
        this.setVisible(true);

    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if(e.getSource()==btn_confirm) {
            System.out.println("Acquistato");
            Controller.getController().add_biglietto_intero(tot, sovr_totale, n_bagagli, veicolo, new Timestamp(System.currentTimeMillis()),
                    id_corsa, Controller.getController().getIdUtente());
            this.dispatchEvent(new WindowEvent(this, WindowEvent.WINDOW_CLOSING));
        }
    }
}
