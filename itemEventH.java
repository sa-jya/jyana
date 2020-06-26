package swingtest;

import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;

import javax.swing.JCheckBox;
import javax.swing.JTextArea;

public class itemEventH implements ItemListener{
	JTextArea ta;
	public itemEventH(JTextArea ta) {
		this.ta =ta;
	}
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
