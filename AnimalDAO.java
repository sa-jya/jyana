package com.zoo;

import java.util.ArrayList;

public interface AnimalDAO {
	//동물등록
	public void animalInsert(Animal a);
	//전체보기
	public ArrayList<Animal> animalView();
	//상세보기
	public Animal animalDetail(int num);
	//수정하기
	public void animalUpdate(Animal a);
	//삭제하기
	public void animalDelete(int num);
	//검색
	public ArrayList<Animal> animalSearch(String key, String word);
	
	
}
