package com.model;


import java.util.ArrayList;

public interface FriendDAO {
	//친구등록
	public void friendInsert(Friend f);
		
	//전체보기
	public ArrayList<Friend> friendView();
	//상세보기
	public  Friend friendDetail(int num);
	//수정하기
	public void friendUpadate(Friend f);
	//삭제하기
	public void friendDelete(int num);
	//검색
	public ArrayList<Friend> friendSearch(String key, String word);
}
