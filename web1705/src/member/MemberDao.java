package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import db.DBConn;

public class MemberDao {
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	//페이지 분리와 관련된 변수들
	int listSize = 2; // 한페이지에 표시될 데이터의 갯수
	int blockSize=4; // 한블럭당 표시될 페이지 번수의 갯수
	int totSize=0; // 검색된 결과의 전체 갯수
	int totPage = 0; // 전체 페이지 수
	int totBlock = 0 ; // 전체 블럭수
	int nowPage = 1; // 현재 페이지
	int nowBlock = 1; // 현재 블럭
	int startPage = 1; // 표시될 페이지의 시작번호
	int endPage = 4; // 표시될 페이지의 끝번호
	int startNo = 1; // 표시될 데이터의 시작번호
	int endNo = 2; // 표시될 데이터의 끝번호
	
	
	public MemberDao() {
		try{
			conn = new DBConn().getConn();
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	public boolean idCheck(String mid){
		boolean b=true;
		try{
			String sql = "select mid from member where mid=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1,  mid);
			rs = ps.executeQuery();
			
			if(rs.next()) b=false; //중복됨.
			
		}catch(Exception ex){
			
		}
		return b;
	}
	
	
	
	public boolean insert(MemberVo v){
		boolean b = true;
		try{
			String sql = "insert into member values(?,?,sysdate, 10000, ?,?,?,?,?,?,?,?) ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, v.getMid());
			ps.setString(2,  v.getIrum());
			ps.setString(3,  v.getGender());
			ps.setString(4,  v.getEmail());
			ps.setString(5, v.getNicName());
			ps.setString(6,  v.getPwd());
			ps.setString(7,  v.getAddress1());
			ps.setString(8,  v.getAddress2());
			ps.setString(9, v.getPost());
			ps.setString(10,  v.getPhone());
			
			int r = ps.executeUpdate();

			if(r<1) b=false;
			
		}catch(Exception ex){
			b=false;
			ex.printStackTrace();
		}
		return b;
	}
	
	public void pageCompute(String findStr) throws Exception{
		String sql = "select count(*) totSize from member "
				+ " where mid = ? or irum like ? or phone like ? "
				+ " or address1 like ? or address2 like ? "
				+ " or nicName like ? ";

		ps = conn.prepareStatement(sql);
		ps.setString(1,  findStr);
		ps.setString(2,  "%" + findStr + "%");
		ps.setString(3,  "%" + findStr + "%");
		ps.setString(4,  "%" + findStr + "%");
		ps.setString(5,  "%" + findStr + "%");
		ps.setString(6,  "%" + findStr + "%");
		
		rs = ps.executeQuery();
		if(rs.next()){
			totSize = rs.getInt("totSize");
		}
		
		totPage = (int)Math.ceil(totSize / (double)listSize );
		totBlock = (int)Math.ceil(totPage / (double)blockSize);
		
		nowBlock = (int)Math.ceil(nowPage / (double)blockSize);
		
		endPage = blockSize * nowBlock;
		startPage = endPage - blockSize + 1;
		
		if(endPage > totPage) endPage = totPage;
		
		endNo = nowPage * listSize;
		startNo = endNo - listSize + 1;
		
		if(endNo > totSize) endNo = totSize;
		
	}
	
	public ArrayList<MemberVo> select(String findStr, int nowPage){
		this.nowPage = nowPage;
		
		ArrayList<MemberVo> data =new ArrayList<MemberVo>();
		try{
			pageCompute(findStr);
			
			String sql = " select b.*  from " 
					          + "      (select rownum cnt, a.* from "
					          + "         (select * from member "
					          + "                   where mid = ? or irum like ? or phone like ? "
					          + "                   or address1 like ? or address2 like ? "
					          + "                    or nicName like ? )a "
					          + "        )b "
					          + " where b.cnt between ? and ? ";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1,  findStr);
			ps.setString(2,  "%" + findStr + "%");
			ps.setString(3,  "%" + findStr + "%");
			ps.setString(4,  "%" + findStr + "%");
			ps.setString(5,  "%" + findStr + "%");
			ps.setString(6,  "%" + findStr + "%");
			ps.setInt(7,  startNo);
			ps.setInt(8,  endNo);
			
			
			rs = ps.executeQuery();
			while(rs.next()){
				MemberVo v = new MemberVo();
				v.setMid(rs.getString("mid"));
				v.setIrum(rs.getString("irum"));
				v.setPhone(rs.getString("phone"));
				v.setAddress1(rs.getString("address1"));
				
				data.add(v);
				
			}
		
		}catch(Exception ex){
			data = null;
			ex.printStackTrace();
		}
		return data;
	}
	
	public MemberVo selectOne(String mid){
		MemberVo v = null;
		try{
			String sql = "select * from member where mid = ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1,  mid);
			
			rs = ps.executeQuery();
			if(rs.next()){
				v = new MemberVo();
				v.setMid(rs.getString("mid"));
				v.setAddress1(rs.getString("address1"));
				v.setAddress2(rs.getString("address2"));
				v.setEmail(rs.getString("email"));
				v.setGender(rs.getString("gender"));
				v.setIrum(rs.getString("irum"));
				v.setNicName(rs.getString("nicName"));
				v.setPhone(rs.getString("phone"));
				v.setPoint(rs.getInt("point"));
				v.setPost(rs.getString("post"));
				v.setPwd(rs.getString("pwd"));
				v.setrDate(rs.getDate("rDate").toString());
				
			}
		}catch(Exception ex){
			v = null;
		}
		return v;
	}
	
	public boolean update(MemberVo v){
		boolean b = true;
		try{
			String sql="update member set address1 = ? , address2=?, email = ?, gender=?, "
					+ " irum = ?, nicName = ?, phone = ?, point = ?, post = ?, pwd= ? , rDate = ? "
					+ " where mid = ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1,  v.getAddress1());
			ps.setString(2, v.getAddress2());
			ps.setString(3, v.getEmail());
			ps.setString(4,  v.getGender());
			ps.setString(5,  v.getIrum());
			ps.setString(6,  v.getNicName());
			ps.setString(7,  v.getPhone());
			ps.setInt(8,  v.getPoint());
			ps.setString(9,  v.getPost());
			ps.setString(10,  v.getPwd());
			ps.setString(11,  v.getrDate());
			ps.setString(12,  v.getMid());
			
			int r = ps.executeUpdate();
			
			if(r<=0) b=false;
					
		
		}catch(Exception ex){
			b=false;
		}
		return b;		
	}
	
	public boolean delete(MemberVo v){
		boolean b=true;
		try{
			String sql = "delete from member where mid = ? and pwd = ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1,  v.getMid());
			ps.setString(2, v.getPwd());
			int r  = ps.executeUpdate();
			
			if(r<=0) b=false;
			
		}catch(Exception ex){
			b=false;
		}
		return b;
	}
	
	public MemberVo login(MemberVo vo){
		MemberVo v = null;
		
		String sql = "select * from member where mid = ? and pwd=?";
		try{
			ps = conn.prepareStatement(sql);
			ps.setString(1,  vo.getMid());
			ps.setString(2, vo.getPwd());
			
			rs = ps.executeQuery();
			if(rs.next()){
				v = new MemberVo();
				v.setMid(rs.getString("mid"));
				v.setNicName(rs.getString("nicName"));
			}
			
			conn.close();
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return v;
	}
	
	
	
	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}

	public int getTotSize() {
		return totSize;
	}

	public void setTotSize(int totSize) {
		this.totSize = totSize;
	}

	public int getTotPage() {
		return totPage;
	}

	public void setTotPage(int totPage) {
		this.totPage = totPage;
	}

	public int getTotBlock() {
		return totBlock;
	}

	public void setTotBlock(int totBlock) {
		this.totBlock = totBlock;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getNowBlock() {
		return nowBlock;
	}

	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

	public static void main(String[] args){
		MemberDao dao = new MemberDao();
		
	}
}








