package guestbook;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import db.DBConn;
import member.MemberVo;

public class GuestBookDao {
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;

	// 페이지 분리와 관련된 변수들
	int listSize = 3; // 한페이지에 표시될 데이터의 갯수
	int blockSize = 5; // 한블럭당 표시될 페이지 번수의 갯수
	int totSize = 0; // 검색된 결과의 전체 갯수
	int totPage = 0; // 전체 페이지 수
	int totBlock = 0; // 전체 블럭수
	int nowPage = 1; // 현재 페이지
	int nowBlock = 1; // 현재 블럭
	int startPage = 1; // 표시될 페이지의 시작번호
	int endPage = 4; // 표시될 페이지의 끝번호
	int startNo = 1; // 표시될 데이터의 시작번호
	int endNo = 2; // 표시될 데이터의 끝번호

	public GuestBookDao() {
		// connection 생성
		try {
			conn = new DBConn().getConn();
		} catch (Exception ex) {

		}
	}

	public void pageCompute(String findStr) throws Exception {
		String sql = "select count(*) totSize from guestbook " + " where mid = ? or content like ? ";

		ps = conn.prepareStatement(sql);
		ps.setString(1, findStr);
		ps.setString(2, "%" + findStr + "%");

		rs = ps.executeQuery();
		if (rs.next()) {
			totSize = rs.getInt("totSize");
		}

		totPage = (int) Math.ceil(totSize / (double) listSize);
		totBlock = (int) Math.ceil(totPage / (double) blockSize);

		nowBlock = (int) Math.ceil(nowPage / (double) blockSize);

		endPage = blockSize * nowBlock;
		startPage = endPage - blockSize + 1;

		if (endPage > totPage)
			endPage = totPage;

		endNo = nowPage * listSize;
		startNo = endNo - listSize + 1;

		if (endNo > totSize)
			endNo = totSize;

	}

	public ArrayList<GuestBookVo> select(String findStr, int nowPage) {
		this.nowPage = nowPage;
		
		ArrayList<GuestBookVo> data = new ArrayList<GuestBookVo>();

		try {
			pageCompute(findStr);

			String sql = " select b.*  from " 
								+ "      (select rownum cnt, a.* from "
								+ "             (select * from guestbook "
								+ "                   where mid = ? or content like ? "
								+ "                   order by rDate desc "
								+ "             )a " 
								+ "        )b " 
								+ " where b.cnt between ? and ? ";

			ps = conn.prepareStatement(sql);
			ps.setString(1, findStr);
			ps.setString(2, "%" + findStr + "%");
			ps.setInt(3, startNo);
			ps.setInt(4, endNo);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				GuestBookVo v = new GuestBookVo();
				v.setMid(rs.getString("mid"));
				v.setContent(rs.getString("content"));
				v.setHit(rs.getInt("hit"));
				v.setPwd(rs.getString("pwd"));
				v.setRdate(rs.getDate("rdate").toString());
				v.setSid(rs.getInt("sid"));
				
				data.add(v);

			}
		} catch (Exception ex) {
			data = null;
		}

		return data;
	}

	public boolean insert(GuestBookVo v) {
		boolean b = true;
		try {
			String sql = "insert into guestbook(sid, mid, content, hit, rdate, pwd) "
					+ " values ( seq_gb.nextval, ?, ?, 1, sysdate, ?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, v.getMid());
			ps.setString(2, v.getContent());
			ps.setString(3, v.getPwd());

			int r = ps.executeUpdate();
			if (r <= 0)
				b = false;

			conn.close();

		} catch (Exception ex) {
			b = false;
		}
		return b;
	}

	public boolean modify(GuestBookVo v) {
		boolean b = true;
		try {
			String sql = "update guestbook set content = ? where sid = ? and pwd = ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, v.getContent());
			ps.setInt(2, v.getSid());
			ps.setString(3, v.getPwd());

			int r = ps.executeUpdate();

			if (r <= 0)
				b = false;
			conn.close();
		} catch (Exception ex) {
			System.out.println(ex.toString());
			b = false;
		}
		return b;
	}

	public boolean delete(GuestBookVo v) {
		boolean b = true;
		try {
			String sql = "delete from guestbook where sid=? and pwd = ? ";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, v.getSid());
			ps.setString(2, v.getPwd());

			int r = ps.executeUpdate();

			if (r <= 0)
				b = false;
			
			conn.close();
		} catch (Exception ex) {
			b = false;
		}
		return b;
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

}
