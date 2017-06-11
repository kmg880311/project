package project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import project.driverdb.DriverDB;
import project.dto.YsingoDto;

public class YsingoDao {

/////////////	영상 신고 갯수	/////////////////////////////////////////////////////////////////////////////////////////////	
	public YsingoDto singonum(String aaa) throws ClassNotFoundException{
		YsingoDto yg = new YsingoDto();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			DriverDB db = new DriverDB();
			conn = db.driverDbcon();
			String query = null;	
			query = "select count(ysingo) ysingo from lt_ysingo where ys_code=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, aaa);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				yg.setYsingo(rs.getString("ysingo"));
				
			}		
		
		} catch(SQLException ex) {
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}	
		return yg;
	}	

/////////////	신고 버튼 누르고 영상내용유지	/////////////////////////////////////////////////////////////////////////////////////////////	
	public YsingoDto singonew(String aaa) throws ClassNotFoundException{
		YsingoDto ys = new YsingoDto();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			DriverDB db = new DriverDB();
			conn = db.driverDbcon();
			String query = null;	
			query = "select	* from lt_ysingo where ys_code=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, aaa);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				ys.setYsingo(rs.getString("ysingo"));
				ys.setYs_code(rs.getString("ys_code"));
				ys.setYs_id(rs.getString("ys_id"));
				ys.setYs_data(rs.getString("ys_data"));
			}		
		
		} catch(SQLException ex) {
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}	
		return ys;
	}	

/////////////	영상 신고	/////////////////////////////////////////////////////////////////////////////////////////////
	public void singoinsert(String ys, String id) throws ClassNotFoundException, SQLException{
		YsingoDto y = new YsingoDto();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		
		try{
			DriverDB db = new DriverDB();
			conn = db.driverDbcon();
			pstmt3 = conn.prepareStatement("select * from lt_ysingo where ys_code=?");
			pstmt3.setString(1, ys);
				System.out.println(ys + " 666666666666666666666666666666666666666666666666666666666");
			rs2 = pstmt3.executeQuery();
			
			while(rs2.next()){
				
				y.setYs_id(rs2.getString("ys_id"));
				
			}
				if(!id.equals(y.getYs_id())){
					System.out.println(y.getYs_id() + " 55555555555555555555555555555555555555555555555555555");
					System.out.println(id + " 555555555555555555555555555555555555555555555555555");
					
					System.out.println("좋아요 누른적 없어서 카운트 1 증가");
					pstmt = conn.prepareStatement("select max(CAST(substring(ysingo,8) AS DECIMAL)) from lt_ysingo");
					rs = pstmt.executeQuery();
					
					int result = 0;
					String ysingo_temp = "ysingo_";
					String ysingo = "ysingo_1";
						
					if(rs.next()){
						result = rs.getInt(1);
						result = result + 1;
					}
					ysingo = ysingo_temp + result; 	
						System.out.println(ysingo+"----------------");
						
					pstmt2 = conn.prepareStatement("INSERT INTO lt_ysingo VALUES (?,?,?,now())");
					pstmt2.setString(1, ysingo);
					pstmt2.setString(2, ys);
					pstmt2.setString(3, id);
				
				
					int as = pstmt2.executeUpdate();
						System.out.println(as + "<---쿼리완료확인");
					
				}else if(id.equals(y.getYs_id())){
					
					System.out.println("좋아요 누른적 있어서 카운트 1 감소");
					pstmt2 = conn.prepareStatement("DELETE FROM lt_ysingo WHERE (ys_id=?) and ys_code=?");
					
					pstmt2.setString(1, id);
					pstmt2.setString(2, ys);
					int as = pstmt2.executeUpdate();
					
					
				}else{
					System.out.println("좋아요 DAO 예외");
				}
			
			
			
			
			
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		
	}
}
