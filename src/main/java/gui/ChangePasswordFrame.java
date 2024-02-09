package gui;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class ChangePasswordFrame extends JFrame implements ActionListener {
    JPasswordField oldPsw = new JPasswordField();
    JPasswordField newPsw = new JPasswordField();
    JPasswordField ConfirmnewPsw = new JPasswordField();
    JButton Submitpassword = new JButton("Conferma");
    JLabel StatusLabel = new JLabel("");
    public ChangePasswordFrame(){
        this.setSize(new Dimension(500,600));
        this.setDefaultCloseOperation(JFrame.HIDE_ON_CLOSE);
        this.setLayout(new BorderLayout(0,0));
        this.setResizable(false);





        JPanel changePsw = new JPanel();
        JLabel label = new JLabel("Cambia la Password");
        label.setFont(new Font("Serif", Font.PLAIN, 25));
        label.setPreferredSize(new Dimension(450,50));
        changePsw.setPreferredSize(new Dimension(450,200));

        JLabel oldLabel = new JLabel("Inserisci la vecchia passowrd:");
        oldLabel.setPreferredSize(new Dimension(450,25));
        oldPsw.setPreferredSize(new Dimension (450,25));
        oldPsw.addActionListener(this);
        
        JLabel newLabel = new JLabel("Inserisci la nuova password:");
        newLabel.setPreferredSize(new Dimension(450,25));
        newPsw.setPreferredSize(new Dimension (450,25));
        newPsw.addActionListener(this);
        
        JLabel ConfirmLabel = new JLabel("Conferma la nuova password:");
        ConfirmLabel.setPreferredSize(new Dimension(450,25));
        ConfirmnewPsw.setPreferredSize(new Dimension (450,25));
        ConfirmnewPsw.addActionListener(this);
        
        Submitpassword.setPreferredSize(new Dimension(100,50));
        Submitpassword.setBackground(Color.GREEN);
        Submitpassword.addActionListener(this);

        StatusLabel.setPreferredSize(new Dimension(500, 30));


        changePsw.add(label);
        changePsw.add(oldLabel);
        changePsw.add(oldPsw);
        changePsw.add(newLabel);
        changePsw.add(newPsw);
        changePsw.add(ConfirmLabel);
        changePsw.add(ConfirmnewPsw);
        changePsw.add(Submitpassword);


        this.add(changePsw);
        this.setVisible(true);
    }

    @Override
    public void actionPerformed(ActionEvent e) {
        if(e.getSource() == Submitpassword){
            if(oldPsw == newPsw){
                StatusLabel.setText("La nuova password è uguale alla vecchia");
                StatusLabel.setForeground(Color.red);
            }else if(newPsw != ConfirmnewPsw){
                StatusLabel.setText("Le password non corrispondono");
                StatusLabel.setForeground(Color.red);
            } else if(newPsw == ConfirmnewPsw){
                StatusLabel.setText("Tutto appost ATM");
                StatusLabel.setForeground(Color.GREEN);
                
            }


        }
        
    }
}
