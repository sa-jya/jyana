package swingtest;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.GridLayout;
import java.awt.List;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;

import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JTextArea;
import javax.swing.JTextField;

public class ListTest2 extends JFrame {
	private JTextField tf;
	private JTextArea ta;
	private List list; //awt�ȿ� �ִ� list ���
	private JCheckBox cb;
	public ListTest2() {
		setTitle("List ����");
		setLayout(new BorderLayout());
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		JPanel p1 = new JPanel();
		tf = new JTextField(15);
		JButton btn = new JButton("�߰�");
		cb = new JCheckBox("���߼���");
		p1.add(tf);p1.add(btn);p1.add(cb);
		p1.setBackground(Color.black);
			
		JPanel p2 = new JPanel(new GridLayout(1,2));
		list = new List();
		ta = new JTextArea();
		p2.add(list);p2.add(ta);
		ActionH ah = new ActionH();
		itemH ih = new itemH();
		
		btn.addActionListener(ah);//����
		tf.addActionListener(ah);
		list.addItemListener(ih);//����
		cb.addItemListener(ih);//����

		 
				
		add(BorderLayout.NORTH, p1);
		add(BorderLayout.CENTER, p2);
		
		setSize(400, 400);
		setVisible(true);
	}

	public static void main(String[] args) {
		new ListTest2();
		
	}
	class ActionH implements ActionListener{

		@Override
		public void actionPerformed(ActionEvent e) {
			if(tf.getText().isEmpty())return;
			list.add(tf.getText());
			tf.setText("");
		}
		
	}
	class itemH implements ItemListener{

		@Override
		public void itemStateChanged(ItemEvent e) {
			Object obj = e.getSource();
			if (obj==list) {//list�� �̺�Ʈ �߻�
				ta.setText("");
				if(list.isMultipleMode()) {//����Ʈ�� ���߼���
					String[]arr = list.getSelectedItems();
					for(int i =0; i<arr.length;i++) {
						ta.append(arr[i]+"\n");
					}
					
				}else { //����Ʈ�� ���� ����
					//����Ʈ(list)���� ������ ������ taxtarea(ta)���� ���
					ta.setText(list.getSelectedItem());	
				}
			}else if(obj==cb){//checkbox�� �̺�Ʈ �߻�
				if(cb.isSelected()) {//üũ�� ���� = ����Ʈ ���߸��
					list.setMultipleMode(true);
				}else {//üũ�� ���� = ����Ʈ ���ϸ��
					list.setMultipleMode(false);
				}
			}
			
		}
		
	}
	

}
