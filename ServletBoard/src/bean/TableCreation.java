/*
 * 강의용으로 사용되는 테이블을 초기화 하거나 생성함.
 * date : 2017.12(박원기)
 */

package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TableCreation {
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	String sql = "";

	public TableCreation() {
		conn = new DBConnect().getConn();

	}

	public int initTable(String tName){
		int r = 0;
		try{
			sql = "select count(*) cnt from user_tables where table_name = '" 
					+ tName.toUpperCase()+ "'";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			int cnt = rs.getInt("cnt");
			if (cnt >= 1) {
				sql = "truncate table " + tName;
				ps = conn.prepareStatement(sql);
				ps.execute();
				r=1;//테이블이 있어서 초기화된 경우
			} else {
				r=2;//테이블이 없는 경우
			}
		}catch(Exception ex){
			r=-1;
		}
		return r;

	}

	public boolean createSequesce(String seqName){
		boolean b = true;
		try{
			sql = "drop sequence " + seqName;
			ps = conn.prepareStatement(sql);
			ps.execute();
		}catch(Exception ex){
			sql = "create sequence " + seqName;
			try {
				ps = conn.prepareStatement(sql);
				ps.execute();
				b=true;
			} catch (SQLException e) {
				b=false;
			}
		}
		return b;
	}
	
	public String createBoard(String tName) {
		String rs = "";
		int r=-1;
		r = initTable(tName);
		
		if( r== -1){
			rs = "자료실 체크중 예외 발생.";
		}else if ( r==1) {
			rs = "자료실 테이블이 초기화 되었습니다.";
			
		}else if(r==2){
			
			// table 생성 및 시퀀스 생성
			sql = "create table board(" 
					+ " serial integer, " 
					+ " mdate date, " 
					+ " worker varchar(20),"
					+ " subject varchar2(200)," 
					+ " content varchar2(255)," 
					+ " hit integer," 
					+ " pwd varchar(20),"
					+ " grp integer," 
					+ " deep varchar(255))";
			try{
				ps = conn.prepareStatement(sql);
				ps.execute();
				rs = "자료실 테이블이 정상적으로 생성되었습니다.";
			}catch(Exception ex){
				rs ="자료실 테이블 생성중 오류 발생";
			}
		}
		if(createSequesce("seq_" + tName)){
			rs += "<li>자료실 시퀀스가  생성되었습니다.</li><br/>";
		}else{
			rs += "<li>자료실 시퀀스 생성중 오류 발생</li><br/>";
		}
		return rs;
	}

	public String createBoardAtt(String tName){
		String rs = "";
		int r=0;
		r = initTable(tName);
		
		if(r == -1){
			rs = "자료실 첨부 테이블 체크중 예외 발생";
		}else if (r==1) {
			rs ="자료실 첨부 테이블이 초기화 되었습니다.";
		}else if(r==2){
			sql = "create table board_att(" 
					+ " serial integer," 
					+ " pserial integer,"
					+ " attfile varchar(255),"
					+ " oriattfile varchar(255)" 
					+ ")";
			try{
				ps = conn.prepareStatement(sql);
				ps.execute();
				rs = "자료실 첨부 테이블이 생성되었습니다.";
			}catch(Exception ex){
				rs = "자료실 첨부 테이블 생성시 오류 발생'";
			}
		}

		if(createSequesce("seq_" + tName)){
			rs += "<li>자료실 첨부테이블의 시퀀스가  생성되었습니다.</li><br/>";
		}else{
			rs += "<li>자료실 첨부 테이블의 시퀀스 생성중 오류 발생</li><br/>";
		}
		
		return rs;
	}
		
		

	public String createMember(String tName){
		String rs = "";
		int r = -1;
		r = initTable(tName);
		
		if(r == -1){
			rs = "회원관리 테이블 체크중 예외 발생";
		}else if (r==1) {
			rs = "회원관리 테이블이 초기화되었습니다.";
		}else if (r==2){
			sql = "create table member(" 
					+ " mid varchar(20) primary key,"
					+ " irum varchar(30),"
					+ " rDate date,"
					+ " point integer,"
					+ " gender char(1),"
					+ " email varchar(100),"
					+ " pwd varchar(20),"
					+ " nicName varchar(50),"
					+ " post varchar(30),"
					+ " address1 varchar(100),"
					+ " address2 varchar(100),"
					+ " phone varchar(30)"
					+ ")";
			
			try{
				ps = conn.prepareStatement(sql);
				ps.execute();
				rs = "회원관리 테이블이 생성되었습니다.";
			}catch(Exception ex){
				rs = "회원관리 테이블 생성중 오류 발생";
			}
		}
		
		return rs;
		
	}

	public String createGuestbook(String tName){
		return "아직 테이블 구성이 완성되지 않았습니다.";
	}

	public static void main(String[] args) {
		new TableCreation();

	}

}
