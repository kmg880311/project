package project.driverdb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DriverDB {
	// 개인프로젝트 디비
	public Connection driverDbcon() throws ClassNotFoundException, SQLException{
		System.out.println("01 driverDbcon DriverDB.java");
		Connection recon = null;
		
		Class.forName("com.mysql.jdbc.Driver");
		/*String jdbcDriver = "jdbc:mysql://localhost:3306/aaaa?" +
				"useUnicode=true&characterEncoding=euckr";
		String dbUser = "aaaa1";
		String dbPass = "aaaa1";
		*/
		String jdbcDriver = "jdbc:mysql://localhost:3306/livetube_mysql?" +
				"useUnicode=true&characterEncoding=euckr";
		String dbUser = "root";
		String dbPass = "java0000";
		
		recon = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			System.out.println(recon);
		return recon;
		
		
	}

	
}
