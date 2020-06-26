package swingtest;

import java.awt.BorderLayout;
import java.awt.List;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;

import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

public class CheckBoxTest_inner2 extends JFrame {
	private JTextArea ta;	
	private JCheckBox cb1, cb2;
	public CheckBoxTest_inner2() {
		setTitle("CheckBoxTest_inner2");
		
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		JPanel p = new JPanel();
		ta = new JTextArea();
		cb1 = new JCheckBox("바나나");
		cb2 = new JCheckBox("오렌지");
		JScrollPane jsp =new JScrollPane(ta);
		p.add(cb1); p.add(cb2);						
		itemEventH2 ih = new itemEventH2();
		cb1.addItemListener(ih);
		cb2.addItemListener(ih);				
		add(BorderLayout.NORTH,p);
		add(BorderLayout.CENTER,jsp);		
		setSize(400, 300);
		setVisible(true);		
	}

	public static void main(String[] args) {
		new CheckBoxTest_inner2();

	}
	
	class itemEventH2 implements ItemListener{//내부클래스

		@Override
		public void itemStateChanged(ItemEvent e) {
			JCheckBox cb = (JCheckBox)e.getSource();
			if(cb.isSelected()) {
				ta.append(cb.getText()+ "선택\n");
			}else {
				ta.append(cb.getText()+ "선택해제\n");
			}
			
			
		}
		
	}

}
