package uiux;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class Score {
	private Connection con ;
	private ScoreVo sDao;
	public Score(){
		//todo
		con = new OracleDB().getCon();
	}
	public Vector<ScoreVo> display(){
		Vector<ScoreVo> v = new Vector<ScoreVo>();
		PreparedStatement pstmt=null;
		String sql =
			"select rno, s.mid, m.irum, classyear, school, " +
		    " exam, kor, eng, mat, comp, etc " +
			" from student s, score sc , vmember m " +
		    " where s.mid = sc.mid and s.mid= m.mid " ;
		
		if( !sDao.getGubun().equals("all") ){
			sql += " and " + sDao.getGubun() + "='"  
					+ sDao.getFindStr() + "'";
		}
	
		
		try{
			pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				ScoreVo sd = new ScoreVo();
				MemberVo md = new MemberVo();
				sd.setRno(rs.getInt("rno"));
				sd.setMid(rs.getString("mid"));
				md.setIrum(rs.getString("irum"));
				sd.setClassYear(rs.getInt("classyear"));
				sd.setSchool(rs.getString("school"));
				sd.setExam(rs.getString("exam"));
				sd.setKor(rs.getInt("kor"));
				sd.setEng(rs.getInt("eng"));
				sd.setMat(rs.getInt("mat"));
				sd.setComp(rs.getInt("comp"));
				sd.setEtc(rs.getInt("etc"));
				
				sd.setmDao(md);
				v.add(sd);
			}
			rs.close();
			pstmt.close();
			con.close();
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			return v;
		}
	}
	
	public int insert(){
		int cnt=0;
		PreparedStatement pstmt = null;
		String sql = "insert into score(kor, eng, mat, comp, etc, exam, mid, rno) " +
				"values(?,?,?,?,?,?,?,score_seq.nextval)";
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, sDao.getKor());
			pstmt.setInt(2, sDao.getEng());
			pstmt.setInt(3, sDao.getMat());
			pstmt.setInt(4, sDao.getComp());
			pstmt.setInt(5, sDao.getEtc());
			pstmt.setString(6, sDao.getExam());
			pstmt.setString(7, sDao.getMid());
			
			cnt = pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
			
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			return cnt;
		}
	}
	public int update(){
		int cnt=0;
		//todo
		PreparedStatement pstmt = null;
		String sql = "update score set kor=?, eng=?, mat=?, " +
		   			 "comp=?, etc=? , exam=? where rno=?" ;
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, sDao.getKor());
			pstmt.setInt(2, sDao.getEng());
			pstmt.setInt(3, sDao.getMat());
			pstmt.setInt(4, sDao.getComp());
			pstmt.setInt(5, sDao.getEtc());
			pstmt.setString(6, sDao.getExam());
			pstmt.setInt(7, sDao.getRno());
			
			cnt = pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
			
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			return cnt;
		}
		
	}
	public int delete(){
		int cnt=0;
		PreparedStatement pstmt = null;
		String sql = "delete from score where rno=?" ;
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, sDao.getRno());
			
			cnt = pstmt.executeUpdate();
			
			pstmt.close();
			con.close();
			
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			return cnt;
		}
	}
	// 성적테이블의 rno를 사용하여 1건 검색
	public ScoreVo select(int rno){
		ScoreVo dao = new ScoreVo();
		MemberVo m = new MemberVo();
		//todo
		PreparedStatement pstmt= null;
		String sql = "select s.mid, school, classyear, " +
				" m.irum, m.phone, m.address, " +
				"sc.exam, sc.kor, sc.eng, sc.mat, sc.comp, " +
				"sc.etc from student s, vmember m, score sc " +
				"where s.mid = m.mid and s.mid=sc.mid " +
				"and rno=?";
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,rno);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				
				dao.setMid(rs.getString("mid"));
				dao.setSchool(rs.getString("school"));
				dao.setClassYear(rs.getInt("classyear"));
				dao.setExam(rs.getString("exam"));
				dao.setKor(rs.getInt("kor"));
				dao.setEng(rs.getInt("eng"));
				dao.setMat(rs.getInt("mat"));
				dao.setComp(rs.getInt("comp"));
				dao.setEtc(rs.getInt("etc"));
				
				m.setIrum(rs.getString("irum"));
				m.setAddress(rs.getString("address"));
				m.setPhone(rs.getString("phone"));
				
				dao.setmDao(m);
				
				rs.close();
				pstmt.close();
				con.close();
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			return dao;	
		}
		
	}
	// 학생 아이디를 사용하여 학생정보 검색
	public ScoreVo select(String mid){
		ScoreVo dao = new ScoreVo();
		MemberVo m = new MemberVo();
		//todo
		PreparedStatement pstmt= null;
		String sql = " select s.mid, irum, school, classyear, " +
					 " m.phone, m.address from student s, vmember m " +
					 " where s.mid = m.mid and s.mid=?";
		try{
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,mid);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				dao.setMid(rs.getString("mid"));
				dao.setSchool(rs.getString("school"));
				dao.setClassYear(rs.getInt("classyear"));
				
				m.setIrum(rs.getString("irum"));
				m.setAddress(rs.getString("address"));
				m.setPhone(rs.getString("phone"));
				
				dao.setmDao(m);
				
				rs.close();
				pstmt.close();
				con.close();
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			return dao;	
		}
		
	}
	public ScoreVo getsDao() {
		return sDao;
	}
	public void setsDao(ScoreVo sDao) {
		this.sDao = sDao;
	}

	
}
