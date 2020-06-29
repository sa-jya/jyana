package swingtest;

import java.awt.GridLayout;
import java.awt.List;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Scanner;
import java.util.Set;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class Bank extends JFrame{
	List list;
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
		 list =new List();
		//����, ������ ȭ�� ���̱�
		add(left); add(list);
				
		//���»�����ư Ŭ��
		btn.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				// tfName�� ������ �����ͼ� list�� �߰��Ѵ�.
				if(tfName.getText().isEmpty())return;
				list.add(tfName.getText());
				hm.put(tfName.getText(), 0); //�ʿ� ����
				tfName.setText("");
				}
			}
		);		
		//���ݹ�ư Ŭ��
		inputBtn.addActionListener(new ActionListener() {
			/*
			 * 1. ����Ʈ�� ���õ� ���� �ܾ׿�
			 * 2. tfMoney ��ŭ ���ؼ�
			 * 3. �ܾ�(tfBalance)�� �����ְ� �ʿ� ����
			 */					
			@Override
				public void actionPerformed(ActionEvent e) {
				//list+ tfMoney = tfBalance;
				try {
					String key = list.getSelectedItem();
					int balance = hm.get(key);//�����ܾ�
					int value = balance+Integer.parseInt(tfMoney.getText());//�����ܾ�
					tfBalance.setText(value+"");//ȭ�鿡�� �ܾ׼���
					hm.put(key, value);//hm ���� ����
					tfMoney.setText("");//���Ǹ� ���� ����					
					}catch(NullPointerException n) {
					new MessageBox("����", "���¸� ������ �ּ���");
						}catch(NumberFormatException e2) {
							new MessageBox("�Է¿���", "���ڸ� �Է��ϼ���");
						}
				}
		});
		//��ݹ�ư Ŭ��
		outputBtn.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				try {
					String key = list.getSelectedItem().trim();
					int balance = hm.get(key);//�����ܾ�
					int value = balance-Integer.parseInt(tfMoney.getText());//�����ܾ�
					if(value<=0) {
						new MessageBox("�ܾ׺���!!", key+"�� �ܾ��� �����մϴ�.");					
						return;
					}
					tfBalance.setText(value+"");//ȭ�鿡�� �ܾ׼���
					hm.put(key, value);//hm ���� ����
					tfMoney.setText("");//���Ǹ� ���� ����
					
				}catch(NullPointerException n) {
					new MessageBox("����", "���¸� ������ �ּ���");
					}catch (NumberFormatException e2) {
						new MessageBox("�Է¿���", "���ڸ� �Է��ϼ���");
					}			
			}
		});
		
		
		
		//����Ʈ
		list.addItemListener(new ItemListener() {
			
			@Override
			public void itemStateChanged(ItemEvent e) {
			//����Ʈ���� ������ �̸��� tfName �ְ� �ܾ��� tfBalance�� �ֱ�
				String str = list.getSelectedItem().trim();//trim() �յ� ���� ���ſ�
				tfName.setText(str);
				tfBalance.setText(hm.get(str)+"");
					
				
			}
		});
		fileBtn.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				File dir = new File("src\\swingtest");
				File file = new File(dir, "myBank.txt");
				try {
					FileWriter fw = new FileWriter(file);
					Set<String> set = hm.keySet();//key�� ����
					Iterator<String> it = set.iterator();
					while(it.hasNext()) {
						String key = it.next();//�ϳ��� key ���ϱ�
						fw.write(key+" ");//�̸���������
						fw.write(hm.get(key)+"\n");//�ܾױ��ϱ�
					}
					fw.close();
				}catch(IOException e1) {
					e1.printStackTrace();
				}
				
			}
		});

		
		setSize(500, 300);
		setVisible(true);
		load();
	}
	private void load() {
		hm.clear();
		File dir = new File("src\\swingtest");
		File file = new File(dir,"myBank.txt");
		try {
			if(!file.exists()) {
				file.createNewFile();
			}
			Scanner sc = new Scanner(file); //���Ϸ� �о����
			while(sc.hasNext()) {
				String name =sc.next().trim();//�̸�
				int money =sc.nextInt();
				hm.put(name, money); //�ʿ� ����
				list.add(name +"\n"); //����Ʈ�� �̸� �߰�
			}
			sc.close();
		}catch(Exception e) {
			
		}
		
		
	}
	public static void main(String[] args) {
		new Bank();
		

	}

}
