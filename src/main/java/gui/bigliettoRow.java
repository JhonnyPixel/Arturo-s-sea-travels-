package gui;

import javax.swing.*;
import java.awt.*;

public class bigliettoRow extends JPanel {
    public bigliettoRow(){
        this.setPreferredSize(new Dimension(600,100));
        this.setBackground(Color.pink);
        this.setLayout(new FlowLayout(FlowLayout.LEFT,0,0));

        JPanel panel1=new JPanel();
        panel1.setPreferredSize(new Dimension(200,100));
        panel1.setBackground(Color.gray);
        panel1.setLayout(new BorderLayout(0,0));

        ImageIcon logo=new ImageIcon("src/calendario.png");
        JLabel nomeCompagnia=new JLabel("CAREMAR");
        nomeCompagnia.setIcon(logo);
        nomeCompagnia.setHorizontalTextPosition(JLabel.RIGHT);
        nomeCompagnia.setHorizontalAlignment(JLabel.CENTER);
        nomeCompagnia.setVerticalAlignment(JLabel.CENTER);
        panel1.add(nomeCompagnia);

        JPanel panel2=new JPanel();
        panel2.setBackground(Color.red);
        panel2.setPreferredSize(new Dimension(200,100));
        panel2.setLayout(new FlowLayout(FlowLayout.CENTER,0,0));

        JPanel panel2top=new JPanel();
        JPanel panel2bottom=new JPanel();
        panel2top.setPreferredSize(new Dimension(200,50));
        panel2bottom.setPreferredSize(new Dimension(200,50));

        JLabel portoPartenza=new JLabel("BARI");
        JLabel portoArrivo=new JLabel("PALERMO");

        portoPartenza.setHorizontalAlignment(JLabel.CENTER);
        portoArrivo.setHorizontalAlignment(JLabel.CENTER);
        panel2top.add(portoPartenza);
        panel2bottom.add(portoArrivo);

        panel2.add(panel2top);
        panel2.add(panel2bottom);




        JPanel panel3=new JPanel();
        panel3.setBackground(Color.magenta);
        panel3.setPreferredSize(new Dimension(200,100));
        panel3.setLayout(new FlowLayout(FlowLayout.CENTER,0,0));

        JPanel panel3top=new JPanel();
        JPanel panel3bottom=new JPanel();
        panel3top.setPreferredSize(new Dimension(200,50));
        panel3bottom.setPreferredSize(new Dimension(200,50));

        JLabel orarioPartenza=new JLabel("12/12/23 15:30");
        JLabel orarioArrivo=new JLabel("12/12/23 17:30");

        orarioPartenza.setHorizontalAlignment(JLabel.CENTER);
        orarioArrivo.setHorizontalAlignment(JLabel.CENTER);
        panel3top.add(orarioPartenza);
        panel3bottom.add(orarioArrivo);

        panel3.add(panel3top);
        panel3.add(panel3bottom);

        this.add(panel1);
        this.add(panel2);
        this.add(panel3);
    }
}
