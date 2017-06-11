package project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import project.driverdb.DriverDB;
import project.dto.Comment;
import project.dto.YgoodDto;

public class YgoodDao {
	
/////////////	영상 좋아요 갯수	/////////////////////////////////////////////////////////////////////////////////////////////	
	public YgoodDto goodnum(String aaa) throws ClassNotFoundException{
		YgoodDto yg = new YgoodDto();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			DriverDB db = new DriverDB();
			conn = db.driverDbcon();
			String query = null;	
			query = "select count(ygood) ygood from lt_ygood where yg_code=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, aaa);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				yg.setYgood(rs.getString("ygood"));
				
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
	
/////////////	좋아요 버튼 누르고 영상내용유지	/////////////////////////////////////////////////////////////////////////////////////////////	
	public YgoodDto goodnew(String aaa) throws ClassNotFoundException{
		YgoodDto yg = new YgoodDto();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			DriverDB db = new DriverDB();
			conn = db.driverDbcon();
			String query = null;	
			query = "select	* from lt_ygood where yg_code=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, aaa);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				yg.setYgood(rs.getString("ygood"));
				yg.setYg_code(rs.getString("yg_code"));
				yg.setYg_id(rs.getString("yg_id"));
				yg.setYg_data(rs.getString("yg_data"));
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
	
/////////////	영상 좋아요	/////////////////////////////////////////////////////////////////////////////////////////////
	public void goodinsert(String yg, String id) throws ClassNotFoundException, SQLException{
		YgoodDto y = new YgoodDto();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		
		try{
			DriverDB db = new DriverDB();
			conn = db.driverDbcon();
			
			
			pstmt3 = conn.prepareStatement("select * from lt_ygood where yg_code=?");
			
			pstmt3.setString(1, yg);
				System.out.println(yg + " 666666666666666666666666666666666666666666666666666666666");
			rs2 = pstmt3.executeQuery();
			
			while(rs2.next()){
				
				y.setYg_id(rs2.getString("yg_id"));
				
			}
				if(!id.equals(y.getYg_id())){
					System.out.println(y.getYg_id() + " 55555555555555555555555555555555555555555555555555555");
					System.out.println(id + " 555555555555555555555555555555555555555555555555555");
					
					System.out.println("좋아요 누른적 없어서 카운트 1 증가");
					pstmt = conn.prepareStatement("select max(CAST(substring(ygood,7) AS DECIMAL)) from lt_ygood");
					rs = pstmt.executeQuery();
					
					int result = 0;
					String ygood_temp = "ygood_";
					String ygood = "ygood_1";
						
					if(rs.next()){
						result = rs.getInt(1);
						result = result + 1;
					}
					ygood = ygood_temp + result; 	
						System.out.println(ygood+"----------------");
						
					pstmt2 = conn.prepareStatement("INSERT INTO lt_ygood VALUES (?,?,?,now())");
					pstmt2.setString(1, ygood);
					pstmt2.setString(2, yg);
					pstmt2.setString(3, id);
				
				
					int as = pstmt2.executeUpdate();
						System.out.println(as + "<---쿼리완료확인");
					
				}else if(id.equals(y.getYg_id())){
					
					System.out.println("좋아요 누른적 있어서 카운트 1 감소");
					pstmt2 = conn.prepareStatement("DELETE FROM lt_ygood WHERE (yg_id=?) and yg_code=?");
					
					pstmt2.setString(1, id);
					pstmt2.setString(2, yg);
					int as = pstmt2.executeUpdate();
					
					//y.setYg_code(yg);
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
