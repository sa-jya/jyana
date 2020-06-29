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
		JPanel left = new JPanel();// 왼쪽화면
		left.setLayout(new GridLayout(5,1));
		JPanel p1 = new JPanel(); //왼쪽화면 첫번째 줄		
		p1.add(new JLabel("이름"));
		JTextField tfName = new JTextField(15);
		p1.add(tfName);
		
		JButton btn = new JButton("계좌생성");//왼쪽화면 두번째 줄
		
		JPanel p2 = new JPanel(); //왼쪽화면 세번째 줄	
		p2.add(new JLabel("잔액"));
		JTextField tfBalance = new JTextField(15);
		tfBalance.setEditable(false);
		p2.add(tfBalance);
		
		JPanel p3 = new JPanel(); //왼쪽화면 네번째 줄
		JTextField tfMoney = new JTextField(15);
		p3.add(tfMoney);
		p3.add(new JLabel("원"));
		
		JPanel p4 = new JPanel(); //왼쪽화면 다섯번째 줄
		JButton inputBtn = new JButton("예금");
		JButton outputBtn = new JButton("출금");
		JButton fileBtn = new JButton("파일로 저장");
		p4.add(inputBtn); p4.add(outputBtn); p4.add(fileBtn);
		
		left.add(p1); left.add(btn); left.add(p2); left.add(p3); left.add(p4);
		
		//오른쪽 화면
		 list =new List();
		//왼쪽, 오른쪽 화면 붙이기
		add(left); add(list);
				
		//계좌생성버튼 클릭
		btn.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				// tfName의 내용을 가져와서 list에 추가한다.
				if(tfName.getText().isEmpty())return;
				list.add(tfName.getText());
				hm.put(tfName.getText(), 0); //맵에 저장
				tfName.setText("");
				}
			}
		);		
		//예금버튼 클릭
		inputBtn.addActionListener(new ActionListener() {
			/*
			 * 1. 리스트에 선택된 계좌 잔액에
			 * 2. tfMoney 만큼 더해서
			 * 3. 잔액(tfBalance)을 고쳐주고 맵에 저장
			 */					
			@Override
				public void actionPerformed(ActionEvent e) {
				//list+ tfMoney = tfBalance;
				try {
					String key = list.getSelectedItem();
					int balance = hm.get(key);//기존잔액
					int value = balance+Integer.parseInt(tfMoney.getText());//수정잔액
					tfBalance.setText(value+"");//화면에서 잔액수정
					hm.put(key, value);//hm 내용 수정
					tfMoney.setText("");//편의를 위해 예금					
					}catch(NullPointerException n) {
					new MessageBox("오류", "계좌를 선택해 주세요");
						}catch(NumberFormatException e2) {
							new MessageBox("입력오류", "숫자를 입력하세요");
						}
				}
		});
		//출금버튼 클릭
		outputBtn.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				try {
					String key = list.getSelectedItem().trim();
					int balance = hm.get(key);//기존잔액
					int value = balance-Integer.parseInt(tfMoney.getText());//수정잔액
					if(value<=0) {
						new MessageBox("잔액부족!!", key+"님 잔액이 부족합니다.");					
						return;
					}
					tfBalance.setText(value+"");//화면에서 잔액수정
					hm.put(key, value);//hm 내용 수정
					tfMoney.setText("");//편의를 위해 예금
					
				}catch(NullPointerException n) {
					new MessageBox("오류", "계좌를 선택해 주세요");
					}catch (NumberFormatException e2) {
						new MessageBox("입력오류", "숫자를 입력하세요");
					}			
			}
		});
		
		
		
		//리스트
		list.addItemListener(new ItemListener() {
			
			@Override
			public void itemStateChanged(ItemEvent e) {
			//리스트에서 선택한 이름을 tfName 넣고 잔액은 tfBalance에 넣기
				String str = list.getSelectedItem().trim();//trim() 앞뒤 공백 제거용
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
					Set<String> set = hm.keySet();//key의 집합
					Iterator<String> it = set.iterator();
					while(it.hasNext()) {
						String key = it.next();//하나의 key 구하기
						fw.write(key+" ");//이름내보내기
						fw.write(hm.get(key)+"\n");//잔액구하기
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
			Scanner sc = new Scanner(file); //파일로 읽어오기
			while(sc.hasNext()) {
				String name =sc.next().trim();//이름
				int money =sc.nextInt();
				hm.put(name, money); //맵에 저장
				list.add(name +"\n"); //리스트에 이름 추가
			}
			sc.close();
		}catch(Exception e) {
			
		}
		
		
	}
	public static void main(String[] args) {
		new Bank();
		

	}

}
