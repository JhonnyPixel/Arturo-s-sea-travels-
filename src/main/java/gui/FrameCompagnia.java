package gui;

import javax.swing.*;
import java.awt.*;
import java.util.ArrayList;
import java.util.Properties;

import MODEL.Corsa;
import com.github.lgooddatepicker.components.TimePicker;
import controller.Controller;
import org.jdatepicker.impl.JDatePanelImpl;
import org.jdatepicker.impl.JDatePickerImpl;
import org.jdatepicker.impl.UtilDateModel;

public class FrameCompagnia extends JFrame {

    String[] porto= {"Napoli","Civitavecchia","Procida","Salerno","Parlermo","Bari","Brindisi","Cagliari"};


    JPanel leftPanel;
    ArrayList<Corsa> corse= new ArrayList<>();

    Controller controller=Controller.getController();

    public FrameCompagnia(){
        this.setSize(1400,700);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setLayout(new FlowLayout(FlowLayout.LEFT, 0, 0));
        this.setResizable(false);

        leftPanel = new JPanel();
        JPanel centerPanel = new JPanel();
        JPanel rightPanel = new JPanel();

        leftPanel.setPreferredSize(new Dimension(400,810));
        JLabel labelCorse = new JLabel("Le tue Corse");
        labelCorse.setFont(new Font("sans serif", Font.BOLD, 45));
        leftPanel.add(labelCorse);

        leftPanel.setBorder(BorderFactory.createMatteBorder(0,0,0,2,Color.lightGray));

        Controller controller=Controller.getController();
        corse=controller.filtra_corse(null,null,null,null,null,null,null);

        for (Corsa c: corse) {
            leftPanel.add(new ResultRow(controller.getComune(controller.getPorto_Partenza(c)),c.getPorto_Arrivo().getComune(),c.getCompagnia().getNome(),
                    c.getOrario_Partenza(),c.getOrario_Arrivo(),c.getPrezzoIntero(),c.getPrezzoRidotto(),c.getScontoResidente(),
                    c.getSovrVeicolo(),c.getSovrPrenotazione(),c.getSovrBagagli(),3,"www",c.getId_corsa()));
        }


        centerPanel.setPreferredSize(new Dimension(500,810));
        JLabel labelAddCorse = new JLabel("Aggiungi Corse");
        labelAddCorse.setFont(new Font("sans serif", Font.BOLD, 45));

        JPanel PanelPorti = new JPanel();
        PanelPorti.setPreferredSize(new Dimension(500,200));



        JLabel LabelPartenza = new JLabel("Seleziona il porto di partenza: ");
        LabelPartenza.setFont(new Font("Serif", Font.PLAIN, 30));
        JComboBox portoPartenza = new JComboBox(porto);

        JLabel LabelArrivo = new JLabel("Seleziona il porto di arrivo: ");
        LabelArrivo.setFont(new Font("Serif", Font.PLAIN, 30));
        JComboBox portoArrivo = new JComboBox(porto);


        JPanel PanelDate = new JPanel();
        PanelDate.setPreferredSize(new Dimension(500, 300));


        JLabel DateLabel = new JLabel("Inserisci data partenza");
        DateLabel.setFont(new Font("Serif", Font.PLAIN, 30));
        DateLabel.setIcon(new ImageIcon("src/calendario.png"));

        UtilDateModel model = new UtilDateModel();
        Properties p = new Properties();
        p.put("text.today", "Today");
        p.put("text.month", "Month");
        p.put("text.year", "Year");
        JDatePanelImpl datePanel = new JDatePanelImpl(model, p);
        JDatePickerImpl datePicker = new JDatePickerImpl(datePanel, new DateLabelFormatter());

        JLabel TimeLabel = new JLabel("inserisci l'orario della partenza");
        TimeLabel.setFont(new Font("Serif", Font.PLAIN, 30));
        TimeLabel.setIcon(new ImageIcon("src/orologio.png"));


        TimePicker timePicker=new TimePicker();


        rightPanel.setPreferredSize(new Dimension(310,810));

        JLabel labelimp = new JLabel("Impostazioni compagnia");
        labelimp.setFont(new Font("sans serif", Font.BOLD, 23));
        labelimp.setIcon(new ImageIcon("src/impostazioni.png"));
        JButton changepBtn = new JButton("Cambia password");
        changepBtn.addActionListener(e -> {
            new ChangePasswordFrame();
        });
        rightPanel.setBorder(BorderFactory.createMatteBorder(0,2,0,0,Color.lightGray));

        System.out.println(leftPanel.getPreferredSize().height);


        PanelPorti.add(LabelPartenza);
        PanelPorti.add(portoPartenza);
        PanelPorti.add(LabelArrivo);
        PanelPorti.add(portoArrivo);

        PanelDate.add(DateLabel);
        PanelDate.add(datePicker);
        PanelDate.add(TimeLabel);
        PanelDate.add(timePicker);



        centerPanel.add(labelAddCorse);
        centerPanel.add(PanelPorti);
        centerPanel.add(PanelDate);


        rightPanel.add(labelimp);
        rightPanel.add(changepBtn);


        this.add(leftPanel);
        this.add(centerPanel);
        this.add(rightPanel);

        this.setVisible(true);
    }
    public void UpdateResultsCorse(String portoPartenzaAndata, String portoArrivoAndata, String portoPartenzaRitorno, String portoArrivoRitorno){
        leftPanel.removeAll();
        for (Corsa c:corse) {
            if(c.getPorto_Partenza().getComune().equals(portoPartenzaAndata) && c.getPorto_Arrivo().getComune().equals(portoArrivoAndata) ||
                    c.getPorto_Partenza().getComune().equals(portoPartenzaRitorno) && c.getPorto_Arrivo().getComune().equals(portoArrivoRitorno)) {
                leftPanel.add(new ResultRow(controller.getComune(controller.getPorto_Partenza(c)),c.getPorto_Arrivo().getComune(),c.getCompagnia().getNome(),
                        c.getOrario_Partenza(),c.getOrario_Arrivo(),c.getPrezzoIntero(),c.getPrezzoRidotto(),c.getScontoResidente(),
                        c.getSovrVeicolo(),c.getSovrPrenotazione(),c.getSovrBagagli(),3,"",c.getId_corsa()));
            }
        }

        leftPanel.revalidate();
        leftPanel.repaint();

    }
}
