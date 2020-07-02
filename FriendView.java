package com.view;

import java.awt.BorderLayout;
import java.awt.EventQueue;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.sql.SQLSyntaxErrorException;
import java.util.ArrayList;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

import com.model.Friend;
import com.model.FriendDAO;
import com.model.FriendDAOImpl;

import javax.swing.JSplitPane;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;
import javax.swing.JButton;
import javax.swing.SwingConstants;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JComboBox;
import javax.swing.DefaultComboBoxModel;

public class FriendView extends JFrame {

	private JPanel contentPane;
	private JTextField tfName;
	private JTextField tfBirth;
	private JTextField tfPhone;
	private JTextField tfAddr;
	private JTextField tfNum;
	private JTextField tfSearch;
	FriendDAOImpl dao = new FriendDAOImpl();
	
	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					FriendView frame = new FriendView();
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
	public FriendView() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 752, 521);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		contentPane.setLayout(new BorderLayout(0, 0));
		setContentPane(contentPane);
		
		JSplitPane splitPane = new JSplitPane();
		contentPane.add(splitPane, BorderLayout.CENTER);
		
		JPanel panel = new JPanel();
		splitPane.setLeftComponent(panel);
		panel.setLayout(null);
		
		JLabel lblNewLabel = new JLabel("이름");
		lblNewLabel.setBounds(24, 88, 57, 15);
		panel.add(lblNewLabel);
		
		JLabel lblNewLabel_1 = new JLabel("생일");
		lblNewLabel_1.setBounds(24, 138, 57, 15);
		panel.add(lblNewLabel_1);
		
		JLabel lblNewLabel_2 = new JLabel("전화번호");
		lblNewLabel_2.setBounds(24, 188, 57, 15);
		panel.add(lblNewLabel_2);
		
		JLabel lblNewLabel_3 = new JLabel("주소");
		lblNewLabel_3.setBounds(24, 238, 57, 15);
		panel.add(lblNewLabel_3);
		
		tfName = new JTextField();
		tfName.setBounds(88, 85, 116, 21);
		panel.add(tfName);
		tfName.setColumns(10);
		
		tfBirth = new JTextField();
		tfBirth.setBounds(88, 132, 116, 21);
		panel.add(tfBirth);
		tfBirth.setColumns(10);
		
		tfPhone = new JTextField();
		tfPhone.setBounds(88, 185, 116, 21);
		panel.add(tfPhone);
		tfPhone.setColumns(10);
		
		tfAddr = new JTextField();
		tfAddr.setBounds(88, 235, 116, 21);
		panel.add(tfAddr);
		tfAddr.setColumns(10);
		
		JButton btnView = new JButton("전체보기");
		btnView.setBounds(12, 283, 97, 23);
		panel.add(btnView);
		
		
		
		JButton btnUpdate = new JButton("수정하기");
		btnUpdate.setBounds(12, 328, 97, 23);
		panel.add(btnUpdate);
		
		JButton btnInsert = new JButton("친구등록");
		btnInsert.setBounds(140, 283, 97, 23);
		panel.add(btnInsert);
		
		JButton btnDelete = new JButton("삭제하기");
		btnDelete.setBounds(140, 328, 97, 23);
		panel.add(btnDelete);
		
		JLabel lblNewLabel_4 = new JLabel("번호");
		lblNewLabel_4.setVerticalAlignment(SwingConstants.BOTTOM);
		lblNewLabel_4.setBounds(24, 38, 57, 15);
		panel.add(lblNewLabel_4);
		
		tfNum = new JTextField();
		tfNum.setEditable(false);
		tfNum.setColumns(10);
		tfNum.setBounds(88, 38, 116, 21);
		panel.add(tfNum);
		
		JSplitPane splitPane_1 = new JSplitPane();
		splitPane_1.setOrientation(JSplitPane.VERTICAL_SPLIT);
		splitPane.setRightComponent(splitPane_1);
		
		JScrollPane scrollPane = new JScrollPane();
		splitPane_1.setLeftComponent(scrollPane);
		
		JTextArea ta = new JTextArea();
		scrollPane.setViewportView(ta);
		//전체보기
		btnView.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				ta.setText("");
				ArrayList<Friend> arr = dao.friendView();
				for(Friend f : arr) {
					ta.append("번호: "+ f.getNum()+"\n");
					ta.append("이름: "+ f.getName()+"\n");
					ta.append("생일: "+ f.getBirth()+"\n");
					ta.append("전화번호: "+ f.getPhone()+"\n");
					ta.append("주소: "+ f.getAddr()+"\n");					
					ta.append("\n");
				}
				
			}
		});
		//친구등록
		btnInsert.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				Friend f = new Friend();
				
				f.setName(tfName.getText());
				f.setBirth(tfBirth.getText());
				f.setPhone(tfPhone.getText());
				f.setAddr(tfAddr.getText());
							
				dao.friendInsert(f);	
				clearText();
				btnView.doClick();
				
			}
		});
		//상세보기
		ta.addMouseListener(new MouseAdapter() {
			
			public void mouseReleased(MouseEvent e) {
				try {
					int num = Integer.parseInt(ta.getSelectedText());
					Friend f = dao.friendDetail(num);
					
					tfNum.setText(num+"");
					tfName.setText(f.getName());
					tfBirth.setText(f.getBirth());
					tfPhone.setText(f.getPhone());
					tfAddr.setText(f.getAddr());
					
				} catch (NullPointerException n) {
					JOptionPane.showMessageDialog(null, "번호를 선택하세요");
				}catch (NumberFormatException n2) {
					JOptionPane.showMessageDialog(null, "번호를 선택하세요");
				}
			}
		});
		
		
		//수정하기	
		btnUpdate.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				Friend f = new Friend();
				
				f.setNum(Integer.parseInt(tfNum.getText()));
				f.setName(tfName.getText());
				f.setBirth(tfBirth.getText());
				f.setPhone(tfPhone.getText());
				f.setAddr(tfAddr.getText());
							
				dao.friendUpadate(f);	
				clearText();
				btnView.doClick();
				
			}
		});
		//삭제하기
		btnDelete.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				int num = Integer.parseInt(tfNum.getText());
				dao.friendDelete(num);	
				btnView.doClick();
				clearText();
						
			}
		});
		
		
		JPanel panel_1 = new JPanel();
		splitPane_1.setRightComponent(panel_1);
		panel_1.setLayout(null);
		
		JComboBox jcb = new JComboBox();
		jcb.setModel(new DefaultComboBoxModel(new String[] {"선택...", "이름", "주소"}));
		jcb.setBounds(10, 40, 100, 40);
		panel_1.add(jcb);
		
		tfSearch = new JTextField();
		tfSearch.setBounds(125, 40, 200, 40);
		panel_1.add(tfSearch);
		tfSearch.setColumns(10);
		
		JButton btnSearch = new JButton("검색");
		btnSearch.setBounds(350, 40, 100, 40);
		panel_1.add(btnSearch);
		splitPane_1.setDividerLocation(300);
		splitPane.setDividerLocation(250);
		
		
	//검색하기
	btnSearch.addActionListener(new ActionListener() {
		
		@Override
		public void actionPerformed(ActionEvent e) {
			ta.setText("");
			 
			int idx = jcb.getSelectedIndex();
			String key = "";
			if(idx==1) {
				key="name";
			}else if(idx==2) {
				key="addr";
			}else {
				JOptionPane.showMessageDialog(null, "선택하세요");
				return;
			}
			ArrayList<Friend> arr = dao.friendSearch(key, tfSearch.getText());
			for(Friend f : arr) {
				ta.append("번호: "+ f.getNum()+"\n");
				ta.append("이름: "+ f.getName()+"\n");
				ta.append("생일: "+ f.getBirth()+"\n");
				ta.append("전화번호: "+ f.getPhone()+"\n");
				ta.append("주소: "+ f.getAddr()+"\n");					
				ta.append("\n");
			}
			
		}
	});
		
	}

	private void clearText() {
			tfNum.setText("");
			tfName.setText("");
			tfBirth.setText("");
			tfPhone.setText("");
			tfAddr.setText("");		
	}
}
