package bean;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	Connection conn;
	
	//각 DB제조사에서 재공하는 상수
	String driver = "oracle.jdbc.driver.OracleDriver";
	//연결하려고 하는 DB 서버주소
	//String url="jdbc:oracle:thin:@서버주소:포트번호:SID";
	
	/*
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	String user="hr";
	String pwd="hr";
	*/
	
	String url="jdbc:oracle:thin:@192.168.0.18:1521:orcl";
	String user="hr";
	String pwd="HR";
	
	
	public DBConnect() {
		try{
			Class.forName(driver).newInstance();
			//System.out.println("driver loading ok....");
			conn = DriverManager.getConnection(url, user,pwd);
			//System.out.println("connection.....ok");
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	

	public Connection getConn() {
		return conn;
	}
	
	public static void main(String[] args) {
		DBConnect db = new DBConnect();

	}

}
