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
		map.put("�ѱ�", "����");
		map.put("�Ϻ�", "����");
		map.put("�߱�", "����¡");
				
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
				System.out.println("���� ���� �� ����");
			 	System.exit(0);
			default : System.out.println("�Է¿���");
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
				System.out.println("����");
				System.exit(0);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("�������� ����");
			}
			
			
	}

	private void test() {
		Set<String> set = map.keySet();
		Object [] arr = set.toArray();
		while(true) {
			int n = (int)(Math.random()*map.size());
			String republic = (String) arr[n];
			String Capital = map.get(republic);
			System.out.println(republic+"�� ������? ����� x>>");
			String answer = sc.next();
			if(answer.toUpperCase().equals("X"))break;
			if(answer.equals(Capital)) {
				System.out.println("����");
			}else {
				System.out.println("����");
			}
		}
		
	}

	private void input() {
		System.out.println("����"+map.size()+"�� ����� ���� �Է�");
		while(true) {
			System.out.println("����� ���� �Է�/����� x>>");
			String cont = sc.next();
			if(cont.toUpperCase().equals("X"))break;
			if(map.containsKey(cont)) {
				System.out.println("�̹� �Է��� �����Դϴ�.");
				continue;
			}
			String sudo = sc.next();
			map.put(cont, sudo);
		}
	}

	private static void showMenu() {
		System.out.println("****�������߱� ������ �����մϴ�. ****");
		System.out.println("1. �Է�, 2. ����, 3. �������� �� ����");
	}

}
