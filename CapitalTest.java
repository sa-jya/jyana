package com.exam02;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Scanner;
import java.util.Set;

public class CapitalTest {
	File file;
	File dir;
	
	public static Scanner sc = new Scanner(System.in);
	private HashMap<String, String> map = new HashMap<String, String>();
	
	public CapitalTest() throws IOException  {
		map.put("한국", "서울");
		map.put("일본", "도쿄");
		map.put("중국", "베이징");
				
		dir = new File("src\\com\\exam02");
		file = new File(dir, "Cat.txt");
		if(file.exists()) {
			Scanner scanner =new Scanner(file);
			while(scanner.hasNext()) {
				String republic = scanner.next();
				String Capital = scanner.next();
				map.put(republic, Capital);
			}
			scanner.close();
		}else {
			file.createNewFile();
		}
	}
	
	public static void main(String[] args) throws FileNotFoundException, IOException {
		CapitalTest ct = new CapitalTest();
		while(true) {
			CapitalTest.showMenu();
			int choice = sc.nextInt();
			switch(choice) {
			case 1 : ct.input(); break;
			case 2 : ct.test(); break;
			case 3 : ct.saveData();
				System.out.println("파일 저장 및 종료");
			 	System.exit(0);
			default : System.out.println("입력오류");
			}
		}

	}

	private void saveData() {
			FileWriter fw;
			try {
				fw = new FileWriter(file);
				Set<String> set =map.keySet();
				Iterator<String> it = set.iterator();
				while(it.hasNext()) {
					String key = it.next();
					String value = map.get(key);
					fw.write(key+" ");
					fw.write(value+"\n");
				}
				fw.close();	
				System.out.println("종료");
				System.exit(0);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("파일저장 오류");
			}
			
			
	}

	private void test() {
		Set<String> set = map.keySet();
		Object [] arr = set.toArray();
		while(true) {
			int n = (int)(Math.random()*map.size());
			String republic = (String) arr[n];
			String Capital = map.get(republic);
			System.out.println(republic+"의 수도는? 종료는 x>>");
			String answer = sc.next();
			if(answer.toUpperCase().equals("X"))break;
			if(answer.equals(Capital)) {
				System.out.println("정답");
			}else {
				System.out.println("오답");
			}
		}
		
	}

	private void input() {
		System.out.println("현재"+map.size()+"개 나라와 수도 입력");
		while(true) {
			System.out.println("나라와 수도 입력/종료는 x>>");
			String cont = sc.next();
			if(cont.toUpperCase().equals("X"))break;
			if(map.containsKey(cont)) {
				System.out.println("이미 입력한 나라입니다.");
				continue;
			}
			String sudo = sc.next();
			map.put(cont, sudo);
		}
	}

	private static void showMenu() {
		System.out.println("****수도맞추기 게임을 시작합니다. ****");
		System.out.println("1. 입력, 2. 퀴즈, 3. 파일저장 및 종료");
	}

}
