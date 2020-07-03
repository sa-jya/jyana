package com.zoo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.model.Friend;

public class AnimalDAOImpl implements AnimalDAO{
	
	String url, user, pwd;
	//생성자 -> db연결
	public AnimalDAOImpl() {		
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
	
	//동물등록
	public void animalInsert(Animal a) {
		Connection con  = null;
		PreparedStatement ps = null;
		try {
			String sql = "Insert into zoo values (zoo_seq.nextval, ?, ?, ?, ?, ?, ?)";			
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1,a.getSpecies());
			ps.setString(2,a.getAge());
			ps.setString(3,a.getGender());
			ps.setString(4,a.getId());
			ps.setString(5, a.getCost());
			ps.setString(6, a.getBirthplace());
			ps.executeUpdate();
			
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally {
			closeConnection(con, ps);
		}
		
	}
	//동물등록 닫기
	private void closeConnection(Connection con, PreparedStatement ps) {
		try {
			if(con!=null) con.close();
			if(ps!=null) ps.close();						
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	//전체보기
	public ArrayList<Animal> animalView() {

		Connection con = null;		
		Statement st = null;
		ResultSet rs = null;
		ArrayList<Animal> arr = new ArrayList<Animal>();
		
		try {
			con = DriverManager.getConnection(url, user, pwd);
			String sql = "select * from zoo order by num";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				Animal A =new Animal();
				A.setNum(rs.getInt("num"));
				A.setSpecies(rs.getString("species"));
				A.setAge(rs.getString("age"));
				A.setGender(rs.getString("gender"));
				A.setId(rs.getString("id"));
				A.setCost(rs.getString("cost"));
				A.setBirthplace(rs.getString("birthplace"));
				arr.add(A);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConnection(con, st, rs);
		}
		return arr;
	}
	//전체보기 닫기
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
	public Animal animalDetail(int num) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		Animal a =null;
		try {
			con = DriverManager.getConnection(url, user, pwd);
			String sql = "select * from zoo where num="+num;
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {
				a =new Animal();
				a.setNum(rs.getInt("num"));
				a.setSpecies(rs.getString("species"));
				a.setAge(rs.getString("age"));
				a.setGender(rs.getString("gender"));
				a.setId(rs.getString("id"));
				a.setCost(rs.getString("cost"));
				a.setBirthplace(rs.getString("birthplace"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConnection(con, st, rs);
		}
		return a;
	}

	//수정하기
	public void animalUpdate(Animal a) {
		Connection con  = null;
		PreparedStatement ps = null;
		try {
			String sql = "UPDATE zoo set species=?, age=?, gender=?, id=?, cost=?, birthplace=? WHERE num=?";
			con = DriverManager.getConnection(url, user,pwd);
			ps = con.prepareStatement(sql);
			
			ps.setString(1,a.getSpecies());
			ps.setString(2,a.getAge());
			ps.setString(3,a.getGender());
			ps.setString(4,a.getId());
			ps.setString(5, a.getCost());
			ps.setString(6, a.getBirthplace());
			ps.setInt(7, a.getNum());
			ps.executeUpdate();
			
		}catch (SQLException e) {			
			e.printStackTrace();
		}finally {
			closeConnection(con, ps);
		}
		
	}

	//삭제하기
	public void animalDelete(int num) {
		Connection con = null;
		Statement st = null;
		
		try {
			con = DriverManager.getConnection(url, user, pwd);
			String sql = "DELETE FROM zoo WhERE num="+num;
			st = con.createStatement();
			st.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConnection(con, st, null);
		}
		
	}

	//검색하기
	public ArrayList<Animal> animalSearch(String key, String word) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<Animal> arr = new ArrayList<Animal>();
		try {
			con = DriverManager.getConnection(url, user, pwd);
			st = con.createStatement();
			String sql = "select * from zoo where " + key + " like '%" + word + "%'";
			rs = st.executeQuery(sql);
			while(rs.next()) {
				Animal a = new Animal();
				a.setNum(rs.getInt("num"));
				a.setSpecies(rs.getString("species"));
				a.setAge(rs.getString("age"));
				a.setGender(rs.getString("gender"));
				a.setId(rs.getString("id"));
				a.setCost(rs.getString("cost"));
				a.setBirthplace(rs.getString("birthplace"));
				arr.add(a);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConnection(con, st, rs);
		}
		return arr;
	}

	

	
		
		
	

}
