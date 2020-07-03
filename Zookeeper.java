package com.zoo;

import java.awt.BorderLayout;
import java.awt.EventQueue;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;



import javax.swing.JLabel;
import javax.swing.JOptionPane;

import javax.swing.JButton;
import java.awt.event.ActionListener;

import java.awt.event.ActionEvent;
import javax.swing.UIManager;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Image;


import javax.swing.JPasswordField;
import javax.swing.ImageIcon;
import java.awt.Color;
import java.awt.SystemColor;

public class Zookeeper extends JFrame {
	private JPanel panel;
	private JLabel ZKeeper;
	private JLabel psw;
	private JButton pswBtn;
	private JPasswordField pswField;
	private JLabel lblNewLabel;
	
	

	

	
	
	
	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Zookeeper frame = new Zookeeper();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}				
			}
		});
		
	}
	
	
	

	/**
	 * Create the frame.
	 */
	public Zookeeper() {
		super("관리자만 로그인");
		
		
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 526, 363);
		JPanel contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		contentPane.setLayout(new BorderLayout(0, 0));
		setContentPane(contentPane);
		contentPane.add(getPanel(), BorderLayout.CENTER);
		
	}

	
	
	private JPanel getPanel() {
		if (panel == null) {
			panel = new JPanel();
			
			panel.setFont(UIManager.getFont("ColorChooser.font"));
			panel.setLayout(null);
			panel.add(getZKeeper());
			panel.add(getPsw());
			panel.add(getPswBtn());			
			panel.add(getPswField());
			panel.add(getLblNewLabel());
			
				
		}
		return panel;
		
	}
	
	

	private JLabel getZKeeper() {
		if (ZKeeper == null) {
			ZKeeper = new JLabel("        동물관리자 로그인");
			ZKeeper.setForeground(Color.ORANGE);
			ZKeeper.setFont(new Font("맑은 고딕", Font.BOLD, 30));
			ZKeeper.setBounds(12, 10, 476, 67);
		}
		return ZKeeper;
	}
	private JLabel getPsw() {
		if (psw == null) {
			psw = new JLabel("비밀번호");
			psw.setForeground(Color.DARK_GRAY);
			psw.setFont(new Font("맑은 고딕", Font.BOLD, 15));
			psw.setBounds(47, 267, 76, 35);
			
		}
		return psw;
	}
	//비밀번호 입력
	private JButton getPswBtn() {
		
		if (pswBtn == null) {
			pswBtn = new JButton("입력");
			pswBtn.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					if(new String(pswField.getPassword()).equals("1234")) {
						JOptionPane.showMessageDialog(null, "로그인 합니다.");
						Zoo frame = new Zoo();  
						frame.setVisible(true);
						dispose();
						
					}else {
						JOptionPane.showMessageDialog(null, "비밀번호가 틀렸습니다.");
					}
				}
				
			});
			pswBtn.setFont(new Font("맑은 고딕", Font.BOLD, 15));			
			pswBtn.setBounds(361, 267, 103, 35);
			
		}
		
		return pswBtn;
	}
	private JPasswordField getPswField() {
		if (pswField == null) {
			pswField = new JPasswordField();
			pswField.setBounds(135, 269, 214, 35);
			
		}
		
		return pswField;
	}
	//이미지 넣기
	private JLabel getLblNewLabel() {
		if (lblNewLabel == null) {
			lblNewLabel = new JLabel("New label");
			lblNewLabel.setIcon(new ImageIcon(Zookeeper.class.getResource("/images/Liger.PNG")));
			lblNewLabel.setBounds(0, 0, 511, 324);
		}
		return lblNewLabel;
	}
}
