package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


public class FriendDAOImpl implements FriendDAO{
	String url, user, pwd;
	//생성자 -> db연결
	public FriendDAOImpl() {		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			url = "jdbc:oracle:thin:@localhost:1521:xe";
			user = "scott";
			pwd = "1234";			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//추가
	public void friendInsert(Friend f) {		
		Connection con  = null;
		PreparedStatement ps = null;
		try {
			String sql = "Insert into Friend values (Friend_seq.nextval, ?, ?, ?, ?)";			
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1,f.getName());
			ps.setString(2,f.getBirth());
			ps.setString(3,f.getPhone());
			ps.setString(4,f.getAddr());
			ps.executeUpdate();
			
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally {
			closeConnection(con, ps);
		}
	}
	//추가 닫기
	private void closeConnection(Connection con, PreparedStatement ps) {
		try {
			if(con!=null) con.close();
			if(ps!=null) ps.close();						
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	//보기
	public ArrayList<Friend> friendView() {
		
		Connection con = null;		
		Statement st = null;
		ResultSet rs = null;
		ArrayList<Friend> arr = new ArrayList<Friend>();
		
		try {
			con = DriverManager.getConnection(url, user, pwd);
			String sql = "select * from Friend order by num";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				Friend f =new Friend();
				f.setNum(rs.getInt("num"));
				f.setName(rs.getString("name"));
				f.setBirth(rs.getString("birth"));
				f.setPhone(rs.getString("phone"));
				f.setAddr(rs.getString("addr"));				
				arr.add(f);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConnection(con, st, rs);
		}
		return arr;
	}
	//닫기 보기
	private void closeConnection(Connection con, Statement st, ResultSet rs) {
		try {
			if(con!=null) con.close();
			if(st!=null) st.close();
			if(rs!=null) rs.close();			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	//상세보기
	public Friend friendDetail(int num) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		Friend f = null;
		try {
			con = DriverManager.getConnection(url, user, pwd);
			String sql = "select * from Friend where num="+num;
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {
				f =new Friend();
				f.setNum(rs.getInt("num"));
				f.setName(rs.getString("name"));
				f.setBirth(rs.getString("birth"));
				f.setPhone(rs.getString("phone"));
				f.setAddr(rs.getString("addr"));				
								
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConnection(con, st, rs);
		}return f;
	}

	//수정하기
	public void friendUpadate(Friend f) {
		
		Connection con  = null;
		PreparedStatement ps = null;
		try {
			String sql = "UPDATE Friend SET name=?, birth=?, phone=?, addr=? WHERE num=?";		
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			
			ps.setString(1,f.getName());
			ps.setString(2,f.getBirth());
			ps.setString(3,f.getPhone());
			ps.setString(4,f.getAddr());
			ps.setInt(5,f.getNum());
			ps.executeUpdate();
			
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally {
			closeConnection(con, ps);
		}
		
	}

	//삭제하기
	public void friendDelete(int num) {
		Connection con =null;
		Statement st = null;
		
		try {
			con = DriverManager.getConnection(url, user, pwd);
			String sql = "DELETE from Friend WHERE num ="+ num;
			st = con.createStatement();
			st.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConnection(con, st, null);
		}
	}

	//검색하기
	public ArrayList<Friend> friendSearch(String key, String word) {
		
		Connection con =null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<Friend> arr = new ArrayList<Friend>();
		try {
			con =DriverManager.getConnection(url, user, pwd);
			st = con.createStatement();
			String sql = "select * from Friend where " + key + " like '%" + word +"%'";
			rs =st.executeQuery(sql);
			while(rs.next()) {
				Friend f =new Friend();
				f.setNum(rs.getInt("num"));
				f.setName(rs.getString("name"));
				f.setBirth(rs.getString("birth"));
				f.setPhone(rs.getString("phone"));
				f.setAddr(rs.getString("addr"));
				arr.add(f);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConnection(con, st, rs);
		}return arr;
	}

}
