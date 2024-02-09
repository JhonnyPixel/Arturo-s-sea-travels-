package gui;

import MODEL.Corsa;
import controller.Controller;
import org.jdatepicker.impl.JDatePanelImpl;
import org.jdatepicker.impl.JDatePickerImpl;
import org.jdatepicker.impl.UtilDateModel;

import javax.swing.*;
import java.awt.*;
import java.util.*;
import java.util.Timer;


public class FrameTabellone extends JFrame {

    String[] veicolo={"traghetto","aliscafo","motonave"};
    ArrayList<Corsa> corse;

    JPanel panelResults;

    Controller controller;

    public FrameTabellone(ArrayList<Corsa> corse){
        controller=Controller.getController();
        this.setSize(new Dimension(1000,610));
        //this.setBackground(Color.red);
        this.setDefaultCloseOperation(JFrame.HIDE_ON_CLOSE);
        this.setResizable(false);
        this.corse=corse;

        JComboBox Ritornobox=new JComboBox();
        JComboBox Andatabox=new JComboBox();

        Andatabox.setPreferredSize(new Dimension(130,30));
        Ritornobox.setPreferredSize(new Dimension(130,30));


        for(Corsa c:corse){
            Ritornobox.addItem(c.getPorto_Partenza().getComune()+"->"+c.getPorto_Arrivo().getComune());
            Andatabox.addItem(c.getPorto_Partenza().getComune()+"->"+c.getPorto_Arrivo().getComune());
        }

        JPanel panelFiltro = new JPanel();
        panelFiltro.setPreferredSize(new Dimension(1000,130));
        //panelFiltro.setBackground(Color.magenta);
        panelFiltro.setLayout(new FlowLayout(FlowLayout.RIGHT,0,0));

        UtilDateModel model = new UtilDateModel();
        Properties p = new Properties();
        p.put("text.today", "Today");
        p.put("text.month", "Month");
        p.put("text.year", "Year");
        JDatePanelImpl datePanel = new JDatePanelImpl(model, p);
        JDatePickerImpl datePicker = new JDatePickerImpl(datePanel, new DateLabelFormatter());

        UtilDateModel model2 = new UtilDateModel();
        Properties p2 = new Properties();
        p.put("text.today", "Today");
        p.put("text.month", "Month");
        p.put("text.year", "Year");
        JDatePanelImpl datePanel2 = new JDatePanelImpl(model2, p2);
        JDatePickerImpl datePicker2 = new JDatePickerImpl(datePanel2, new DateLabelFormatter());

        datePicker.setPreferredSize(new Dimension(130,30));
        datePicker2.setPreferredSize(new Dimension(130,30));


        JPanel panelDate =new JPanel();
        //panelDate.setBackground(Color.blue);
        panelDate.setPreferredSize(new Dimension(200,110));

        JPanel panelChoose=new JPanel();
        //panelChoose.setBackground(Color.red);
        panelChoose.setPreferredSize(new Dimension(200,110));
        panelChoose.setLayout(new FlowLayout(FlowLayout.CENTER,0,30));

        JPanel panelFiltra=new JPanel();
        //panelFiltra.setBackground(Color.yellow);
        panelFiltra.setPreferredSize(new Dimension(200,110));

        JButton filtraButton=new JButton("FILTRA");
        filtraButton.setFocusable(false);
        filtraButton.addActionListener(e->{
            String[] andata=Andatabox.getSelectedItem().toString().split("-");
            andata[1]=andata[1].replace(">","");
            String[] ritorno=Ritornobox.getSelectedItem().toString().split("-");
            ritorno[1]=ritorno[1].replace(">","");
            System.out.println(andata[0]+" "+andata[1]);

            Calendar cal = Calendar.getInstance();

            Integer GiornoAndata=null;
            Integer GiornoRitorno=null;

            Date selectedDateAndata = (Date) datePicker.getModel().getValue();

            if(selectedDateAndata!=null){
                cal.setTime(selectedDateAndata);
                GiornoAndata=(cal.get(Calendar.DAY_OF_WEEK)+5) % 7;
            }

            Date selectedDateRitorno = (Date) datePicker2.getModel().getValue();

            if(selectedDateRitorno!=null){
                cal.setTime(selectedDateRitorno);
                GiornoRitorno=(cal.get(Calendar.DAY_OF_WEEK)+5) % 7;
            }

            this.updateResultsCorse(andata[0],andata[1],ritorno[0],ritorno[1],GiornoAndata,GiornoRitorno);
        });

        panelChoose.add(filtraButton);
        panelDate.add(new JLabel("Data partenza"));
        panelDate.add(datePicker);
        panelDate.add(new JLabel("Data arrivo"));
        panelDate.add(datePicker2);

        JComboBox boxveicolo = new JComboBox(veicolo);
        boxveicolo.setPreferredSize(new Dimension(100, 30));

        JLabel veicololabel=new JLabel("veicolo");
        veicololabel.setPreferredSize(new Dimension(200,15));
        veicololabel.setHorizontalTextPosition(JLabel.CENTER);
        veicololabel.setHorizontalAlignment(JLabel.CENTER);


        SpinnerModel modelspinner = new SpinnerNumberModel(9.9, 1, 15, 0.1);
        JSpinner spinner = new JSpinner(modelspinner);
        spinner.setPreferredSize(new Dimension(80, 22));

        JLabel prezzo=new JLabel("prezzo");
        prezzo.setPreferredSize(new Dimension(200,15));
        prezzo.setHorizontalTextPosition(JLabel.CENTER);
        prezzo.setHorizontalAlignment(JLabel.CENTER);

        panelFiltra.add(veicololabel);
        panelFiltra.add(boxveicolo);
        panelFiltra.add(prezzo);
        panelFiltra.add(spinner);

        //codice per aggiungere animazione dell orologio

        Clock clock = new Clock();
        ClockPanel clockPanel = new ClockPanel(clock);

        java.util.Timer timer = new Timer();
        timer.scheduleAtFixedRate(new TimerTask(){

            @Override
            public void run() {
                clock.update();
                clockPanel.repaint();
            }

        }, 0, 1000);

        //fine codice del clock

        JPanel panelSelezionaTratte =new JPanel();
        panelSelezionaTratte.setPreferredSize(new Dimension(200,110));
        panelSelezionaTratte.add(Andatabox);
        panelSelezionaTratte.add(Ritornobox);



        panelFiltro.add(clockPanel);
        panelFiltro.add(panelSelezionaTratte);
        panelFiltro.add(panelChoose);
        panelFiltro.add(panelFiltra);
        panelFiltro.add(panelDate);




        JPanel nomeColonne=new JPanel();
        nomeColonne.setPreferredSize(new Dimension(1000,20));
        nomeColonne.setBackground(Color.lightGray);
        nomeColonne.setLayout(new FlowLayout(FlowLayout.CENTER,150,0));
        nomeColonne.add(new JLabel("COMPAGNIA"));
        nomeColonne.add(new JLabel("PARTENZA-ARRIVO"));
        nomeColonne.add(new JLabel("ORARIO E DATA"));
        nomeColonne.add(new JLabel("INFORMAZIONI"));

        panelFiltro.add(nomeColonne);


        RowTabellone row=new RowTabellone();
        RowTabellone row2=new RowTabellone();
        RowTabellone row3=new RowTabellone();
        RowTabellone row4=new RowTabellone();
        RowTabellone row5=new RowTabellone();
        RowTabellone row6=new RowTabellone();
        RowTabellone row7=new RowTabellone();
        RowTabellone row8=new RowTabellone();


        panelResults=new JPanel();
        panelResults.setLayout(new BoxLayout(panelResults,BoxLayout.PAGE_AXIS));




       // panelResults.add(nomeColonne);

        for (Corsa c:corse) {
            panelResults.add(new RowTabellone());
        }
        panelResults.add(row);
        panelResults.add(row2);
        panelResults.add(row3);
        panelResults.add(row4);
        panelResults.add(row5);
        panelResults.add(row6);
        panelResults.add(row7);
        panelResults.add(row8);


        JScrollPane scroll=new JScrollPane(panelResults,JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED,JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);

        this.add(panelFiltro,BorderLayout.NORTH);
        this.add(scroll,BorderLayout.CENTER);
        this.setVisible(true);

    }

