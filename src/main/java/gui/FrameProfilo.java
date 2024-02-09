package gui;

import javax.swing.*;
import java.awt.*;

public class FrameProfilo extends JFrame {
    public FrameProfilo(){

        this.setSize(1200,600);
        this.setDefaultCloseOperation(JFrame.HIDE_ON_CLOSE);
        this.setResizable(false);

        JPanel panelLeft=new JPanel();
        JPanel panelRight=new JPanel();

        panelLeft.setPreferredSize(new Dimension(600,600));
        panelRight.setPreferredSize(new Dimension(600,600));
        panelLeft.setLayout(new BoxLayout(panelLeft, BoxLayout.Y_AXIS));

        panelLeft.setBackground(Color.cyan);
        panelRight.setBackground(Color.yellow);

        panelLeft.setLayout(new FlowLayout(FlowLayout.CENTER,0,0));

        JLabel label=new JLabel("I tuoi biglietti");
        label.setHorizontalAlignment(JLabel.CENTER);
        label.setFont(new Font("sans serif",Font.BOLD,35));

        JPanel panelBiglietti=new JPanel();
        panelBiglietti.setLayout(new BoxLayout(panelBiglietti, BoxLayout.Y_AXIS));
        bigliettoRow row=new bigliettoRow();
        bigliettoRow row2=new bigliettoRow();
        bigliettoRow row3=new bigliettoRow();
        bigliettoRow row4=new bigliettoRow();
        bigliettoRow row5=new bigliettoRow();
        bigliettoRow row6=new bigliettoRow();
        bigliettoRow row7=new bigliettoRow();
        bigliettoRow row8=new bigliettoRow();
        bigliettoRow row9=new bigliettoRow();
        bigliettoRow row10=new bigliettoRow();
        bigliettoRow row11=new bigliettoRow();


        panelBiglietti.add(row);
        panelBiglietti.add(row2);
        panelBiglietti.add(row3);
        panelBiglietti.add(row4);
        panelBiglietti.add(row5);
        panelBiglietti.add(row6);
        panelBiglietti.add(row7);
        panelBiglietti.add(row8);
        panelBiglietti.add(row9);
        panelBiglietti.add(row10);
        panelBiglietti.add(row11);


        JScrollPane scroll=new JScrollPane(panelBiglietti,JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED,JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
        scroll.setPreferredSize(new Dimension(600,520));

        SettingPanel setting = new SettingPanel();



        panelLeft.add(label);
        panelLeft.add(scroll);

        panelRight.add(setting);



        this.add(panelLeft,BorderLayout.EAST);
        this.add(panelRight,BorderLayout.WEST);



        this.setVisible(true);

        //--------------------------------------------------------------------------
        /*
        this.setSize(1300,700);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setResizable(false);

        JPanel all=new JPanel();
        all.setLayout(new BorderLayout(0,0));

        //TopBar topbar=new TopBar();

        JPanel rightPanel=new JPanel();
        rightPanel.setPreferredSize(new Dimension(600,700));
        rightPanel.setLayout(new BoxLayout(rightPanel, BoxLayout.Y_AXIS));

        JPanel leftPanel=new JPanel();
        leftPanel.setPreferredSize(new Dimension(600,700));


        bigliettoRow row=new bigliettoRow();
        bigliettoRow row2=new bigliettoRow();
        bigliettoRow row3=new bigliettoRow();
        bigliettoRow row4=new bigliettoRow();
        bigliettoRow row5=new bigliettoRow();
        bigliettoRow row6=new bigliettoRow();
        bigliettoRow row7=new bigliettoRow();
        bigliettoRow row8=new bigliettoRow();
        bigliettoRow row9=new bigliettoRow();



        JScrollPane scroll=new JScrollPane(rightPanel,JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED,JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);

        rightPanel.add(row);
        rightPanel.add(row2);
        rightPanel.add(row3);
        rightPanel.add(row4);
        rightPanel.add(row5);
        rightPanel.add(row6);
        rightPanel.add(row7);
        rightPanel.add(row8);
        rightPanel.add(row9);




        SettingPanel setting = new SettingPanel();

        leftPanel.add(setting);





        all.add(leftPanel,BorderLayout.WEST);
        all.add(scroll,BorderLayout.EAST);
        this.add(all);
        this.setVisible(true);
        */

    }
}
