package com.exam01;



import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.Scanner;
import java.util.StringTokenizer;



public class StudentManager {
	static Scanner sc = new Scanner(System.in);
	static ArrayList<Student> arr = new ArrayList<Student>();
	
	File file;
	File dir;
	
	public StudentManager() throws FileNotFoundException, IOException, ClassNotFoundException {
		dir = new File("src\\com\\exam01");
		file = new File(dir, "stu.txt");
		
		if(file.exists()) {
			ObjectInputStream ois =new ObjectInputStream(new FileInputStream(file));
			arr =(ArrayList<Student>) ois.readObject();
		}else {
			file.createNewFile();
		}
	}
	
	
	private static void showMenu() {
		System.out.println("선택하세요...");
		System.out.println("1. 데이터 입력");
		System.out.println("2. 전체보기");
		System.out.println("3. 학생 찾기");
		System.out.println("4. 저장/종료");
		System.out.println("선택>>");
		
	}
	
	private void inputData() {
		while(true) {
			System.out.println("학생 입력 이름, 학과, 학번, 학점평균");
			System.out.println(">>");
			String text = StudentManager.sc.nextLine();
			if(text.toLowerCase().equals("x")) {
				System.out.println("입력종료");
				break;
			}
			StringTokenizer st =new StringTokenizer(text, ",");
			String name =st.nextToken();
			String hakg =st.nextToken();
			String hakn =st.nextToken();
			double hakp =Double.parseDouble(st.nextToken());
			arr.add(new Student(name, hakg, hakn, hakp));
		}
		
	}
	
	private void viewData() {
		System.out.println("전체보기");
		for(Student s : arr) {
			if(s==null)break;
			System.out.println("이름:"+s.getName());
			System.out.println("학과:"+s.getHakg());
			System.out.println("학번:"+s.getHakn());
			System.out.println("학점평균:"+s.getHakp());
			System.out.println();
		}
		
	}
	private void searchData() {
		System.out.println("학생 찾기 이름 입력");
		String searchName = StudentManager.sc.next();
		Student s = search(searchName);
		
		if(s==null ) {
			System.out.println(("찾는 학생이 없습니다."));
			return;
		}
		System.out.println("이름:"+s.getName());
		System.out.println("학과:"+s.getHakg());
		System.out.println("학번:"+s.getHakn());
		System.out.println("학점평균:"+s.getHakp());
		System.out.println();
		
	}

	private Student search(String searchName) {
		for(int i=0;i<arr.size();i++) {
			if(searchName.equals(arr.get(i).getName())) {
				return arr.get(i);
			}				
		}
		return null;
		
	}
	

	private void saveData() throws IOException {
		ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream(file));
		oos.writeObject(arr);
		System.out.println("종료");
		System.exit(0);	
		
		
	}
	
	
	public static void main(String[] args) {
		StudentManager sm;
		try {
			sm = new StudentManager();
			while(true) {
				StudentManager.showMenu();
				int num = sc.nextInt();
				sc.nextLine();
				
				switch(num) {
				case 1: sm.inputData(); break;
				case 2: sm.viewData(); break;
				case 3: sm.searchData(); break;
				case 4: sm.saveData();
					System.out.println("프로그램 종료");
					System.exit(0);
				default : System.out.println("입력오류");
				}
				}
				
				} catch (FileNotFoundException e) {
					e.printStackTrace();
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}catch (InputMismatchException n) {
					System.out.println("1,2,3,4숫자 입력만/x는 종료");
				}
				
		
	}
}
	