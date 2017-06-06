package project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import project.driverdb.DriverDB;
import project.dto.*;

public class CommentDao {
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	
/////////////	댓글입력후 영상네임유지	/////////////////////////////////////////////////////////////////////////////////////////////	
	   public Comment commnetnew(String aaa) throws ClassNotFoundException{
		Comment ct = new Comment();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			DriverDB db = new DriverDB();
			conn = db.driverDbcon();
			String query = null;	
			query = "select	* from lt_comment where c_live=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, aaa);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				ct.setComment(rs.getString("comment"));
				ct.setC_live(rs.getString("c_live"));
				ct.setC_id(rs.getString("c_id"));
				ct.setC_ct(rs.getString("c_ct"));
				ct.setC_good(rs.getString("c_good"));
				ct.setC_sin(rs.getString("c_sin"));
				ct.setC_data(rs.getString("c_data"));
				
				
				
			}		
		
		} catch(SQLException ex) {
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}	
		return ct;
	}	
	
	
/////////////	댓글 리스트 	/////////////////////////////////////////////////////////////////////////////////////////////	
	public ArrayList<Comment> commentlist(String aaa) throws ClassNotFoundException{
		ArrayList<Comment> comment = new ArrayList<Comment>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			DriverDB db = new DriverDB();
			conn = db.driverDbcon();
			String query = null;	
			query = "select	* from lt_comment where c_live=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, aaa);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				Comment ct = new Comment();
				ct.setComment(rs.getString("comment"));
				ct.setC_live(rs.getString("c_live"));
				ct.setC_id(rs.getString("c_id"));
				ct.setC_ct(rs.getString("c_ct"));
				ct.setC_good(rs.getString("c_good"));
				ct.setC_sin(rs.getString("c_sin"));
				ct.setC_data(rs.getString("c_data"));
				comment.add(ct);
				
				
			}		
		
		} catch(SQLException ex) {
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}	
		return comment;
	}	
	
/////////////	댓글 등록 하기	/////////////////////////////////////////////////////////////////////////////////////////////
	public void commentinsert(Comment ct) throws ClassNotFoundException, SQLException{
			
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PreparedStatement pstmt2 = null;
		
		try{
			DriverDB db = new DriverDB();
			conn = db.driverDbcon();
			pstmt = conn.prepareStatement("select max(CAST(substring(comment,9) AS DECIMAL)) from lt_comment");
			rs = pstmt.executeQuery();
			
			int result = 0;
			String commnet_temp = "comment_";
			String commnet = "comment_1";
				
			if(rs.next()){
				result = rs.getInt(1);
				result = result + 1;
			}
			commnet = commnet_temp + result; 	
				System.out.println(commnet+"----------------");
				
			pstmt2 = conn.prepareStatement("INSERT INTO lt_comment VALUES (?,?,?,?,DEFAULT,DEFAULT,now())");
			pstmt2.setString(1, commnet);
			pstmt2.setString(2, ct.getC_live());
			pstmt2.setString(3, ct.getC_id());
			pstmt2.setString(4, ct.getC_ct());
				System.out.println(pstmt2+ "<---<<");
			
			
			
			int as = pstmt2.executeUpdate();
				System.out.println(as + "<---쿼리완료확인");
			
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		
	}
}
