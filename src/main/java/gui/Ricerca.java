package gui;

import MODEL.Corsa;
import org.jdatepicker.impl.JDatePanelImpl;
import org.jdatepicker.impl.JDatePickerImpl;
import org.jdatepicker.impl.UtilDateModel;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.lang.reflect.Array;
//import java.util.Date;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Properties;
import java.util.Calendar;

public class Ricerca extends JPanel implements ItemListener {


    JRadioButton ARBtn = new JRadioButton("Andata e Ritorno");
    JRadioButton SABtn = new JRadioButton("Solo andata");
    JComboBox Ritornobox = new JComboBox();
    JComboBox Andatabox= new JComboBox();

    String[] veicolo = {"Automobile", "Moto", "Camper", "Minivan", "Furgone", "Bus", "Camion"};

    String[] bagagli = {"1", "2", "3", "4", "5", "6", "7", "8", "9"};

    JDatePickerImpl datePicker;
    JDatePickerImpl datePicker2;


    public Ricerca(FramePasseggero frameChiamante,ArrayList<Corsa> corse) {

        Andatabox.setPreferredSize(new Dimension(500, 30));
        Ritornobox.setEditable(true);
        Andatabox.setEditable(true);

        for(Corsa c:corse){
            Ritornobox.addItem(c.getPorto_Partenza().getComune()+"->"+c.getPorto_Arrivo().getComune());
            Andatabox.addItem(c.getPorto_Partenza().getComune()+"->"+c.getPorto_Arrivo().getComune());
        }



        this.setPreferredSize(new Dimension(750, 810));
        this.setLayout(new FlowLayout(FlowLayout.LEFT, 0, 0));


        JPanel SelectCorsa = new JPanel();
        SelectCorsa.setPreferredSize(new Dimension(750, 200));

        JLabel TratteLabel = new JLabel("Seleziona le tratte");
        TratteLabel.setIcon(new ImageIcon("src/trag.png"));
        TratteLabel.setPreferredSize(new Dimension(700, 30));
        TratteLabel.setFont(new Font("Serif", Font.PLAIN, 18));
        //TratteLabel.setHorizontalAlignment(JLabel.LEFT);


        ARBtn.setPreferredSize(new Dimension(500, 30));
        ARBtn.setFont(new Font("Serif", Font.PLAIN, 18));
        ARBtn.setHorizontalAlignment(JRadioButton.RIGHT);
        ARBtn.addItemListener(this);



        //SABtn.setPreferredSize(new Dimension(500,30));
        SABtn.setFont(new Font("Serif", Font.PLAIN, 18));
        SABtn.setHorizontalAlignment(JRadioButton.RIGHT);
        SABtn.addItemListener(this);



        Ritornobox.setPreferredSize(new Dimension(500, 30));
        Ritornobox.addItemListener(this);


        JPanel SelectDate = new JPanel();
        SelectDate.setPreferredSize(new Dimension(750, 100));
        JLabel DateLabel = new JLabel("Seleziona le date");
        DateLabel.setIcon(new ImageIcon("src/calendario.png"));
        DateLabel.setPreferredSize(new Dimension(700, 30));
        DateLabel.setFont(new Font("Serif", Font.PLAIN, 18));

        UtilDateModel model = new UtilDateModel();
        Properties p = new Properties();
        p.put("text.today", "Today");
        p.put("text.month", "Month");
        p.put("text.year", "Year");
        JDatePanelImpl datePanel = new JDatePanelImpl(model, p);
        datePicker = new JDatePickerImpl(datePanel, new DateLabelFormatter());

        UtilDateModel model2 = new UtilDateModel();
        Properties p2 = new Properties();
        p.put("text.today", "Today");
        p.put("text.month", "Month");
        p.put("text.year", "Year");
        JDatePanelImpl datePanel2 = new JDatePanelImpl(model2, p2);
        datePicker2 = new JDatePickerImpl(datePanel2, new DateLabelFormatter());


        ARBtn.setSelected(true);


        JPanel SelectPV = new JPanel();
        SelectPV.setPreferredSize(new Dimension(750, 100));
        JLabel BagagliLabel = new JLabel("Seleziona i bagagli");
        BagagliLabel.setIcon(new ImageIcon("src/icons8-persona-24 (1).png"));
        BagagliLabel.setPreferredSize(new Dimension(350, 30));
        BagagliLabel.setFont(new Font("Serif", Font.PLAIN, 18));

        JLabel VeicoloLabel = new JLabel("Seleziona il veicolo ");
        VeicoloLabel.setIcon(new ImageIcon("src/auto.png"));
        VeicoloLabel.setPreferredSize(new Dimension(350, 30));
        VeicoloLabel.setFont(new Font("Serif", Font.PLAIN, 18));

        JComboBox boxbagagli = new JComboBox(bagagli);
        boxbagagli.setPreferredSize(new Dimension(100, 30));
        boxbagagli.addItemListener(this);


        JLabel space = new JLabel("");
        space.setPreferredSize(new Dimension(250, 30));

        JComboBox boxveicolo = new JComboBox(veicolo);
        boxveicolo.setPreferredSize(new Dimension(100, 30));

        JLabel space2 = new JLabel("");
        space2.setPreferredSize(new Dimension(200, 30));

        JPanel SelectRes = new JPanel();
        SelectRes.setPreferredSize(new Dimension(750, 50));
        JCheckBox ResBox = new JCheckBox("Tariffa residente");
        ResBox.setPreferredSize(new Dimension(700, 30));


        JPanel RicercaPanel = new JPanel();
        RicercaPanel.setPreferredSize(new Dimension(750, 100));
        JButton btnCerca = new JButton("CERCA");
        btnCerca.setBackground(Color.RED);
        btnCerca.setPreferredSize(new Dimension(200, 50));
        btnCerca.setBorder(BorderFactory.createEmptyBorder());
        btnCerca.setFocusable(false);

        btnCerca.addActionListener(e->{
            String[] andata=new String[2];
            String[] ritorno=new String[2];
            if(Andatabox.getSelectedIndex() != -1){
                andata=Andatabox.getSelectedItem().toString().split("-");
                andata[1]=andata[1].replace(">","");
            }else{
                andata[0]=null;
                andata[1]=null;
            }

            if(Ritornobox.getSelectedIndex() != -1){
                ritorno=Ritornobox.getSelectedItem().toString().split("-");
                ritorno[1]=ritorno[1].replace(">","");
            }else{
                ritorno[0]=null;
                ritorno[1]=null;
            }


            System.out.println(andata[0]+" "+andata[1]);
            System.out.println(ritorno[0]+" "+ritorno[1]);

            Calendar cal = Calendar.getInstance();

            Integer GiornoAndata=null;
            Integer GiornoRitorno=null;

            java.util.Date selectedDateAndata = (java.util.Date) datePicker.getModel().getValue();

            java.sql.Date selectedDateAndataSQL=(selectedDateAndata==null)? null :new Date(selectedDateAndata.getTime());


            java.util.Date selectedDateRitorno = (java.util.Date) datePicker2.getModel().getValue();
            java.sql.Date selectedDateRitornoSQL=(selectedDateRitorno==null)? null : new Date(selectedDateRitorno.getTime());



            System.out.println(GiornoAndata + " "+ GiornoRitorno);
            frameChiamante.UpdateResultsCorse(andata[0],andata[1],ritorno[0],ritorno[1],  selectedDateAndataSQL, selectedDateRitornoSQL,Ritornobox.isEnabled());
        });


        SelectCorsa.add(TratteLabel);
        SelectCorsa.add(ARBtn);
        SelectCorsa.add(SABtn);
        SelectCorsa.add(Andatabox);
        SelectCorsa.add(Ritornobox);

        SelectDate.add(DateLabel);
        SelectDate.add(datePicker);
        SelectDate.add(datePicker2);

        SelectPV.add(BagagliLabel);
        SelectPV.add(VeicoloLabel);
        SelectPV.add(boxbagagli);
        SelectPV.add(space);
        SelectPV.add(boxveicolo);
        SelectPV.add(space2);


        SelectRes.add(ResBox);

        RicercaPanel.add(btnCerca);

        this.add(SelectCorsa);
        this.add(SelectDate);
        this.add(SelectPV);
        this.add(SelectRes);
        this.add(RicercaPanel);
        this.setVisible(true);

    }


    @Override
    public void itemStateChanged(ItemEvent e) {
        if (e.getStateChange() == ItemEvent.SELECTED) {

            if (e.getItem() == ARBtn) {
                SABtn.setSelected(false);
                datePicker2.setVisible(true);
                Ritornobox.setSelectedItem(Andatabox.getSelectedItem());

            } else if (e.getItem() == SABtn) {
                ARBtn.setSelected(false);
                Ritornobox.setEnabled(false);
                Ritornobox.setSelectedItem(null);
                datePicker2.setVisible(false);
            }
        } else if (e.getStateChange() == ItemEvent.DESELECTED) {

            if (e.getItem() == ARBtn) {
                SABtn.setSelected(true);
                datePicker2.setVisible(false);
            } else if (e.getItem() == SABtn) {
                ARBtn.setSelected(true);
                Ritornobox.setEnabled(true);
                datePicker2.setVisible(true);
            }
        }
    }
}