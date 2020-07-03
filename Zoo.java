package com.zoo;

import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

import com.model.Friend;

import javax.swing.JSplitPane;
import javax.swing.JLabel;
import javax.swing.JOptionPane;

import java.awt.Color;
import java.awt.Rectangle;
import javax.swing.JTextField;
import javax.swing.JButton;
import java.awt.ComponentOrientation;
import javax.swing.JScrollPane;
import java.awt.Component;
import java.awt.Cursor;
import javax.swing.JTextArea;
import java.awt.Dimension;
import javax.swing.JComboBox;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.awt.event.ActionEvent;
import javax.swing.DefaultComboBoxModel;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.Font;
import javax.swing.ImageIcon;

public class Zoo extends JFrame {
	
	private JPanel contentPane;
	private JSplitPane splitPane;
	private JPanel panel;
	private JLabel species;
	private JLabel age;
	private JLabel gender;
	private JLabel cost;
	private JLabel birthplace;
	private JTextField speciesTf;
	private JTextField ageTf;
	private JTextField genderTf;
	private JTextField idTf;
	private JTextField costTf;
	private JTextField birthplaceTf;
	private JButton btnView;
	private JButton btnInsert;
	private JButton btnDelete;
	private JButton btnUpadate;
	private JSplitPane splitPane_1;
	private JLabel num;
	private JTextField numTf;
	private JScrollPane scrollPane;
	private JPanel panel_1;
	private JLabel id;
	private JTextArea ta;
	private JComboBox jcb;
	private JTextField tfSearch;
	private JButton btnSearch;
	AnimalDAOImpl dao = new AnimalDAOImpl();
	/**
	 * Launch the application.
	 */
//	public static void main(String[] args) {
//		EventQueue.invokeLater(new Runnable() {
//			public void run() {
//				try {
//					Zoo frame = new Zoo();  //로그인 연결
//					frame.setVisible(true); //로그인 연결
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//			}
//		});
//	}

