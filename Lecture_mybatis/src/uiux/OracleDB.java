package uiux;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class OracleDB {
	// 데이터베이스 계정
	private String id="itora";
	private String pwd="hi7737";
	private String db_url
		="jdbc:oracle:thin:@oracle.itora.cafe24.com:1521:orcl";
	//데이터베이스 연결
	private String db_driver = "oracle.jdbc.driver.OracleDriver";
	private Connection con = null;
	
	public Connection getCon(){
		try{
			// 드라이버로딩
			Class.forName(db_driver);
			//System.out.println("드라이버가 로딩됨...");
			// DB연결
			con = DriverManager.getConnection(db_url,id,pwd);
			//System.out.println("DB가 연결됨....");
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			return con;
		}
	}
	public static void main(String args[]){
		new OracleDB().getCon();
	}
}




