package gui;

import MODEL.Corsa;
import controller.Controller;

import javax.swing.*;
import java.awt.*;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;



public class FramePasseggero extends JFrame{

    JPanel rightPanel;
    ArrayList<Corsa> corse= new ArrayList<>();
    Controller controller;

    private int n_bagagli;

    private String veicolo;

    public FramePasseggero() {
        this.setSize(1500,700);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setResizable(false);

        controller=Controller.getController();
        corse=controller.filtra_corse(null,null,null,null,null,null,null);

        JPanel all=new JPanel();
        all.setLayout(new BorderLayout(0,0));

        TopBar topbar=new TopBar(corse);

        rightPanel=new JPanel();
        rightPanel.setLayout(new BoxLayout(rightPanel, BoxLayout.PAGE_AXIS));

        JPanel leftPanel=new JPanel();
        leftPanel.setPreferredSize(new Dimension(750,810));
        leftPanel.setBorder(BorderFactory.createMatteBorder(0,0,0,2,Color.lightGray));





        for (Corsa c: corse) {
            rightPanel.add(new ResultRow(controller.getComune(controller.getPorto_Partenza(c)),c.getPorto_Arrivo().getComune(),c.getCompagnia().getNome(),
                    c.getOrario_Partenza(),c.getOrario_Arrivo(),c.getPrezzoIntero(),c.getPrezzoRidotto(),c.getScontoResidente(),
                    c.getSovrVeicolo(),c.getSovrPrenotazione(),c.getSovrBagagli(),n_bagagli,veicolo,c.getId_corsa()));
        }


        JScrollPane scroll=new JScrollPane(rightPanel,JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED,JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);




        System.out.println(rightPanel.getPreferredSize().height);




        Ricerca ricerca = new Ricerca(this,corse);

        leftPanel.add(ricerca);





        all.add(leftPanel,BorderLayout.WEST);
        all.add(scroll,BorderLayout.EAST);
        this.add(topbar,BorderLayout.NORTH);
        this.add(all);
        this.setVisible(true);
    }

    public void UpdateResultsCorse(String portoPartenzaAndata, String portoArrivoAndata, String portoPartenzaRitorno, String portoArrivoRitorno,Date dataAndata,Date dataRitorno,Boolean Andata_e_Ritorno){
        corse.removeAll(corse);
        rightPanel.removeAll();

        for(Corsa c:controller.filtra_corse(null,portoPartenzaAndata,portoArrivoAndata,dataAndata,null,null,null)){
            corse.add(c);
            rightPanel.add(new ResultRow(controller.getComune(controller.getPorto_Partenza(c)),c.getPorto_Arrivo().getComune(),c.getCompagnia().getNome(),
                    c.getOrario_Partenza(),c.getOrario_Arrivo(),c.getPrezzoIntero(),c.getPrezzoRidotto(),c.getScontoResidente(),
                    c.getSovrVeicolo(),c.getSovrPrenotazione(),c.getSovrBagagli(),n_bagagli,veicolo,c.getId_corsa()));
        }
        if(!(portoPartenzaAndata.equals(portoPartenzaRitorno) && portoArrivoAndata.equals(portoArrivoRitorno)) && Andata_e_Ritorno) {
            for (Corsa c : controller.filtra_corse(null,portoPartenzaRitorno, portoArrivoRitorno, dataRitorno, null, null, null)) {
                corse.add(c);
                rightPanel.add(new ResultRow(controller.getComune(controller.getPorto_Partenza(c)),c.getPorto_Arrivo().getComune(),c.getCompagnia().getNome(),
                        c.getOrario_Partenza(),c.getOrario_Arrivo(),c.getPrezzoIntero(),c.getPrezzoRidotto(),c.getScontoResidente(),
                        c.getSovrVeicolo(),c.getSovrPrenotazione(),c.getSovrBagagli(),n_bagagli,veicolo,c.getId_corsa()));
            }
        }

        rightPanel.revalidate();
        rightPanel.repaint();
        this.revalidate();
        this.repaint();

    }

    public void setNBagagli(int n){
        this.n_bagagli=n;
    }

    public void setVeicolo(String v){
        this.veicolo=v;
    }




}
