package swingtest;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintStream;
import java.io.StringWriter;

import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;

public class Memo extends JFrame{
	JTextArea ta;
	File f;
	public Memo(String title) {
		setTitle(title);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		JMenu mfile = new JMenu("파일");
		
		JMenuItem mOpen = new JMenuItem("열기");
		JMenuItem mNew = new JMenuItem("새파일");
		JMenuItem mSave = new JMenuItem("저장");
		JMenuItem mSaveAs = new JMenuItem("다른이름으로 저장");
		JMenuItem mExit = new JMenuItem("끝내기");
		mfile.add(mOpen);
		mfile.add(mNew);
		mfile.add(mSave);
		mfile.add(mSaveAs);
		mfile.addSeparator();
		mfile.add(mExit);
		
		JMenuBar mb = new JMenuBar();
		mb.add(mfile);
		setJMenuBar(mb);
		ta = new JTextArea();
		
		//JScrollPane jsp = new JScrollPane(ta); //밑에 두줄과 이 한줄은 같은 말
		JScrollPane jsp = new JScrollPane();
		jsp.setViewportView(ta);
		
		add(jsp);
		//새파일
		mNew.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				ta.setText("");
				setTitle("제목없음");
				
			}
		});
		//열기
		mOpen.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				JFileChooser fc = new JFileChooser();
				
				if(fc.showOpenDialog(Memo.this)==JFileChooser.CANCEL_OPTION)
					return;
				
				f = fc.getSelectedFile();//선택된 파일
				fileRead(f);
				setTitle(f.getName());
				
			}
		});
		//저장
		mSave.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				if(getTitle().equals("제목없음")) {
/*					
 					JFileChooser fc = new JFileChooser();
					fc.showSaveDialog(Memo.this);
					if(fc.showSaveDialog(Memo.this)==JFileChooser.CANCEL_OPTION)
						return;				
					f = fc.getSelectedFile();//선택된 파일
					setTitle(f.getName());
					fileSave(f);
*/
					mSaveAs.doClick(); //위에 /**/ 같음.
				}else {//기존파일이 있으면
					fileSave(f);
				}
				
			}
		});
		//다른이름으로 저장
		mSaveAs.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				JFileChooser fc = new JFileChooser();
				fc.showSaveDialog(Memo.this);
				if(fc.showSaveDialog(Memo.this)==JFileChooser.CANCEL_OPTION)
					return;				
				f = fc.getSelectedFile();//선택된 파일
				fileSave(f);
				setTitle(f.getName());
				
			}
		});
		//끝내기
		mExit.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				System.exit(0);
				
			}
		});
		setSize(500, 400);
		setVisible(true);

	}

	public static void main(String[] args) {
		new Memo("제목없음");

	}
	//파일 읽기 메소드
	private void fileRead(File f) {
		try {
			FileReader fr =new FileReader(f);
			StringWriter sw = new StringWriter();
			while(true){
				int ch= fr.read();
				if(ch==-1)break;
				sw.write(ch);				
			}
			ta.setText(sw.toString());
			sw.close();
			fr.close();
		}catch (FileNotFoundException e) {
			// TODO: handle exception
			e.printStackTrace();
		}catch (IOException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
	}
	//파일 저장 메소드
	private void fileSave(File f) {
		try {
			PrintStream ps = new PrintStream(f);
			ps.println(ta.getText());
			ps.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		
	}

}
