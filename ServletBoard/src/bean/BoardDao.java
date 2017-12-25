package bean;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.awt.image.renderable.ParameterBlock;
import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.media.jai.JAI;
import javax.media.jai.RenderedOp;
import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.tribes.group.InterceptorPayload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import bean.DBConnect;

public class BoardDao {
   String sDirectory = "C:/Users/jobtc/git/lectureWeb/ServletBoard/WebContent/download/";
   // "C:/Users/JHTA/git/lectureWeb/Servlet1705/WebContent/download/";
   int mSize = 1024 * 100000;

   Connection conn;
   PreparedStatement ps;
   ResultSet rs;

   // 페이지 분리와 관련된 변수들
   int listSize = 20; // 한페이지에 표시될 데이터의 갯수
   int blockSize = 4; // 한블럭당 표시될 페이지 번수의 갯수
   int totSize = 0; // 검색된 결과의 전체 갯수
   int totPage = 0; // 전체 페이지 수
   int totBlock = 0; // 전체 블럭수
   int nowPage = 1; // 현재 페이지
   int nowBlock = 1; // 현재 블럭
   int startPage = 1; // 표시될 페이지의 시작번호
   int endPage = 4; // 표시될 페이지의 끝번호
   int startNo = 1; // 표시될 데이터의 시작번호
   int endNo = 2; // 표시될 데이터의 끝번호

   // thumb nail 만들기 위한 변수
   ParameterBlock pb;
   RenderedOp op;
   BufferedImage bi;
   BufferedImage thumb;
   Graphics2D g2d;

   public BoardDao(HttpServletRequest request) {
      try {
         conn = new DBConnect().getConn();
         
        
      } catch (Exception ex) {
         ex.printStackTrace();
      }
   }

