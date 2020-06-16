package com.exam01;

import java.io.Serializable;

public class Student implements Serializable{
	private String name;
	private String hakg;
	private String hakn;
	private double hakp;
	public Student() {
		
	}
	public Student(String name, String hakg, String hakn, double hakp) {
		this.name = name;
		this.hakg = hakg;
		this.hakn = hakn;
		this.hakp = hakp;
		
	}
	
	public String getName() {
		return name;
	}
	public String getHakg() {
		return hakg;
	}
	public String getHakn() {
		return hakn;
	}
	public double getHakp() {
		return hakp;
	}
	

}
