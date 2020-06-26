package swingtest;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
//JFrame �⺻ ���̾ƿ��� BorderLayout
//JPanel �⺻ ���̾Ƽ��� FlowLayout
public class CalTest_Border extends JFrame implements ActionListener{
	private JTextField tf1, tf2, tf3;
	
	public CalTest_Border() {
		setTitle("����BorderLayout");		
		//setLayout(new BorderLayout()); //��������
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		JPanel p1 = new JPanel();
		JPanel p2 = new JPanel();
		JPanel p3 = new JPanel();
		tf1 = new JTextField(5); // ����1
		tf2 = new JTextField(5); // ����2
		tf3 = new JTextField(15); // ���
		
		JButton b1 =  new JButton("+");
		JButton b2 =  new JButton("-");
		JButton b3 =  new JButton("*");
		JButton b4 =  new JButton("/");
		//p1.setLayout(new FlowLayout()); //�������� 
		p1.add(new JLabel("����1"));
		p1.add(tf1);
		p1.add(new JLabel("����2"));
		p1.add(tf2);
		p2.add(b1);p2.add(b2);p2.add(b3);p2.add(b4);
		p3.add(new JLabel("���"));
		p3.add(tf3);
		add(BorderLayout.NORTH, p1);
		add(BorderLayout.CENTER, p2);
		add(BorderLayout.SOUTH, p3);
		b1.addActionListener(this);
		b2.addActionListener(this);
		b3.addActionListener(this);
		b4.addActionListener(this);
		
		setSize(400, 150);
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
		new CalTest_Border();

	}

	

}