   public String insert(HttpServletRequest request) {

      String rs = "정상적으로 추가되었습니다.";
      try {
         MultipartRequest mr = new MultipartRequest(request, sDirectory, mSize,
               "utf-8", new DefaultFileRenamePolicy());

         String worker = mr.getParameter("worker");
         String subject = mr.getParameter("subject");
         String content = mr.getParameter("content");
         String pwd = mr.getParameter("pwd");

         String sql = "insert into board("
               + " serial, mdate, worker, subject, content, hit, grp, deep, pwd)"
               + " values(seq_board.nextval, sysdate, ?, ?, ?, 0, "
               + "        seq_board.currval, seq_board.currval, ? )";

         // rollback, commit
         conn.setAutoCommit(false);

         ps = conn.prepareStatement(sql);
         ps.setString(1, worker);
         ps.setString(2, subject);
         ps.setString(3, content);
         ps.setString(4, pwd);
         int r = ps.executeUpdate();
         if (r > 0) {
            Enumeration enumFile = mr.getFileNames();

            while (enumFile.hasMoreElements()) {
               String tag = (String) enumFile.nextElement();
               String ori = mr.getOriginalFileName(tag);
               String sys = mr.getFilesystemName(tag);

               if (ori == null)
                  continue;

               sql = "insert into board_att(serial, pserial, attfile, oriattfile) "
                     + " values(seq_board_att.nextval, seq_board.currval, ?, ?)";
               ps = conn.prepareStatement(sql);
               ps.setString(1, sys);
               ps.setString(2, ori);

               r = ps.executeUpdate();
               if (r < 1)
                  rs = "데이터 저장중 오류 발생";

               // thumb nail 만들기
               if (sys.lastIndexOf(".png") >= 0 || sys.lastIndexOf(".gif") >= 0
                     || sys.lastIndexOf(".jpg") >= 0) {

                  makeThumb(sys);
               }

            }

         }
         if (r > 0) {
            conn.commit();
         } else {
            conn.rollback();
         }

         conn.close();

      } catch (Exception ex) {
         rs = "입력중 예외 발생";
         try {
            conn.rollback();
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
         ex.printStackTrace();
      }
      return rs;
   }

   public void makeThumb(String sys) {
      try {
         pb = new ParameterBlock();
         pb.add(sDirectory + sys);
         op = JAI.create("fileload", pb);

         bi = op.getAsBufferedImage();

         thumb = new BufferedImage(100, 100, BufferedImage.TYPE_INT_RGB);
         g2d = thumb.createGraphics();
         g2d.drawImage(bi, 0, 0, 100, 100, null);

         File file = new File(sDirectory + "thumb_" + sys);
         ImageIO.write(thumb, "png", file);

         System.gc();
      } catch (Exception ex) {
         ex.printStackTrace();
      }
   }

   public void pageCompute(String findStr) throws Exception {
      String sql = "select count(*) totSize from board "
            + " where subject like ? or content like ? ";

      ps = conn.prepareStatement(sql);
      ps.setString(1, "%" + findStr + "%");
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

   public ArrayList<BoardVo> select() {
      BoardVo vo = new BoardVo();
      vo.setNowPage(1);
      vo.setFindStr("");
      return select(vo);
   }

   public ArrayList<BoardVo> select(BoardVo vo) {

      this.nowPage = vo.getNowPage();

      ArrayList<BoardVo> list = new ArrayList<BoardVo>();

      try {
         pageCompute(vo.getFindStr());

         String sql = " select * from( " + "   select rownum rnum, b.* from ("
               + "     select a.*, (select count(*) from board_att "
               + "                  where a.serial=pserial)cnt "
               + "     from board a "
               + "     where subject like ? or content like ? "
               + "     order by grp desc, deep asc)b "
               + " ) where rnum between ? and ? ";

         ps = conn.prepareStatement(sql);
         ps.setString(1, "%" + vo.getFindStr() + "%");
         ps.setString(2, "%" + vo.getFindStr() + "%");
         ps.setInt(3, startNo);
         ps.setInt(4, endNo);

         rs = ps.executeQuery();
         while (rs.next()) {
            int deepCnt = rs.getString("deep").split("-").length;
            String temp = "";
            for (int i = 1; i < deepCnt; i++)
               temp += "&nbsp;&nbsp;";
            if (deepCnt > 1)
               temp += "┗ ";
            BoardVo v = new BoardVo();
            v.setSerial(rs.getInt("serial"));
            v.setmDate(rs.getDate("mdate").toString());
            v.setSubject(temp + rs.getString("subject"));
            v.setHit(rs.getInt("hit"));
            v.setCnt(rs.getInt("cnt"));
            v.setWorker(rs.getString("worker"));
            v.setNowPage(nowPage);
            list.add(v);
         }

      } catch (Exception ex) {
         ex.printStackTrace();
         list = null;
      }

      return list;
   }

   public BoardVo selectOne(int serial) {
      BoardVo v = new BoardVo();
      String sql = "";
      try {
         // 조회수 증가
         sql = "update board set hit=hit+1 where serial=?";
         ps = conn.prepareStatement(sql);
         ps.setInt(1, serial);
         ps.executeUpdate();

         // 한건 읽음
         sql = " select b.*, m.email email "
               + " from board b left join member m on b.worker = m.mid "
               + " where serial = ?";
         ps = conn.prepareStatement(sql);
         ps.setInt(1, serial);
         rs = ps.executeQuery();
         rs.next();
         v.setSerial(rs.getInt("serial"));
         v.setWorker(rs.getString("worker"));
         v.setSubject(rs.getString("subject"));

         if (rs.getString("content") != null) {
            v.setContent(rs.getString("content").replaceAll("\n", "<br/>"));
         } else {
            v.setContent("");
         }

         v.setmDate(rs.getDate("mdate").toString());
         v.setHit(rs.getInt("hit"));
         v.setEmail(rs.getString("email"));

         v.setGrp(rs.getInt("grp"));
         v.setDeep(rs.getString("deep"));

         // 첨부 파일
         Map<String, String> map = new HashMap<String, String>();
         sql = "select * from board_att where pserial = ?";
         ps = conn.prepareStatement(sql);
         ps.setInt(1, serial);
         rs = ps.executeQuery();
         while (rs.next()) {
            map.put(rs.getString("attfile"), rs.getString("oriattfile"));
         }
         if (map.size() == 0)
            map = null;
         v.setAttfile(map);

         conn.close();
      } catch (Exception ex) {
         v = null;
         ex.printStackTrace();
      }

      return v;
   }

   public String delete(int serial) {

      String r = "정상적으로 삭제됨";
      String sql = "";
      try {
         // board 삭제(serial)
         sql = "delete from board where serial = ? ";
         ps = conn.prepareStatement(sql);
         ps.setInt(1, serial);
         ps.executeUpdate();

         // board_att로 부터 첨부 파일 정보
         // 첨부 파일 삭제
         sql = "select attfile from board_att where pserial=?";
         ps = conn.prepareStatement(sql);
         ps.setInt(1, serial);
         rs = ps.executeQuery();
         while (rs.next()) {
            String file = sDirectory + rs.getString("attfile");
            File f = new File(file);
            if (f.exists())
               f.delete();

            // thumb nail 삭제
            file = sDirectory + "thumb_" + rs.getString("attfile");
            f = new File(file);
            if (f.exists())
               f.delete();

            f = null;

         }

         // board_att 삭제(pserial)
         sql = "delete from board_att where pserial = ?";
         ps = conn.prepareStatement(sql);
         ps.setInt(1, serial);
         ps.executeUpdate();

      } catch (Exception ex) {
         r = "삭제중 예외 발생";
         ex.printStackTrace();
      }

      return r;
   }

   public Map<String, Object> repl(HttpServletRequest request) {
      Map<String, Object> rMap = new HashMap<String, Object>();

      rMap.put("msg", "답변이 정상적으로 처리되었습니다.");

      try {
         MultipartRequest mr = new MultipartRequest(request, sDirectory, mSize,
               "utf-8", new DefaultFileRenamePolicy());

         String worker = mr.getParameter("worker");
         String subject = mr.getParameter("subject");
         String content = mr.getParameter("content");
         String pwd = mr.getParameter("pwd");
         int grp = Integer.parseInt(mr.getParameter("grp"));
         String deep = mr.getParameter("deep");

         String findStr = mr.getParameter("findStr");
         int nowPage = Integer.parseInt(mr.getParameter("nowPage"));

         conn.setAutoCommit(false);

         String sql = "insert into board("
               + " serial, mdate, worker, subject, content, hit, grp, deep, pwd)"
               + " values(seq_board.nextval, sysdate, ?, ?, ?, 0, "
               + "        ?, ? ||'-'||seq_board.currval, ? )";

         // rollback, commit

         ps = conn.prepareStatement(sql);
         ps.setString(1, worker);
         ps.setString(2, subject);
         ps.setString(3, content);

         ps.setInt(4, grp);
         ps.setString(5, deep);

         ps.setString(6, pwd);
         int r = ps.executeUpdate();
         if (r > 0) {
            Enumeration enumFile = mr.getFileNames();

            while (enumFile.hasMoreElements()) {
               String tag = (String) enumFile.nextElement();
               String ori = mr.getOriginalFileName(tag);
               String sys = mr.getFilesystemName(tag);

               if (ori == null)
                  continue;

               sql = "insert into board_att(serial, pserial, attfile, oriattfile) "
                     + " values(seq_board_att.nextval, seq_board.currval, ?, ?)";
               ps = conn.prepareStatement(sql);
               ps.setString(1, sys);
               ps.setString(2, ori);

               r = ps.executeUpdate();
               if (r < 1)
                  rMap.put("msg", "데이터 저장중 오류 발생");

               // thumb nail 만들기
               if (sys.lastIndexOf(".png") >= 0 || sys.lastIndexOf(".gif") >= 0
                     || sys.lastIndexOf(".jpg") >= 0) {

                  makeThumb(sys);
               }

            }
         }
         if (r > 0) {
            conn.commit();
         } else {
            conn.rollback();
         }

         conn.close();

         rMap.put("findStr", findStr);
         rMap.put("nowPage", nowPage);

      } catch (Exception ex) {
         rMap = null;
         ex.printStackTrace();
      }

      return rMap;
   }

   public Map<String, Object> modify(HttpServletRequest request) {
      Map<String, Object> rMap = new HashMap<String, Object>();
      int r = 0;
      int serial=1;
      int nowPage = 0;
      
      String sql = "";
      String rs = "초기값";
      String findStr = "";

      try {
         MultipartRequest mr = new MultipartRequest(request, sDirectory, mSize,
               "utf-8", new DefaultFileRenamePolicy());

         String subject = mr.getParameter("subject");
         String content = mr.getParameter("content");
         String pwd = mr.getParameter("pwd");

         serial = Integer.parseInt(mr.getParameter("serial"));
         findStr = mr.getParameter("findStr");
         nowPage = Integer.parseInt(mr.getParameter("nowPage"));

         // rollback, commit
         conn.setAutoCommit(false);

         // 내용 수정
         sql = "update board set subject = ? , content = ? "
               + " where serial = ? and pwd = ? ";
         ps = conn.prepareStatement(sql);
         ps.setString(1, subject);
         ps.setString(2, content);
         ps.setInt(3, serial);
         ps.setString(4, pwd);

         r = ps.executeUpdate();
         if (r <= 0) {
            rs= "데이터가 부정확하여  수정중 오류 발생";
         } else {
            // 삭제 파일 제거
            String[] delAtt = mr.getParameterValues("deleteAtt");
            if (delAtt != null) {
               for (int i = 0; i < delAtt.length; i++) {
                  rs = "정상적으로 수정되었습니다.";
                  File f = new File(sDirectory + delAtt[i]);
                  if(f.exists()) f.delete();
                  f = new File(sDirectory + "thumb_" + delAtt[i]);
                  if(f.exists()) f.delete();
                  
                  sql = "delete from board_att where attfile = ?";
                  ps = conn.prepareStatement(sql);
                  ps.setString(1, delAtt[i]);
                  r = ps.executeUpdate();

               }
            }

            Enumeration enumFile = mr.getFileNames();

            while (enumFile.hasMoreElements()) {
               String tag = (String) enumFile.nextElement();
               String ori = mr.getOriginalFileName(tag);
               String sys = mr.getFilesystemName(tag);

               if (ori == null) continue;

               sql = "insert into board_att(serial, pserial, attfile, oriattfile) "
                     + " values(seq_board_att.nextval, ?, ?, ?)";
               ps = conn.prepareStatement(sql);
               ps.setInt(1, serial);
               ps.setString(2, sys);
               ps.setString(3, ori);

               r = ps.executeUpdate();
               if (r > 0){
                  // thumb nail 만들기
                  if (sys.lastIndexOf(".png") >= 0 || sys.lastIndexOf(".gif") >= 0
                        || sys.lastIndexOf(".jpg") >= 0) {
                     makeThumb(sys);
                  }
               }else{
                  rs = "첨부 데이터 저장중 오류 발생";
               }

            }
         }
         conn.commit();
         conn.close();

      } catch (Exception ex) {
         try {
            conn.rollback();
            ex.printStackTrace();

         } catch (SQLException e) {
            e.printStackTrace();
         }
      }

      rMap.put("msg", rs);
      rMap.put("serial", serial);
      rMap.put("findStr", findStr);
      rMap.put("nowPage", nowPage);

      return rMap;
   }

   public Map<String, List<BoardVo>> newList() {
      // key=n이면 최신, h이면 인기자료
      Map<String, List<BoardVo>> map = new HashMap<String, List<BoardVo>>();
      String sql = "";
      try {
         // 최신자료 5개
         sql = " select * from( " + "   select rownum rnum, b.* from ("
               + "     select a.*, (select count(*) from board_att "
               + "                  where a.serial=pserial)cnt "
               + "     from board a " + "     where to_char(grp) = deep "
               + "     order by serial desc)b "
               + " ) where rnum between 1 and 5 ";
         ps = conn.prepareStatement(sql);
         rs = ps.executeQuery();

         List<BoardVo> nList = new ArrayList<BoardVo>();
         while (rs.next()) {
            BoardVo v = new BoardVo();
            v.setSerial(rs.getInt("serial"));
            v.setSubject(
                  rs.getString("subject") + "(" + rs.getInt("cnt") + ")");
            v.setWorker(rs.getString("worker"));
            nList.add(v);
         }
         map.put("n", nList);

         // 인기자료 5개
         sql = " select * from( " + "   select rownum rnum, b.* from ("
               + "     select a.*, (select count(*) from board_att "
               + "                  where a.serial=pserial)cnt "
               + "     from board a " + "     where to_char(grp) = deep "
               + "     order by hit desc)b " + " ) where rnum between 1 and 5 ";
         ps = conn.prepareStatement(sql);
         rs = ps.executeQuery();

         List<BoardVo> hList = new ArrayList<BoardVo>();
         while (rs.next()) {
            BoardVo v = new BoardVo();
            v.setSerial(rs.getInt("serial"));
            v.setSubject(
                  rs.getString("subject") + "(" + rs.getInt("cnt") + ")");
            v.setWorker(rs.getString("worker"));
            hList.add(v);
         }
         map.put("h", hList);

      } catch (Exception ex) {
         map = null;
         ex.printStackTrace();
      }

      return map;
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