	/**
	 * Create the frame.
	 */
	public Zoo() {
		setTitle("동물관리시스템(관리자용)");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 726, 544);
		contentPane = new JPanel();
		contentPane.setFont(new Font("맑은 고딕", Font.PLAIN, 12));
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		contentPane.setLayout(new BorderLayout(0, 0));
		setContentPane(contentPane);
		contentPane.add(getSplitPane(), BorderLayout.CENTER);
	}

	private JSplitPane getSplitPane() {
		if (splitPane == null) {
			splitPane = new JSplitPane();
			splitPane.setFont(new Font("맑은 고딕", Font.BOLD, 12));
			splitPane.setLeftComponent(getPanel());
			splitPane.setRightComponent(getSplitPane_1());
			splitPane.setDividerLocation(280);
		}
		return splitPane;
	}
	private JPanel getPanel() {
		if (panel == null) {
			panel = new JPanel();
			panel.setFont(new Font("맑은 고딕", Font.BOLD, 12));
			panel.setBackground(new Color(240, 128, 128));
			panel.setLayout(null);
			panel.add(getSpecies());
			panel.add(getAge());
			panel.add(getGender());
			
			panel.add(getCost());
			panel.add(getBirthplace());
			panel.add(getId());
			panel.add(getSpeciesTf());
			panel.add(getAgeTf());
			panel.add(getGenderTf());
			panel.add(getIdTf());
			panel.add(getCostTf());
			panel.add(getBirthplaceTf());
			panel.add(getBtnView());
			panel.add(getBtnInsert());
			panel.add(getBtnDelete());
			panel.add(getBtnUpadate());
			panel.add(getNum());
			panel.add(getNumTf());
		}
		return panel;
	}
	private JLabel getSpecies() {
		if (species == null) {
			species = new JLabel(" 종");
			species.setForeground(Color.WHITE);
			species.setFont(new Font("맑은 고딕", Font.BOLD, 12));
			species.setBounds(new Rectangle(10, 0, 20, 20));
			species.setBounds(10, 40, 57, 15);
		}
		return species;
	}
	private JLabel getAge() {
		if (age == null) {
			age = new JLabel("나이");
			age.setForeground(Color.WHITE);
			age.setFont(new Font("맑은 고딕", Font.BOLD, 12));
			age.setBounds(new Rectangle(10, 0, 20, 20));
			age.setBackground(Color.WHITE);
			age.setBounds(10, 80, 57, 15);
		}
		return age;
	}
	private JLabel getGender() {
		if (gender == null) {
			gender = new JLabel("성별");
			gender.setForeground(Color.WHITE);
			gender.setFont(new Font("맑은 고딕", Font.BOLD, 12));
			gender.setBounds(new Rectangle(10, 0, 20, 20));
			gender.setBackground(Color.WHITE);
			gender.setBounds(10, 120, 57, 15);
		}
		return gender;
	}
	
	private JLabel getCost() {
		if (cost == null) {
			cost = new JLabel("입양 비용");
			cost.setForeground(Color.WHITE);
			cost.setFont(new Font("맑은 고딕", Font.BOLD, 12));
			cost.setBounds(new Rectangle(10, 0, 20, 20));
			cost.setBackground(Color.WHITE);
			cost.setBounds(10, 200, 57, 15);
		}
		return cost;
	}
	private JLabel getBirthplace() {
		if (birthplace == null) {
			birthplace = new JLabel("태어난 곳");
			birthplace.setForeground(Color.WHITE);
			birthplace.setFont(new Font("맑은 고딕", Font.BOLD, 12));
			birthplace.setBounds(new Rectangle(10, 0, 20, 20));
			birthplace.setBackground(Color.WHITE);
			birthplace.setBounds(10, 240, 57, 15);
		}
		return birthplace;
	}
	private JTextField getSpeciesTf() {
		if (speciesTf == null) {
			speciesTf = new JTextField();
			speciesTf.setFont(new Font("맑은 고딕", Font.BOLD, 12));
			speciesTf.setBounds(100, 37, 116, 21);
			speciesTf.setColumns(10);
		}
		return speciesTf;
	}
	private JTextField getAgeTf() {
		if (ageTf == null) {
			ageTf = new JTextField();
			ageTf.setFont(new Font("맑은 고딕", Font.BOLD, 12));
			ageTf.setColumns(10);
			ageTf.setBounds(100, 77, 116, 21);
		}
		return ageTf;
	}
	private JTextField getGenderTf() {
		if (genderTf == null) {
			genderTf = new JTextField();
			genderTf.setFont(new Font("맑은 고딕", Font.BOLD, 12));
			genderTf.setColumns(10);
			genderTf.setBounds(100, 117, 116, 21);
		}
		return genderTf;
	}
	private JTextField getIdTf() {
		if (idTf == null) {
			idTf = new JTextField();
			idTf.setFont(new Font("맑은 고딕", Font.BOLD, 12));
			idTf.setColumns(10);
			idTf.setBounds(100, 157, 116, 21);
		}
		return idTf;
	}
	private JTextField getCostTf() {
		if (costTf == null) {
			costTf = new JTextField();
			costTf.setFont(new Font("맑은 고딕", Font.BOLD, 12));
			costTf.setColumns(10);
			costTf.setBounds(100, 197, 116, 21);
		}
		return costTf;
	}
	private JTextField getBirthplaceTf() {
		if (birthplaceTf == null) {
			birthplaceTf = new JTextField();
			birthplaceTf.setFont(new Font("맑은 고딕", Font.BOLD, 12));
			birthplaceTf.setColumns(10);
			birthplaceTf.setBounds(100, 237, 116, 21);
		}
		return birthplaceTf;
	}
	//전체보기
	private JButton getBtnView() {
		if (btnView == null) {
			btnView = new JButton("전체보기");
			btnView.setBackground(new Color(255, 240, 245));
			btnView.setFont(new Font("맑은 고딕", Font.BOLD, 12));
			btnView.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					ta.setText("");
					ArrayList<Animal> arr = dao.animalView();
					for(Animal a : arr) {
						ta.append("종 :"+ a.getSpecies()+"\n");
						ta.append("나이 :"+ a.getAge()+"\n");
						ta.append("성별 :"+ a.getGender()+"\n");
						ta.append("이름 :"+ a.getId()+"\n");
						ta.append("입양비용 :"+ a.getCost()+"\n");
						ta.append("태어난곳 :"+ a.getBirthplace()+"\n");
						ta.append("번호 :"+ a.getNum()+"\n");											
						ta.append("\n");
					}
				}
			});
			btnView.setBounds(10, 300, 125, 50);
		}
		return btnView;
	}
	//동물등록
	private JButton getBtnInsert() {
		if (btnInsert == null) {
			btnInsert = new JButton("동물등록");
			btnInsert.setBackground(new Color(255, 240, 245));
			btnInsert.setFont(new Font("맑은 고딕", Font.BOLD, 12));
			btnInsert.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					Animal a = new Animal();
					
					a.setSpecies(speciesTf.getText());
					a.setAge(ageTf.getText());
					a.setGender(genderTf.getText());
					a.setId(idTf.getText());
					a.setCost(costTf.getText());
					a.setBirthplace(birthplaceTf.getText());
					
					dao.animalInsert(a);
					clearText();
					btnView.doClick();
				}

				
			});
			btnInsert.setBounds(141, 300, 125, 50);
		}
		return btnInsert;
	}
	//삭제하기
	private JButton getBtnDelete() {
		if (btnDelete == null) {
			btnDelete = new JButton("삭제하기");
			btnDelete.setBackground(new Color(255, 240, 245));
			btnDelete.setFont(new Font("맑은 고딕", Font.BOLD, 12));
			btnDelete.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					int num = Integer.parseInt(numTf.getText());
					dao.animalDelete(num);
					btnView.doClick();
					clearText();
				}
			});
			btnDelete.setBounds(141, 369, 125, 50);
		}
		return btnDelete;
	}
	//수정하기
	private JButton getBtnUpadate() {
		if (btnUpadate == null) {
			btnUpadate = new JButton("수정하기");
			btnUpadate.setBackground(new Color(255, 240, 245));
			btnUpadate.setFont(new Font("맑은 고딕", Font.BOLD, 12));
			btnUpadate.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					Animal a = new Animal();
					
					a.setNum(Integer.parseInt(numTf.getText()));
					a.setSpecies(speciesTf.getText());
					a.setAge(ageTf.getText());
					a.setGender(genderTf.getText());
					a.setId(idTf.getText());
					a.setCost(costTf.getText());
					a.setBirthplace(birthplaceTf.getText());
					
					dao.animalUpdate(a);
					clearText();
					btnView.doClick();
				}
			});
			btnUpadate.setBounds(10, 369, 125, 50);
		}
		return btnUpadate;
	}
	private JSplitPane getSplitPane_1() {
		if (splitPane_1 == null) {
			splitPane_1 = new JSplitPane();
			splitPane_1.setCursor(Cursor.getPredefinedCursor(Cursor.DEFAULT_CURSOR));
			splitPane_1.setOrientation(JSplitPane.VERTICAL_SPLIT);
			splitPane_1.setLeftComponent(getScrollPane());
			splitPane_1.setRightComponent(getPanel_1());
		}
		return splitPane_1;
	}
	private JLabel getNum() {
		if (num == null) {
			num = new JLabel("번호");
			num.setForeground(Color.WHITE);
			num.setFont(new Font("맑은 고딕", Font.BOLD, 12));
			num.setBounds(new Rectangle(10, 0, 20, 20));
			num.setBackground(Color.WHITE);
			num.setBounds(10, 441, 57, 15);
		}
		return num;
	}
	private JTextField getNumTf() {
		if (numTf == null) {
			numTf = new JTextField();
			numTf.setFont(new Font("맑은 고딕", Font.BOLD, 12));
			numTf.setEditable(false);
			numTf.setColumns(10);
			numTf.setBounds(100, 438, 116, 21);
		}
		return numTf;
	}
	private JScrollPane getScrollPane() {
		if (scrollPane == null) {
			scrollPane = new JScrollPane();
			scrollPane.setPreferredSize(new Dimension(400, 350));
			scrollPane.setAlignmentY(Component.BOTTOM_ALIGNMENT);
			scrollPane.setViewportView(getTa());
		}
		return scrollPane;
	}
	private JPanel getPanel_1() {
		if (panel_1 == null) {
			panel_1 = new JPanel();
			panel_1.setBackground(new Color(255, 160, 122));
			panel_1.setLayout(null);
			panel_1.add(getJcb());
			panel_1.add(getTfSearch());
			panel_1.add(getBtnSearch());
		}
		return panel_1;
	}
	private JLabel getId() {
		if (id == null) {
			id = new JLabel("이름");
			id.setForeground(Color.WHITE);
			id.setFont(new Font("맑은 고딕", Font.BOLD, 12));
			id.setBounds(new Rectangle(10, 0, 20, 20));
			id.setBackground(Color.WHITE);
			id.setBounds(10, 160, 57, 15);
		}
		return id;
	}
	private JTextArea getTa() {
		if (ta == null) {
			ta = new JTextArea();
			ta.setFont(new Font("맑은 고딕", Font.BOLD, 13));
			ta.addMouseListener(new MouseAdapter() {
				@Override
				public void mouseReleased(MouseEvent e) {
					try {
						int num = Integer.parseInt(ta.getSelectedText());
						Animal a = dao.animalDetail(num);
						
						numTf.setText(num+"");
						speciesTf.setText(a.getSpecies());
						ageTf.setText(a.getAge());
						genderTf.setText(a.getGender());
						idTf.setText(a.getId());
						costTf.setText(a.getCost());
						birthplaceTf.setText(a.getBirthplace());
						
					}catch (NullPointerException n) {
						JOptionPane.showMessageDialog(null, "번호를 선택하세요");
					}catch (NumberFormatException n2) {
						JOptionPane.showMessageDialog(null, "번호를 선택하세요");
					}
				}
			});
		}
		return ta;
	}
	private JComboBox getJcb() {
		if (jcb == null) {
			jcb = new JComboBox();
			jcb.setBackground(new Color(255, 127, 80));
			jcb.setFont(new Font("맑은 고딕", Font.BOLD, 12));
			jcb.setModel(new DefaultComboBoxModel(new String[] {"선택", "종", "태어난 곳"}));
			jcb.setBounds(12, 50, 80, 29);
		}
		return jcb;
	}
	private JTextField getTfSearch() {
		if (tfSearch == null) {
			tfSearch = new JTextField();
			tfSearch.setFont(new Font("맑은 고딕", Font.BOLD, 12));
			tfSearch.setBounds(104, 50, 216, 29);
			tfSearch.setColumns(10);
		}
		return tfSearch;
	}
	//검색
	private JButton getBtnSearch() {
		if (btnSearch == null) {
			btnSearch = new JButton("검색");
			btnSearch.setBackground(new Color(255, 127, 80));
			btnSearch.setFont(new Font("맑은 고딕", Font.BOLD, 12));
			btnSearch.addActionListener(new ActionListener() {
				public void actionPerformed(ActionEvent e) {
					ta.setText("");
					
					int idx = jcb.getSelectedIndex();
					String key = "";
					if(idx==1) {
						key = "species";
					}else if (idx==2) {
						key = "birthplace";
					}else {
						JOptionPane.showMessageDialog(null, "선택하세요");
						return;
					}
					ArrayList<Animal> arr = dao.animalSearch(key, tfSearch.getText());
					for(Animal a : arr) {
						ta.append("종: "+ a.getSpecies()+ "\n");
						ta.append("나이: "+ a.getAge()+ "\n");
						ta.append("성별: "+ a.getGender()+ "\n");
						ta.append("이름: "+ a.getId()+ "\n");
						ta.append("입양비용: "+ a.getCost()+ "\n");
						ta.append("태어난곳: "+ a.getBirthplace()+ "\n");
						ta.append("번호: "+a.getNum()+"\n");
						ta.append("\n");
						
					}
				}
			});
			btnSearch.setBounds(332, 50, 68, 29);
		}
		return btnSearch;
	}
	private void clearText() {
		speciesTf.setText("");
		ageTf.setText("");
		genderTf.setText("");
		idTf.setText("");
		costTf.setText("");
		birthplaceTf.setText("");	
		
	}	
}
