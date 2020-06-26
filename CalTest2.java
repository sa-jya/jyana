package swingtest;

import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;

public class CalTest2 extends JFrame {
	private JTextField tf1, tf2, tf3;
	
	public CalTest2() {
		setTitle("����2");		
		setLayout(new FlowLayout());
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		tf1 = new JTextField(5); // ����1
		tf2 = new JTextField(5); // ����2
		tf3 = new JTextField(15); // ���
		
		JButton b1 =  new JButton("+");
		JButton b2 =  new JButton("-");
		JButton b3 =  new JButton("*");
		JButton b4 =  new JButton("/");
		add(new JLabel("����1"));
		add(tf1);
		add(new JLabel("����2"));
		add(tf2);
		add(b1);add(b2);add(b3);add(b4);
		add(new JLabel("���"));
		add(tf3);
		b1.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				try {
					int a = Integer.parseInt(tf1.getText());
					int b = Integer.parseInt(tf2.getText());	
					tf3.setText(String.valueOf(a+b));
				}catch(NumberFormatException n) {
					tf3.setText("���ڸ� �Է��ϼ���");
				}
				}
			}
		);
		b2.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				try{
					int a = Integer.parseInt(tf1.getText());
					int b = Integer.parseInt(tf2.getText());
					tf3.setText(a-b+"");
				}catch(NumberFormatException n) {
					tf3.setText("���ڸ� �Է��ϼ���");
				}
				}
				
		});
		b3.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				try {
					int a = Integer.parseInt(tf1.getText());
					int b = Integer.parseInt(tf2.getText());
					tf3.setText(a*b+"");					
				}catch(NumberFormatException n) {
					tf3.setText("���ڸ� �Է��ϼ���");
				
				}
				
			}
		});
		b4.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				try {
					int a = Integer.parseInt(tf1.getText());
					int b = Integer.parseInt(tf2.getText());
					tf3.setText(a/b+"");					
				}catch(NumberFormatException n){
					tf3.setText("���ڸ� �Է��ϼ���");
				}catch(ArithmeticException a) {
					tf3.setText("0���� ���� �� ����.");
				}
				
			}
		});
		
		setSize(600, 150);
		setVisible(true);
		
	}
	
		
	
	
	
	public static void main(String[] args) {
		new CalTest2();

	}

	

}
