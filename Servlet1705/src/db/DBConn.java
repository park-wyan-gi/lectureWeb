package db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConn {
	String driver;
	String url;
	String userId;
	String userPwd;
	
	Connection conn;
	
	public DBConn() {
		// 사용하려는 DB에 따라 지정된 상수
		driver = "oracle.jdbc.driver.OracleDriver";
		url = "jdbc:oracle:thin:@192.168.0.18:1521:orcl";
		userId = "hr";
		userPwd = "HR";
		
		try{
			Class.forName(driver);
			//System.out.println("driver loading ok....");
			
			conn = DriverManager.getConnection(url, userId, userPwd);
			//System.out.println("connection ok ... ");
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	public Connection getConn() {
		return conn;
	}

	public static void main(String[] args) {
		DBConn db = new DBConn();

	}

}
