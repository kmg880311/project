package project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import project.driverdb.DriverDB;
import project.dto.Lt_list;

public class LivetubeDao {

		
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	

/////////////	로그인 세션 	/////////////////////////////////////////////////////////////////////////////////////////////	
	public ArrayList<Lt_list> Alllist() throws ClassNotFoundException{
		ArrayList<Lt_list> list = new ArrayList<Lt_list>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			DriverDB db = new DriverDB();
			conn = db.driverDbcon();
			String query = null;	
			query = "select	id, pw, nick, email, data from lt_list";
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				Lt_list lt = new Lt_list();
				lt.setId(rs.getString("id"));
				lt.setPw(rs.getString("pw"));
				lt.setNick(rs.getString("nick"));
				lt.setEmail(rs.getString("email"));
				lt.setData(rs.getString("data"));
				list.add(lt);
			}		
		
		} catch(SQLException ex) {
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}	
		return list;
	}
/////////////	회원 삭제	/////////////////////////////////////////////////////////////////////////////////////////////	
	public void listdelete(String id) throws ClassNotFoundException, SQLException{
		
		DriverDB db = new DriverDB();
		Connection conn = db.driverDbcon();
		PreparedStatement pstmt = null;
		try{
			pstmt =conn.prepareStatement(
					"DELETE FROM lt_list WHERE id=?"	);
			
			pstmt.setString(1, id);
				
			int i = pstmt.executeUpdate();
				System.out.println(i + "입려고학인");
		
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		
		}
	}
/////////////	회원 수정 처리	/////////////////////////////////////////////////////////////////////////////////////////////
	public void listupdatepro(Lt_list lt) throws ClassNotFoundException, SQLException{
			
		DriverDB db = new DriverDB();
		Connection conn = db.driverDbcon();
		PreparedStatement pstmt = null;
		try{
			pstmt =conn.prepareStatement(
					"UPDATE lt_list	SET	pw=?, nick=?, email=? WHERE id=?");
			pstmt.setString(1, lt.getPw());
			pstmt.setString(2, lt.getNick());
			pstmt.setString(3, lt.getEmail());
			pstmt.setString(4, lt.getId());
				System.out.println(lt.getNick() + "왜ㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐ");
				System.out.println(lt.getId() + "왜ㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐ");
			int i = pstmt.executeUpdate();
				System.out.println(i + "수정 처리 확인");
		
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		
		}
	}	
	
	
/////////////	회원 수정 화면 	/////////////////////////////////////////////////////////////////////////////////////////////
	public Lt_list listupdate(String id) throws ClassNotFoundException{
		Lt_list lt = new Lt_list();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			DriverDB db = new DriverDB();
			conn = db.driverDbcon();
			String query = null;	
			query = "select	id, pw, nick, email from lt_list where id=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				lt.setId(rs.getString("id"));
				lt.setPw(rs.getString("pw"));
				lt.setNick(rs.getString("nick"));
				lt.setEmail(rs.getString("email"));
				
			}		
		
		} catch(SQLException ex) {
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}	
		return lt;
	}
/////////////	로그인 세션 입력 메서드 	/////////////////////////////////////////////////////////////////////////////////////////////
		public Lt_list Ltsession(String id) throws ClassNotFoundException{
			Lt_list lt = new Lt_list();
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try{
				DriverDB db = new DriverDB();
				conn = db.driverDbcon();
				String query = null;	
				query = "select	id, nick from lt_list where id=?";
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					lt.setNick(rs.getString("nick"));
					lt.setId(rs.getString("id"));
				}		
			
			} catch(SQLException ex) {
				System.out.println(ex.getMessage());
				ex.printStackTrace();
			} finally {
				if (rs != null) try { rs.close(); } catch(SQLException ex) {}
				if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
				if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			}	
			return lt;
		}
	
	
/////////////	로그인 세션 	/////////////////////////////////////////////////////////////////////////////////////////////
	public int livetubeLogin(String id, String pw) throws ClassNotFoundException{
		
		int login = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			DriverDB db = new DriverDB();
			conn = db.driverDbcon();
			String query = null;	
			query = "select	id, pw, nick, email from lt_list where id=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				System.out.println("아이디일치");
				String dbid = rs.getString("id");
				String dbpw = rs.getString("pw");
				String dblevel = rs.getString("nick");
				String dbname = rs.getString("email");
			
				if(pw.equals(dbpw)){
					System.out.println("로그인성공");
					login = 1;
								
				}else if(id.equals(dbid) & !pw.equals(dbpw)){
					System.out.println("비번불일치");
					login = 2;
				}
					
			}else{
				System.out.println("아이디불일치");
					
			}		
				System.out.println(login + "리턴값");
		
		} catch(SQLException ex) {
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}	
		return login;
	}	

	
	
	/////////////	회원가입	/////////////////////////////////////////////////////////////////////////////////////////////
		public void listinsert(Lt_list lt) throws ClassNotFoundException, SQLException{
				System.out.println(lt + "dao 매서드 입력");
			DriverDB db = new DriverDB();
			Connection conn = db.driverDbcon();
			PreparedStatement pstmt = null;
			try{
				pstmt =conn.prepareStatement(
						"INSERT INTO lt_list VALUES (?, ?, ?, ?, now())"	);
				
				pstmt.setString(1, lt.getId());
				pstmt.setString(2, lt.getPw());
				pstmt.setString(3, lt.getNick());
				pstmt.setString(4, lt.getEmail());
				
			
				int i = pstmt.executeUpdate();
					System.out.println(i + "입려고학인");
			
			} finally {
				if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
				if (conn != null) try { conn.close(); } catch(SQLException ex) {}
			
			}
		}
}
