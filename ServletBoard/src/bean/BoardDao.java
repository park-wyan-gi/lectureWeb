package bean;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardDao {
	Connection conn;
	int size = 1024 * 1024 * 10;
   String uploadPath = "C:/Users/jobtc/git/lectureWeb/ServletBoard/WebContent/upload/";
	String encoding = "utf-8";
   MultipartRequest multi = null;
   
   PageVo pVo;

   PreparedStatement ps = null;
   ResultSet rs = null;

	public BoardDao() {
	   try{
   		conn = new DBConnect().getConn();
   		
   		checkTable();//테이블 및 시퀀스가 존재하지 않으면 자동 생성
   		
	   }catch(Exception ex){
	      ex.printStackTrace();
	   }
	}
	
	public void checkTable() throws Exception{ 
	   int cnt=0;
      String sql = "";
	 
      sql = "select count(*) cnt from user_tables where table_name = upper('board')";
      ps = conn.prepareStatement(sql);
      rs = ps.executeQuery();
      rs.next();
      cnt = rs.getInt("cnt");
      if(cnt <1){
         //table 생성 및 시퀀스 생성
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
         ps = conn.prepareStatement(sql);
         ps.execute();
      }
      
      sql = "select count(*) cnt from user_tables where table_name = upper('board_att')";
      ps = conn.prepareStatement(sql);
      rs = ps.executeQuery();
      rs.next();
      cnt = rs.getInt("cnt");
      if(cnt <1){
         sql = "create table board_att("
               + " serial integer,"
               + " pserial integer,"
               + " attfile varchar(255),"
               + " oriattfile varchar(255)"
               + ")";
         ps = conn.prepareStatement(sql);
         ps.execute();
      }
      
      sql = "select count(*) cnt from user_sequences where sequence_name = upper('seq_board') ";
      ps = conn.prepareStatement(sql);
      rs = ps.executeQuery();
      rs.next();
      cnt = rs.getInt("cnt");
      if(cnt<1){
         sql = "create sequence seq_board";
         ps = conn.prepareStatement(sql);
         ps.execute();
      }
      
 
      
      
      sql = "select count(*) cnt from user_sequences where sequence_name = upper('seq_board_att')";
      ps = conn.prepareStatement(sql);
      rs = ps.executeQuery();
      rs.next();
      cnt = rs.getInt("cnt");
      if(cnt<1){
         sql = "create sequence seq_board_att";
         ps = conn.prepareStatement(sql);
         ps.execute();
      }     
	}

	public int insert(HttpServletRequest req) {
	   List<String> attFiles = new ArrayList<String>();
	   List<String> oriAttFiles = new ArrayList<String>();
	   
		int rs = 0; // 정성적으로 저장된 경우 0보다 큰값.
		String sql = null;
		try {
		   //파일 업로드 처리
         multi = new MultipartRequest(req,
                  uploadPath,
                  size,
                  encoding,
                  new DefaultFileRenamePolicy());
         
         Enumeration<String> files = multi.getFileNames();
         while(files.hasMoreElements()){
            String tag = files.nextElement();
            attFiles.add(multi.getFilesystemName(tag));
            oriAttFiles.add(multi.getOriginalFileName(tag));
         }
         
         //board 테이블에 내용 저장
         sql = "insert into board(serial, mdate, worker, subject, "
             + " content, hit, grp, deep) "
             + " values(seq_board.nextval, sysdate, ?, ?, ?, 0 , "
             + " seq_board.currval, seq_board.currval) ";
         
			ps = conn.prepareStatement(sql);
			ps.setString(1, multi.getParameter("worker"));
			ps.setString(2, multi.getParameter("subject"));
			ps.setString(3, multi.getParameter("content"));

			rs = ps.executeUpdate();
			
			// board_att 테이블에 첨부 파일 저장
			for(int i=0 ; i<attFiles.size() ; i++){
			   if(attFiles.get(i) == null) continue;
			   sql = "insert into board_att(serial, pserial, attfile, oriattfile)"
	          + " values(seq_board_att.nextval, seq_board.currval, ?,?)";
			   
			   ps = conn.prepareStatement(sql);
			   ps.setString(1, attFiles.get(i));
			   ps.setString(2, oriAttFiles.get(i));
			   
			   rs = ps.executeUpdate();
			   
			}
			

		} catch (Exception ex) {
			rs = -1;
			ex.printStackTrace();
		}
		return rs;
	}
	
	public void pagaCompute(BoardVo v){
	   pVo = new PageVo();
	   
	   int totList = 0; // 리스트 전체 갯수
	   int totPage = 0; // 전체 페이지수
	   int totBlock= 0; // 전체 블럭수

	   int nowBlock = 1 ; // 현재 블럭

	   int startNo = 0; // 리스트 목록의 시작위치
	   int endNo = 0 ; // 리스트 목록의 마지막 위치

	   int startPage = 0; // 한블럭에 표시할 시작 페이지 번호
	   int endPage = 0; // 한블럭에 표시할 마지막 페이지 번호

	   int nowPage = v.getNowPage(); // 현재 페이지
	   
	   PreparedStatement ps = null;
      ResultSet rs = null;
      String findStr = v.getFindStr();

      String sql = "select count(*) cnt from board where worker like ? or subject like ? or content like ? ";
      try {
         ps = conn.prepareStatement(sql);
         ps.setString(1, "%" + findStr + "%");
         ps.setString(2, "%" + findStr + "%");
         ps.setString(3, "%" + findStr + "%");
         rs = ps.executeQuery();
         rs.next();
         
         totList = rs.getInt("cnt");
	   
         totPage  = (int)Math.ceil(totList / (pVo.getListSize()* 1.0));
         totBlock = (int)Math.ceil(totPage / (pVo.getBlockSize()* 1.0));
   
         nowBlock = (int)Math.ceil(nowPage / (pVo.getBlockSize()* 1.0));
         
         endPage = nowBlock * pVo.getBlockSize();
         startPage = endPage -pVo.getBlockSize() + 1;
   
         endNo = nowPage * pVo.getListSize();
         startNo = endNo - pVo.getListSize() + 1;
         
         if(endPage > totPage) endPage = totPage;
         if(endNo > totList) endNo = totList;
         
         pVo.setTotList(totList);
         pVo.setTotBlock(totBlock);
         pVo.setEndNo(endNo);
         pVo.setEndPage(endPage);
         pVo.setNowBlock(nowBlock);
         pVo.setStartNo(startNo);
         pVo.setStartPage(startPage);
         pVo.setTotPage(totPage);
         pVo.setNowPage(nowPage);
         
         ps.close();
         rs.close();
         
      }catch(Exception ex){}

	}

	public List<BoardVo> list(BoardVo v) {
	   pagaCompute(v);
	   
		String findStr = v.getFindStr();
		String replStr = "";

		String sql = "select * from("
		           + "  select rownum no, brd.* from("
		           + "    select b.*, (select count(*) from board_att where pserial = b.serial) cnt from board b "
		           + " where worker like ? or subject like ? or content like ? "
		           + "    order by grp desc, deep asc"
		           + "  )brd "
		           + ") where no between ? and ? ";

		ArrayList<BoardVo> list = new ArrayList<BoardVo>();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + findStr + "%");
			ps.setString(2, "%" + findStr + "%");
			ps.setString(3, "%" + findStr + "%");
			ps.setInt(4,  pVo.getStartNo());
			ps.setInt(5,  pVo.getEndNo());
			
			
			rs = ps.executeQuery();

			while (rs.next()) {
			   replStr = "";
			   int deep = rs.getString("deep").split("-").length;
			   if(deep>1){
			      for(int i=3; i<=deep ;i++){
			         replStr += "&nbsp;&nbsp;";
			      }
               replStr += "└";
			   }
				BoardVo vo = new BoardVo();
				vo.setSerial(rs.getInt("serial"));
				vo.setmDate(rs.getDate("mdate").toString());
				vo.setWorker(rs.getString("worker"));
				vo.setSubject(replStr + rs.getString("subject"));
				vo.setHit(rs.getInt("hit"));
				vo.setCnt(rs.getInt("cnt"));

				list.add(vo);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return list;
		}
	}

	public int delete(BoardVo v) {
		BoardVo temp = selectOne(v);
		File deleteFile = null;
		String sql = "";
		
		int r=1;
		try{
		   //원본글 삭제
   		sql = "delete from board where serial =?";
   		ps = conn.prepareStatement(sql);
   		ps.setInt(1, v.getSerial());
   		ps.executeUpdate();
   		
   		//첨부파일들 불러오기
   		sql = "select * from board_att where pserial=?";
   		ps = conn.prepareStatement(sql);
   		ps.setInt(1,  v.getSerial());
   		rs = ps.executeQuery();

   		//첨부파일 삭제
   		while(rs.next()){
            deleteFile = new File(uploadPath + rs.getString("attfile"));
            if (deleteFile.exists()){
               deleteFile.delete();
            }
   		}
   		//첨부 테이블 삭제
   		sql = "delete from board_att where pserial=?";
         ps = conn.prepareStatement(sql);
         ps.setInt(1, v.getSerial());
         ps.executeUpdate();

		} catch (Exception ex) {
			r = -1;
			ex.printStackTrace();
		} finally {
			return r;
		}
	}

	public BoardVo view(BoardVo vo) {
		String sql = "";
		BoardVo v = null;
		
		try {
			// hit수 증가
			sql = "update board set hit = hit+1 where serial=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, vo.getSerial());
			ps.executeUpdate();
			
			v = selectOne(vo);

			v.setFindStr(vo.getFindStr());
			v.setNowPage(vo.getNowPage());
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return v;
		}
	}

	public BoardVo selectOne(BoardVo v) {
	   
		String sql = "";
		BoardVo vo = new BoardVo();
		vo.setFindStr(v.getFindStr());
		vo.setNowPage(v.getNowPage());

		List<String> attFile = new ArrayList<String>();
		List<String> oriFile = new ArrayList<String>();
		
		try {
		   //윈본글
			sql = "select * from board where serial = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, v.getSerial());
			rs = ps.executeQuery();

			if (rs.next()) {
				vo.setSerial(rs.getInt("serial"));
				vo.setmDate(rs.getString("mDate"));
				vo.setWorker(rs.getString("worker"));
				vo.setSubject(rs.getString("subject"));
				vo.setContent(rs.getString("content"));
				vo.setHit(rs.getInt("hit"));
				vo.setGrp(rs.getInt("grp"));
				vo.setDeep(rs.getString("deep"));

				//첨부파일
				sql = "select attfile, oriattfile from board_att where pserial=?";
				ps = conn.prepareStatement(sql);
            ps.setInt(1, vo.getSerial());

            ResultSet rs2 = ps.executeQuery();
				while(rs2.next()){
				   attFile.add(rs2.getString("attfile"));
				   oriFile.add(rs2.getString("oriattfile"));
				}
				vo.setAttfile(attFile);
				vo.setOriAttfile(oriFile);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return vo;
		}
	}

	public BoardVo update(HttpServletRequest req) {
	   List<String> attFiles = new ArrayList<String>();
      List<String> oriAttFiles = new ArrayList<String>();

		int r = 0;
		String sql = "";
		MultipartRequest multi = null;
		BoardVo vo = null;
		BoardVo tempVo = null;
		String tempFile = null;
		String file1 = null;
		String file2 = null;
		String oriFile1 = null;
		String oriFile2 = null;
		String[]  delFile = null;
		
		try {
			// 첨부파일
			multi = new MultipartRequest(req, uploadPath, size, encoding,
					new DefaultFileRenamePolicy());
			
			Enumeration<String> files = multi.getFileNames();

			while(files.hasMoreElements()){
				tempFile = files.nextElement();
				attFiles.add(multi.getFilesystemName(tempFile));
				oriAttFiles.add(multi.getOriginalFileName(tempFile));
			}

			//원본 수정
			sql = "update board set subject=? , content=? where serial=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, multi.getParameter("subject"));
			ps.setString(2, multi.getParameter("content"));
			ps.setString(3, multi.getParameter("serial"));
			r = ps.executeUpdate();
			
         // board_att 테이블에 첨부 파일 저장
         for(int i=0 ; i<attFiles.size() ; i++){
            if(attFiles.get(i) == null) continue;
            sql = "insert into board_att(serial, pserial, attfile, oriattfile)"
             + " values(seq_board_att.nextval, ?, ?,?)";
            
            ps = conn.prepareStatement(sql);
            ps.setString(1, multi.getParameter("serial"));
            ps.setString(2, attFiles.get(i));
            ps.setString(3, oriAttFiles.get(i));
            
            r = ps.executeUpdate();
         }
         
         // 삭제된 첨부파일 처리
         if(multi.getParameterValues("deleteFile") != null){
            delFile = multi.getParameterValues("deleteFile");
            for(int i=0 ; i<delFile.length ; i++){
               sql = "delete from board_att where attfile=? ";
               ps = conn.prepareStatement(sql);
               ps.setString(1,  delFile[i]);
               ps.executeUpdate();
               
               File f = new File("../../upload/" + delFile[i]);
               if(f.exists()) f.delete();
            }
         }
         
         vo = new BoardVo();
         vo.setSerial(Integer.parseInt(multi.getParameter("serial")));
         vo.setFindStr(multi.getParameter("findStr"));
         vo.setNowPage(Integer.parseInt(multi.getParameter("nowPage")));
		} catch (Exception ex) {
			vo = null;
			ex.printStackTrace();
		} finally {
			return vo;
		}
	}
	
	public BoardVo repl(HttpServletRequest req) {
	   List<String> attFiles = new ArrayList<String>();
      List<String> oriAttFiles = new ArrayList<String>();
      
		String sql = null;

		BoardVo vo = new BoardVo();
		int np = 1;
		String msg = "";

		MultipartRequest multi = null;

		try {
			multi = new MultipartRequest(req, uploadPath, size, encoding,
					new DefaultFileRenamePolicy());

			// 첨부파일
			Enumeration<String> files = multi.getFileNames();
			
			while(files.hasMoreElements()){
            String file1 = files.nextElement();
            attFiles.add(multi.getFilesystemName(file1));
            oriAttFiles.add(multi.getOriginalFileName(file1));
         }

			//내용 저장
	      sql = "insert into board(serial, mdate, worker, subject, "
	            + " content, hit, grp, deep)"
	            + " values(seq_board.nextval, sysdate, ?, ?, ?, 0, ?, "
	            + " ? || '-' || seq_board.currval)";

			ps = conn.prepareStatement(sql);
			ps.setString(1, multi.getParameter("worker"));
			ps.setString(2, multi.getParameter("subject"));
			ps.setString(3, multi.getParameter("content"));
			ps.setString(4, multi.getParameter("grp"));
			ps.setString(5, multi.getParameter("deep"));

			ps.executeUpdate();
			
         // board_att 테이블에 첨부 파일 저장
         for(int i=0 ; i<attFiles.size() ; i++){
            if(attFiles.get(i) == null) continue;
            sql = "insert into board_att(serial, pserial, attfile, oriattfile)"
             + " values(seq_board_att.nextval, seq_board.currval, ?,?)";
            
            ps = conn.prepareStatement(sql);
            ps.setString(1, attFiles.get(i));
            ps.setString(2, oriAttFiles.get(i));
            
            ps.executeUpdate();
            
         }			
         vo.setFindStr(multi.getParameter("findStr"));
         vo.setNowPage(Integer.parseInt(multi.getParameter("nowPage")));

		} catch (Exception ex) {
			vo = null;
			ex.printStackTrace();
		} finally {
			return vo;
		}
	}

   public PageVo getpVo() {
      return pVo;
   }

}
