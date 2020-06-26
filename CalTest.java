package swingtest;

import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;

public class CalTest extends JFrame implements ActionListener{
	private JTextField tf1, tf2, tf3;
	
	public CalTest() {
		setTitle("����");		
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
		b1.addActionListener(this);
		b2.addActionListener(this);
		b3.addActionListener(this);
		b4.addActionListener(this);
		
		setSize(600, 150);
		setVisible(true);
		
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		String str = e.getActionCommand();
		try {
			int a = Integer.parseInt(tf1.getText());
			int b = Integer.parseInt(tf2.getText());
			switch (str) {
			case "+": tf3.setText(String.valueOf(a+b));break; 
			case "-": tf3.setText(a-b+"");break;
			case "*": tf3.setText(a*b+"");break;
			case "/": tf3.setText(a/b+"");break;
			}
		}catch(NumberFormatException n) {
			tf3.setText("���ڸ� �Է��ϼ���");
		}catch(ArithmeticException a) {
			tf3.setText("0���� ���� �� ����.");
		}
		
		
	}
	
	
	public static void main(String[] args) {
		new CalTest();

	}

	

}
