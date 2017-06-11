package project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import project.driverdb.DriverDB;
import project.dto.CgoodDto;
import project.dto.YgoodDto;

public class CgoodDao {

/////////////	좋아요 버튼 누르고 영상내용유지	/////////////////////////////////////////////////////////////////////////////////////////////	
	public CgoodDto commnetgoodnew(String aaa) throws ClassNotFoundException{
		CgoodDto cg = new CgoodDto();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			DriverDB db = new DriverDB();
			conn = db.driverDbcon();
			String query = null;	
			query = "select	* from lt_cgood where cg_code=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, aaa);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				cg.setCgood(rs.getString("cgood"));
				cg.setCg_code(rs.getString("cg_code"));
				cg.setCg_id(rs.getString("cg_id"));
				cg.setCg_data(rs.getString("cg_data"));
				//cg.setY_code(rs.getString("live"));
			}		
		
		} catch(SQLException ex) {
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}	
		return cg;
	}	
	
/////////////	댓글좋아요 입력	/////////////////////////////////////////////////////////////////////////////////////////////
	public void commentgoodinsert(String cg, String id) throws ClassNotFoundException, SQLException{
		CgoodDto c = new CgoodDto();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		
		PreparedStatement pstmt4 = null;
		PreparedStatement pstmt5 = null;
		
		try{
			DriverDB db = new DriverDB();
			conn = db.driverDbcon();
			
			
			pstmt3 = conn.prepareStatement("select * from lt_cgood where cg_code=?");
			
			pstmt3.setString(1, cg);
				System.out.println(cg);
			rs2 = pstmt3.executeQuery();
			
			while(rs2.next()){
				
				c.setCg_id(rs2.getString("cg_id"));
				
			}
				if(!id.equals(c.getCg_id())){
					System.out.println(c.getCg_id() + " 55555555555555555555555555555555555555555555555555555");
					System.out.println(id + " 555555555555555555555555555555555555555555555555555");
					
					System.out.println("좋아요 누른적 없어서 카운트 1 증가");
					pstmt = conn.prepareStatement("select max(CAST(substring(cgood,7) AS DECIMAL)) from lt_cgood");
					rs = pstmt.executeQuery();
					
					int result = 0;
					String cgood_temp = "cgood_";
					String cgood = "cgood_1";
						
					if(rs.next()){
						result = rs.getInt(1);
						result = result + 1;
					}
					cgood = cgood_temp + result; 	
						System.out.println(cgood+"----------------");
						
					pstmt2 = conn.prepareStatement("INSERT INTO lt_cgood VALUES (?,?,?,now())");
					pstmt2.setString(1, cgood);
					pstmt2.setString(2, cg);
					pstmt2.setString(3, id);
				
				
					int as = pstmt2.executeUpdate();
						System.out.println(as + "<---쿼리완료확인");
		///////////////////////////////////////////////////////////////			
					pstmt4 = conn.prepareStatement("select count(cgood) cgood from lt_cgood where cg_code=?");
					pstmt4.setString(1, cg);
					rs = pstmt4.executeQuery();
					
					int a = 0;
					while(rs.next()){
						a = rs.getInt("cgood");
							System.out.println(a + "asldkfjalksdfjaskldfjalskdjfaklsdjflksdjflksdjflksdjflksdjflksdflksdfjalksd");
					}		
				
					//pstmt5 = conn.prepareStatement(sql)
				
		////////////////////////////////////////////////////////////////////		
				}else if(id.equals(c.getCg_id())){
					
					System.out.println("좋아요 누른적 있어서 카운트 1 감소");
					pstmt2 = conn.prepareStatement("DELETE FROM lt_cgood WHERE (cg_id=?) and cg_code=?");
					
					pstmt2.setString(1, id);
					pstmt2.setString(2, cg);
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
