package gui;

import javax.swing.*;
import java.awt.*;
import java.sql.Time;

public class ResultRow extends JPanel {
    public ResultRow(String comune_porto_partenza, String comune_porto_arrivo, String nome_company, Time orario_Partenza, Time orario_Arrivo, Float prezzo_intero,Float prezzo_ridotto,Float sconto_residente,Float sovr_veicolo,float sovr_prenotazione,Float sovr_bagagli,Integer n_bagagli,String veicolo,int id_corsa){

        this.setPreferredSize(new Dimension(800,100));
        this.setLayout(new FlowLayout(FlowLayout.CENTER,0,2));
        this.setBorder(BorderFactory.createMatteBorder(0,0,2,0,Color.blue));
        //this.setBackground(Color.blue);


        JPanel leftPanel=new JPanel();
        JPanel centerPanel=new JPanel();
        JPanel rightPanel=new JPanel();

        //leftPanel.setBackground(Color.pink);
        //centerPanel.setBackground(Color.red);
        //rightPanel.setBackground(Color.yellow);

        leftPanel.setPreferredSize(new Dimension(300,100));
        centerPanel.setPreferredSize(new Dimension(300,100));
        rightPanel.setPreferredSize(new Dimension(200,100));

        leftPanel.setLayout(new FlowLayout(FlowLayout.CENTER,0,0));
        centerPanel.setLayout(new FlowLayout(FlowLayout.CENTER,0,0));
        rightPanel.setLayout(new FlowLayout(FlowLayout.CENTER,0,15));


        JLabel logo_compagnia=new JLabel();
        logo_compagnia.setIcon(new ImageIcon("src/calendario.png"));
        logo_compagnia.setPreferredSize(new Dimension(300,30));
        logo_compagnia.setHorizontalAlignment(JLabel.CENTER);
        JLabel nome_compagnia=new JLabel(nome_company);
        nome_compagnia.setPreferredSize(new Dimension(300,30));
        nome_compagnia.setHorizontalAlignment(JLabel.CENTER);
        nome_compagnia.setFont(new Font("Serif",Font.PLAIN,18));



        JPanel center_right=new JPanel();
        JPanel center_center=new JPanel();
        JPanel center_left=new JPanel();
        //center_right.setBackground(Color.black);
        //center_center.setBackground(Color.lightGray);
        //center_left.setBackground(Color.magenta);
        center_left.setPreferredSize(new Dimension(125,100));
        center_center.setPreferredSize(new Dimension(50,100));
        center_right.setPreferredSize(new Dimension(125,100));
        center_center.setLayout(new BorderLayout(0,0));


        JLabel porto_arrivo=new JLabel();
        JLabel porto_partenza=new JLabel();
        JLabel arrow_icon=new JLabel();
        ImageIcon ship=new ImageIcon("src/ship-solid2.png");
        arrow_icon.setIcon(new ImageIcon("src/arrow-right.png"));
        JLabel ship_icon=new JLabel();
        JLabel ship_icon2=new JLabel();
        ship_icon.setIcon(ship);
        ship_icon2.setIcon(ship);


        porto_partenza.setText(comune_porto_partenza);
        porto_partenza.setFont(new Font("Serif",Font.PLAIN,21));
        porto_partenza.setPreferredSize(new Dimension(125,20));
        porto_partenza.setHorizontalAlignment(JLabel.CENTER);



        porto_arrivo.setText(comune_porto_arrivo);
        porto_arrivo.setFont(new Font("Serif",Font.PLAIN,21));
        porto_arrivo.setPreferredSize(new Dimension(125,20));
        porto_arrivo.setHorizontalAlignment(JLabel.CENTER);

        JLabel orario_partenza=new JLabel(orario_Partenza.toString());
        JLabel orario_arrivo=new JLabel(orario_Arrivo.toString());


        JButton btn_acquista=new JButton("ACQUISTA");
        btn_acquista.setBackground(Color.green);
        btn_acquista.setPreferredSize(new Dimension(100,50));
        btn_acquista.setBorder(BorderFactory.createEmptyBorder());
        btn_acquista.setFocusable(false);
        btn_acquista.addActionListener((e)->{
            new PannelloAcquista(prezzo_intero,sconto_residente,sovr_veicolo,sovr_prenotazione,sovr_bagagli,n_bagagli,veicolo,id_corsa);
        });




        center_left.add(ship_icon);
        center_left.add(porto_partenza);
        center_left.add(orario_partenza);
        center_right.add(ship_icon2);
        center_right.add(porto_arrivo);
        center_right.add(orario_arrivo);
        center_center.add(arrow_icon,BorderLayout.CENTER);


        centerPanel.add(center_left);
        centerPanel.add(center_center);
        centerPanel.add(center_right);

        leftPanel.add(logo_compagnia);

        leftPanel.add(nome_compagnia);

        leftPanel.add(new JLabel("intero-"+prezzo_intero.toString() + "$"+ "  ridotto-"+prezzo_ridotto.toString()+"$"));

        rightPanel.add(btn_acquista,BorderLayout.CENTER);

        this.add(leftPanel);
        this.add(centerPanel);
        this.add(rightPanel);



    }
}
