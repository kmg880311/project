package project.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import project.driverdb.DriverDB;
import project.dto.Lt_list;
import project.dto.video;

public class videoDao {

	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
/////////////	해당 영상 보기 	/////////////////////////////////////////////////////////////////////////////////////////////	
	public video watchvideo(String live) throws ClassNotFoundException{
		video vi = new video();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			DriverDB db = new DriverDB();
			conn = db.driverDbcon();
			String query = null;	
			query = "select	* from lt_video where live=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, live);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
			vi.setY_code(rs.getString("y_code"));
			vi.setLive(live);
				
			}
		
		} catch(SQLException ex) {
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}	
		return vi;
	}	

	
/////////////	썸네일 리스트 	/////////////////////////////////////////////////////////////////////////////////////////////	
	public ArrayList<video> thumbnailvideo() throws ClassNotFoundException{
		ArrayList<video> video = new ArrayList<video>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			DriverDB db = new DriverDB();
			conn = db.driverDbcon();
			String query = null;	
			query = "SELECT substr(y_code, 33) FROM lt_video";
			
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				video vi = new video();
				
				vi.setY_thumbnail(rs.getString("y_code"));
					System.out.println(rs.getString("y_code")+"23452345324523452354");
				video.add(vi);
				
				
			}		
		
		} catch(SQLException ex) {
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}	
		return video;
	}		
	
	
/////////////	영상 전체 리스트 	/////////////////////////////////////////////////////////////////////////////////////////////	
	public ArrayList<video> Allvideo() throws ClassNotFoundException{
		ArrayList<video> video = new ArrayList<video>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			DriverDB db = new DriverDB();
			conn = db.driverDbcon();
			String query = null;	
			query = "select	* from lt_video";
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				video vi = new video();
				vi.setLive(rs.getString("live"));
				vi.setY_id(rs.getString("y_id"));
				vi.setY_title(rs.getString("y_title"));
				vi.setY_name(rs.getString("y_name"));
				vi.setY_comment(rs.getString("y_comment"));
				vi.setY_code(rs.getString("y_code"));
				vi.setY_style(rs.getString("y_style"));
				vi.setY_ct(rs.getString("y_ct"));
				vi.setY_cu(rs.getString("y_cu"));
				vi.setY_data(rs.getString("y_data"));
				vi.setY_cl(rs.getString("y_cl"));
				vi.setY_good(rs.getString("y_good"));
				vi.setY_sin(rs.getString("y_sin"));
				video.add(vi);
				
				
			}		
	
		} catch(SQLException ex) {
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}	
		return video;
	}	
	
	
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
				System.out.println(vi.getY_style() + "dsaldkjfaskljfdjlksa");
			
			int as = pstmt2.executeUpdate();
				System.out.println(as + "<---쿼리완료확인");
			
		} finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		
	}

}
