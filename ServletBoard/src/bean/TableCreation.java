/*
 * 강의용으로 사용되는 테이블을 초기화 하거나 생성함.
 * date : 2017.12(박원기)
 */

package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TableCreation {
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	String sql = "";

	public TableCreation() {
		conn = new DBConnect().getConn();

	}

	public int checkTable(String tName){
		int r = 0;
		try{
			sql = "select count(*) cnt from user_tables where table_name = '" 
					+ tName.toUpperCase()+ "'";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			r = rs.getInt("cnt");
			if (r == 1) {//기존 테이블 데이터 초기화
				sql = "truncate table " + tName;
				ps = conn.prepareStatement(sql);
				ps.execute();
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
			ps.execute();//시퀀스가 없는 경우 예외처리됨.
		}catch(Exception ex){
			
		}finally{
		
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
	
	public List<String> createBoard(String tName) {
		List<String> msg = new ArrayList<String>();
		int r = checkTable(tName);
		
		if( r== -1){
			msg.add("자료실 체크중 예외 발생.");
		}else if ( r==1) {
			msg.add("자료실 테이블이 초기화 되었습니다.");
			
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
					+ " deep varchar(255)),"
					+ " part varchar(50) default 'default'";
			try{
				ps = conn.prepareStatement(sql);
				ps.execute();
				msg.add("자료실 테이블이 정상적으로 생성되었습니다.");
			}catch(Exception ex){
				msg.add("자료실 테이블 생성중 오류 발생");
			}
		}
		
		if(createSequesce("seq_" + tName)){
			msg.add("자료실 시퀀스가  생성되었습니다.");
		}else{
			msg.add("자료실 시퀀스 생성중 오류 발생");
		}
		return msg;
	}

	public List<String> createBoardAtt(String tName){
		List<String> msg = new ArrayList<String>();
		
		int r=0;
		r = checkTable(tName);
		
		try{
			if(r == -1){
				msg.add("자료실 첨부 테이블 체크중 예외 발생");
			}else if (r==1) {
				msg.add("자료실 첨부 테이블이 초기화 되었습니다.");
			}else if(r==2){
				sql = "create table board_att(" 
						+ " serial integer," 
						+ " pserial integer,"
						+ " attfile varchar(255),"
						+ " oriattfile varchar(255)" 
						+ ")";
					ps = conn.prepareStatement(sql);
					ps.execute();
					msg.add("자료실 첨부 테이블이 생성되었습니다.");
			}
		}catch(Exception ex){
			msg.add("자료실 첨부 테이블 생성시 오류 발생");
		}

		if(createSequesce("seq_" + tName)){
			msg.add("자료실 첨부테이블의 시퀀스가  생성되었습니다.");
		}else{
			msg.add("자료실 첨부 테이블의 시퀀스 생성중 오류 발생.");
		}
		
		return msg;
	}
		
		

	public List<String> createMember(String tName){
		List<String> msg = new ArrayList<String>();
		int r = -1;
		r = checkTable(tName);
		
		try{
			if(r == -1){
				msg.add("회원관리 테이블 체크중 예외 발생");
			}else if (r==1) {
				addMember();
				msg.add("회원관리 테이블이 초기화되었습니다.");
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
				
					ps = conn.prepareStatement(sql);
					ps.execute();
					
					addMember();
					
					
					msg.add("회원관리 테이블이 생성되었습니다.");
			}
		}catch(Exception ex){
			msg.add("회원관리 테이블 생성중 오류 발생");
		}
		
		return msg;
		
	}

	public void addMember() throws Exception{
		sql = "insert into member(mid, pwd) values('manager', 'manager')";
		ps = conn.prepareStatement(sql);
		ps.executeUpdate();
		sql = "insert into member(mid, pwd) values('guest', 'guest')";
		ps = conn.prepareStatement(sql);
		ps.executeUpdate();
	}
	
	public List<String> createGuestbook(String tName){
		List<String> msg = new ArrayList<String>();
		msg.add("아직 테이블 구성이 완성되지 않았습니다.");
		
		return msg;
	}

	public static void main(String[] args) {
		new TableCreation();

	}

}
