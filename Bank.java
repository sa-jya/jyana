package swingtest;

import java.awt.GridLayout;
import java.awt.List;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.util.HashMap;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class Bank extends JFrame{
	HashMap<String, Integer> hm = new HashMap<String, Integer>();
	public Bank() {
		setTitle("Bank");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setLayout( new GridLayout(1,2));
		JPanel left = new JPanel();// ����ȭ��
		left.setLayout(new GridLayout(5,1));
		JPanel p1 = new JPanel(); //����ȭ�� ù��° ��		
		p1.add(new JLabel("�̸�"));
		JTextField tfName = new JTextField(15);
		p1.add(tfName);
		
		JButton btn = new JButton("���»���");//����ȭ�� �ι�° ��
		
		JPanel p2 = new JPanel(); //����ȭ�� ����° ��	
		p2.add(new JLabel("�ܾ�"));
		JTextField tfBalance = new JTextField(15);
		tfBalance.setEditable(false);
		p2.add(tfBalance);
		
		JPanel p3 = new JPanel(); //����ȭ�� �׹�° ��
		JTextField tfMoney = new JTextField(15);
		p3.add(tfMoney);
		p3.add(new JLabel("��"));
		
		JPanel p4 = new JPanel(); //����ȭ�� �ټ���° ��
		JButton inputBtn = new JButton("����");
		JButton outputBtn = new JButton("���");
		JButton fileBtn = new JButton("���Ϸ� ����");
		p4.add(inputBtn); p4.add(outputBtn); p4.add(fileBtn);
		
		left.add(p1); left.add(btn); left.add(p2); left.add(p3); left.add(p4);
		
		//������ ȭ��
		List lst =new List();
		//����, ������ ȭ�� ���̱�
		add(left); add(lst);
				
		//���»�����ư Ŭ��
		btn.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				// tfName�� ������ �����ͼ� lst�� �߰��Ѵ�.
				if(tfName.getText().isEmpty())return;
				lst.add(tfName.getText());
				hm.put(tfName.getText(), 0); //�ʿ� ����
				tfName.setText("");
			}
		});		
		//���ݹ�ư Ŭ��
		lst.addActionListener(new ActionListener() {
			/*
			 * 1. ����Ʈ�� ���õ� ���� �ܾ׿�
			 * 2. tfMoney ��ŭ ���ؼ�
			 * 3. �ܾ�(tfBalance)�� �����ְ� �ʿ� ����
			 */					
			@Override
				public void actionPerformed(ActionEvent e) {
				//lst+ tfMoney = tfBalance;
				String key = lst.getSelectedItem();
				int balance = hm.get(key);//�����ܾ�
				int value = balance+Integer.parseInt(tfMoney.getText());//�����ܾ�
				tfBalance.setText(value+"");//ȭ�鿡�� �ܾ׼���
				hm.put(key, value);//hm ���� ����
				tfMoney.setText("");//���Ǹ� ���� ����
			
					
				
		
				}
		});
		//��ݹ�ư Ŭ��
		outputBtn.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				String key = lst.getSelectedItem();
				int balance = hm.get(key);//�����ܾ�
				int value = balance-Integer.parseInt(tfMoney.getText());//�����ܾ�
				if(value<=0) {
					new MessageBox("�ܾ׺���!!", key+"�� �ܾ��� �����մϴ�.");					
					return;
				}
				tfBalance.setText(value+"");//ȭ�鿡�� �ܾ׼���
				hm.put(key, value);//hm ���� ����
				tfMoney.setText("");//���Ǹ� ���� ����
				
				
			}
		});
		
		
		
		//����Ʈ
		lst.addItemListener(new ItemListener() {
			
			@Override
			public void itemStateChanged(ItemEvent e) {
			//����Ʈ���� ������ �̸��� tfName �ְ� �ܾ��� tfBalance�� �ֱ�
				String str = lst.getSelectedItem();
				tfName.setText(str);
				tfBalance.setText(hm.get(str)+"");
					
				
			}
		});

		
		setSize(500, 300);
		setVisible(true);
	}
	public static void main(String[] args) {
		new Bank();
		

	}

}
