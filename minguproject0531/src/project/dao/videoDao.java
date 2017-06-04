package project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import project.driverdb.DriverDB;
import project.dto.Lt_list;
import project.dto.video;

public class videoDao {

	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	
/////////////	영상 등록 하기	/////////////////////////////////////////////////////////////////////////////////////////////
	public void videoinsert(video vi) throws ClassNotFoundException, SQLException{
			
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PreparedStatement pstmt2 = null;
		
		try{
			DriverDB db = new DriverDB();
			conn = db.driverDbcon();
			pstmt = conn.prepareStatement("select max(CAST(substring(live,6) AS DECIMAL)) from lt_video");
			rs = pstmt.executeQuery();
			
			int result = 0;
			String live_temp = "live_";
			String live = "live_1";
				
			if(rs.next()){
				result = rs.getInt(1);
				result = result + 1;
			}
			live = live_temp + result; 	
				System.out.println(live+"----------------");
				System.out.println(vi.getY_ct() +"dsadfsadfasdfsdfsfd");
			pstmt2 = conn.prepareStatement("INSERT INTO lt_video VALUES (?,?,?,?,?,?,?,?,?,now(),DEFAULT,DEFAULT,DEFAULT)");
			pstmt2.setString(1, live);
			pstmt2.setString(2, vi.getY_id());
			pstmt2.setString(3, vi.getY_title());
			pstmt2.setString(4, vi.getY_name());
			pstmt2.setString(5, vi.getY_comment());
			pstmt2.setString(6, vi.getY_code());
			pstmt2.setString(7, vi.getY_style());
			pstmt2.setString(8, vi.getY_ct());
			pstmt2.setString(9, vi.getY_cu());
			
			
			int as = pstmt2.executeUpdate();
				System.out.println(as + "<---쿼리완료확인");
			
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		
	}

}
