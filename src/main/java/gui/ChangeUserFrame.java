package gui;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class ChangeUserFrame extends JFrame implements ActionListener {
    JTextField olduser = new JTextField();
    JTextField newuser = new JTextField();
    JTextField Confirmnewuser = new JTextField();
    JButton Submituser = new JButton("Conferma");
    
    JLabel errorLabel = new JLabel("");

    public ChangeUserFrame(){
        this.setSize(new Dimension(500,600));
        this.setDefaultCloseOperation(JFrame.HIDE_ON_CLOSE);
        this.setLayout(new BorderLayout(0,0));
        this.setResizable(false);


        JLabel label = new JLabel("Cambia l'username");
        label.setFont(new Font("Serif", Font.PLAIN, 25));
        label.setPreferredSize(new Dimension(450,50));
        label.setBackground(Color.orange);



        JPanel changeuser = new JPanel();
        changeuser.setPreferredSize(new Dimension(450,200));

        label = new JLabel("Cambia l'username");
        label.setFont(new Font("Serif", Font.PLAIN, 25));
        label.setPreferredSize(new Dimension(450,50));
        label.setBackground(Color.orange);

        JLabel oldLabel = new JLabel("Inserisci il vecchio username:");
        oldLabel.setPreferredSize(new Dimension(450,25));
        olduser.setPreferredSize(new Dimension (450,25));
        olduser.addActionListener(this);

        JLabel newLabel = new JLabel("Inserisci il nuovo username:");
        newLabel.setPreferredSize(new Dimension(450,25));
        newuser.setPreferredSize(new Dimension (450,25));
        newuser.addActionListener(this);
        
        JLabel ConfirmLabel = new JLabel("Conferma il nuovo username:");
        ConfirmLabel.setPreferredSize(new Dimension(450,25));
        Confirmnewuser.setPreferredSize(new Dimension (450,25));
        Confirmnewuser.addActionListener(this);

        Submituser.setPreferredSize(new Dimension(100,50));
        Submituser.setBackground(Color.GREEN);
        Submituser.addActionListener(this);

        errorLabel.setPreferredSize(new Dimension(500, 30));


        changeuser.add(label);
        changeuser.add(oldLabel);
        changeuser.add(olduser);
        changeuser.add(newLabel);
        changeuser.add(newuser);
        changeuser.add(ConfirmLabel);
        changeuser.add(Confirmnewuser);
        changeuser.add(Submituser);
        changeuser.add(errorLabel);


        this.add(changeuser);
        this.setVisible(true);



        this.setVisible(true);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if(e.getSource() == Confirmnewuser){
            if(olduser == newuser){
                errorLabel.setText("La nuova user è uguale alla vecchia");
                errorLabel.setForeground(Color.red);
            }else if(newuser == Confirmnewuser){
                errorLabel.setText("Le password non corrispondono");
                errorLabel.setForeground(Color.red);
            }else if(newuser == Confirmnewuser){
                errorLabel.setText("Tutto apposto fra");
                errorLabel.setForeground(Color.GREEN);
            }
        }
    }
}
