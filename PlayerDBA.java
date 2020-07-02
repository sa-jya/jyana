package swingtest;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.swing.JOptionPane;
import javax.swing.JTextField;

public class PlayerDBA {
	String url, user, pwd;
	//DB����	
	public PlayerDBA() {
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
	//�߰�
	public void playerInsert(Player p) {
		Connection con = null;		
		PreparedStatement ps = null;	
		
		ArrayList<Player> arr = new ArrayList<Player>();		
		
		try {
			String sql ="Insert into player values(player_seq.nextval,?,?,?,?,?)";
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1,p.getName());
			ps.setString(2,p.getBirth());
			ps.setDouble(3,p.getHeight());
			ps.setDouble(4,p.getWeight());
			ps.setString(5,p.getKind());
			ps.executeUpdate();
						
			}catch (SQLException e1) {
				e1.printStackTrace();
			}finally {
				closeConnection(con, ps);
			}
	}
	//�󼼺���
	public Player playerDetail(int num) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		Player p = null;
		
		try {
			con = DriverManager.getConnection(url, user, pwd);
			String sql = "select * from player where num="+num;
			st = con.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()) {
				p =new Player();
				p.setNum(rs.getInt("num"));
				p.setName(rs.getString("name"));
				p.setBirth(rs.getString("birth"));
				p.setHeight(rs.getDouble("height"));
				p.setWeight(rs.getDouble("weight"));				
				p.setKind(rs.getString("kind"));				
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConnection(con, st, rs);
		}return p;
		
	}
	
	
	
	//����
	public ArrayList<Player> playerView() {
		Connection con = null;		
		Statement st = null;
		ResultSet rs = null;
		ArrayList<Player> arr = new ArrayList<Player>();
		
		try {
			con = DriverManager.getConnection(url, user, pwd);
			String sql = "select * from player order by num";
			st = con.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()) {
				Player p =new Player();
				p.setNum(rs.getInt("num"));
				p.setName(rs.getString("name"));
				p.setBirth(rs.getString("birth"));
				p.setHeight(rs.getDouble("height"));
				p.setWeight(rs.getDouble("weight"));				
				p.setKind(rs.getString("kind"));
				arr.add(p);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConnection(con, st, rs);
		}
		return arr;
	
	}
	//����
	public void playerUpadate(Player p) {
		Connection con = null;
		PreparedStatement ps = null;					
	 				
		try {
			String sql ="UPDATE Player SET name=?, birth=?, height=?, weight=?, kind=? where num=?";
			con = DriverManager.getConnection(url, user, pwd);			
			ps = con.prepareStatement(sql);
			ps.setString(1,p.getName());
			ps.setString(2,p.getBirth());
			ps.setDouble(3,p.getHeight());
			ps.setDouble(4,p.getWeight());
			ps.setString(5,p.getKind());
			ps.setInt(6,p.getNum());
			ps.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConnection(con, ps);
		}
		
	}
	//����
	public void playerDelete(int num) {
		Connection con =null;
		Statement st = null;
		try {
			con = DriverManager.getConnection(url, user, pwd);
			String sql ="DELETE FROM Player WHERE num ="+num;
			st = con.createStatement();
			st.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConnection(con, st, null);
		}
	}
	//�˻�
	public  ArrayList<Player> playerSearch(String key, String word) {
		Connection con =null;
		Statement st = null;
		ResultSet rs = null;
		ArrayList<Player> arr = new ArrayList<Player>();
		try {
			con =DriverManager.getConnection(url, user, pwd);
			st = con.createStatement();
			String sql = "select * from player where " + key + " like '%" + word +"%'";
			rs =st.executeQuery(sql);
			while(rs.next()) {
				Player p =new Player();
				p.setNum(rs.getInt("num"));
				p.setName(rs.getString("name"));
				p.setBirth(rs.getString("birth"));
				p.setHeight(rs.getDouble("height"));
				p.setWeight(rs.getDouble("weight"));				
				p.setKind(rs.getString("kind"));
				arr.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConnection(con, st, rs);
		}return arr;
	}
	//�ݱ�
	public void closeConnection(Connection con, Statement st, ResultSet rs) {
		try {
			if(con!=null) con.close();
			if(st!=null) st.close();
			if(rs!=null) rs.close();			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	//�ݱ�2
		public void closeConnection(Connection con, PreparedStatement ps) {
			try {
				if(con!=null) con.close();
				if(ps!=null) ps.close();						
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
}
