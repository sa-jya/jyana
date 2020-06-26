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
	private List list; //awt안에 있는 list 사용
	private JCheckBox cb;
	public ListTest2() {
		setTitle("List 예제");
		setLayout(new BorderLayout());
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		JPanel p1 = new JPanel();
		tf = new JTextField(15);
		JButton btn = new JButton("추가");
		cb = new JCheckBox("다중선택");
		p1.add(tf);p1.add(btn);p1.add(cb);
		p1.setBackground(Color.black);
			
		JPanel p2 = new JPanel(new GridLayout(1,2));
		list = new List();
		ta = new JTextArea();
		p2.add(list);p2.add(ta);
		ActionH ah = new ActionH();
		itemH ih = new itemH();
		
		btn.addActionListener(ah);//연결
		tf.addActionListener(ah);
		list.addItemListener(ih);//연결
		cb.addItemListener(ih);//연결

		 
				
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
			if (obj==list) {//list가 이벤트 발생
				ta.setText("");
				if(list.isMultipleMode()) {//리스트가 다중선택
					String[]arr = list.getSelectedItems();
					for(int i =0; i<arr.length;i++) {
						ta.append(arr[i]+"\n");
					}
					
				}else { //리스트가 단일 선택
					//리스트(list)에서 선택한 내용을 taxtarea(ta)에서 출력
					ta.setText(list.getSelectedItem());	
				}
			}else if(obj==cb){//checkbox가 이벤트 발생
				if(cb.isSelected()) {//체크밗 선택 = 리스트 다중모드
					list.setMultipleMode(true);
				}else {//체크밗 해제 = 리스트 단일모드
					list.setMultipleMode(false);
				}
			}
			
		}
		
	}
	

}