    public void updateResultsCorse(String portoPartenzaAndata, String portoArrivoAndata, String portoPartenzaRitorno, String portoArrivoRitorno,Integer giornoAndata,Integer giornoRitorno){
        panelResults.removeAll();

        Boolean conditionGiornoAndata=true;
        Boolean conditionGiornoRitorno=true;

        for (Corsa c:corse) {
            for(int i=0;i<7;i++){
                System.out.println(c.getGiorniServizioAttivo()[i]);
            }
            if(giornoAndata!=null){
                conditionGiornoAndata=controller.getGiorniServizioAttivo(c)[giornoAndata];
                if(giornoRitorno!=null){
                    conditionGiornoRitorno=controller.getGiorniServizioAttivo(c)[giornoRitorno];
                }
            }
            if(controller.getComune(controller.getPorto_Partenza(c)).equals(portoPartenzaAndata) && controller.getComune(controller.getPorto_Arrivo(c)).equals(portoArrivoAndata) && conditionGiornoAndata||
                    controller.getComune(controller.getPorto_Partenza(c)).equals(portoPartenzaRitorno) && controller.getComune(controller.getPorto_Arrivo(c)).equals(portoArrivoRitorno) && conditionGiornoRitorno) {
                panelResults.add(new RowTabellone());
            }
        }
        panelResults.revalidate();
        panelResults.repaint();
        this.revalidate();
        this.repaint();
    }

}
