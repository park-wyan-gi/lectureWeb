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
	String uploadPath = "c:/workspace/1701-web/WebContent/upload/";
	String encoding = "utf-8";

	public BoardDao() {
		conn = new DBConnect().getConn();
	}

	public int insert(BoardVo vo) {
		int rs = 0; // 정성적으로 저장된 경우 0보다 큰값.
		PreparedStatement ps = null;
		String sql = "insert into board(serial, mdate, worker, subject, "
				+ " content, hit, grp, deep, attfile, ori_attfile) "
				+ " values(seq_board_serial.nextval, sysdate, ?, ?, ?, 0 , "
				+ "  seq_board_serial.currval, seq_board_serial.currval, ?, ?) ";
		try {
			conn = new DBConnect().getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getWorker());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setString(4, vo.getAttfile()[0] + "," + vo.getAttfile()[1]);
			ps.setString(5, vo.getOriAttfile()[0] + "," + vo.getOriAttfile()[1]);

			rs = ps.executeUpdate();

		} catch (Exception ex) {
			rs = -1;
			ex.printStackTrace();
		}
		return rs;
	}

	public List<BoardVo> list(BoardVo v) {
		PreparedStatement ps = null;
		ResultSet rs = null;
		String findStr = v.getFindStr();

		String sql = "select * from board where worker like ? or subject like ? or content like ? "
				+ " order by mdate desc";

		ArrayList<BoardVo> list = new ArrayList<BoardVo>();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + findStr + "%");
			ps.setString(2, "%" + findStr + "%");
			ps.setString(3, "%" + findStr + "%");
			rs = ps.executeQuery();

			while (rs.next()) {
				BoardVo vo = new BoardVo();
				vo.setSerial(rs.getInt("serial"));
				vo.setmDate(rs.getString("mdate"));
				vo.setWorker(rs.getString("worker"));
				vo.setSubject(rs.getString("subject"));
				vo.setHit(rs.getInt("hit"));

				list.add(vo);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return list;
		}
	}

	public int delete(BoardVo v) {
		PreparedStatement ps = null;
		// 첨부 파일 삭제
		BoardVo temp = selectOne(v);
		File deleteFile = null;
		if(temp.getAttfile() != null){
			for (String s : temp.getAttfile()) {
				deleteFile = new File(uploadPath + s);
				if (deleteFile.exists())
					deleteFile.delete();
			}
		}		
		String sql = "delete from board where serial=?";
		int r = 0;// 삭제 결과

		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, v.getSerial());
			r = ps.executeUpdate();
		} catch (Exception ex) {
			r = -1;
			ex.printStackTrace();
		} finally {
			return r;
		}
	}

	public BoardVo view(BoardVo vo) {
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "";
		BoardVo v = null;
		
		String[] attFile = null;
		String[] oriFile = null;
		
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
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "";
		BoardVo vo = new BoardVo();
		vo.setFindStr(v.getFindStr());
		vo.setNowPage(v.getNowPage());

		String[] attFile = null;
		String[] oriFile = null;
		
		try {
			sql = "select * from board where serial = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, v.getSerial());
			rs = ps.executeQuery();
			
			
			if (rs.next()) {
				
				if(rs.getString("attfile") != null) attFile = rs.getString("attfile").split(",");
				if(rs.getString("oriattfile") != null) oriFile = rs.getString("ori_attfile").split(",");
		
				vo.setSerial(rs.getInt("serial"));
				vo.setmDate(rs.getString("mDate"));
				vo.setWorker(rs.getString("worker"));
				vo.setSubject(rs.getString("subject"));
				vo.setContent(rs.getString("content"));
				vo.setHit(rs.getInt("hit"));
				vo.setGrp(rs.getInt("grp"));
				vo.setDeep(rs.getString("deep"));
				vo.setAttfile(attFile);
				vo.setOriAttfile(oriFile);
/*				
				if(rs.getString("attfile") != null) vo.setAttfile(rs.getString("attfile").split(","));
				else vo.setAttfile(",".split(","));
				
				if(rs.getString("ori_attfile") != null) vo.setAttfile(rs.getString("ori_attfile").split(","));
				else vo.setAttfile(",".split(","));

*/			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return vo;
		}
	}



	public BoardVo update(HttpServletRequest req) {
		PreparedStatement ps = null;
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
		File     delFile = null;
		
		try {
			// 첨부파일
			multi = new MultipartRequest(req, uploadPath, size, encoding,
					new DefaultFileRenamePolicy());
			
			vo = new BoardVo();
			vo.setSerial(Integer.parseInt(multi.getParameter("serial")));
			tempVo = selectOne(vo);//기존 파일명을 갖고 오기 위해
			
			Enumeration<String> files = multi.getFileNames();

			while(files.hasMoreElements()){
				tempFile = files.nextElement();
				String fileName1 = multi.getFilesystemName(tempFile);
				
				if(tempFile.equals("fileName1")){
					file1 = fileName1;
					oriFile1 = multi.getOriginalFileName(tempFile);
				}else{
					file2 = fileName1;
					oriFile2 = multi.getOriginalFileName(tempFile);
				}
			}

		
			//파일 삭제 및 파일명 설정
			if(file1 == null){
				if(tempVo.getAttfile() != null)  file1 = tempVo.getAttfile()[0];
				oriFile1 = tempVo.getOriAttfile()[0];
			}else{
				if(tempVo.getAttfile() != null) {
					delFile = new File(uploadPath +tempVo.getAttfile()[0]);
					if(delFile.exists()) delFile.delete();
				}
			}
			
			if(file2 == null){
				if(tempVo.getAttfile() != null) file2 = tempVo.getAttfile()[1];
				oriFile2 = tempVo.getOriAttfile()[1];
			}else{
				if(tempVo.getAttfile() != null){
					delFile = new File(uploadPath + tempVo.getAttfile()[1]);
					if(delFile.exists()) delFile.delete();
				}
			}
			
			vo.setSerial(Integer.parseInt(multi.getParameter("serial")));
			vo.setWorker(multi.getParameter("worker"));
			vo.setSubject(multi.getParameter("subject"));
			vo.setContent(multi.getParameter("content"));
			vo.setFindStr(multi.getParameter("findStr"));
			vo.setAttfile(new String[] { file1, file2 });
			vo.setOriAttfile(new String[] { oriFile1, oriFile2 });
			
			
			sql = "update board set subject=? , content=?, attfile=?, ori_attfile=? where serial=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getSubject());
			ps.setString(2, vo.getContent());
			ps.setString(3, vo.getAttfile()[0] + "," + vo.getAttfile()[1]);
			ps.setString(4, vo.getOriAttfile()[0] + "," + vo.getOriAttfile()[1]);
			ps.setInt(5, vo.getSerial());

			r = ps.executeUpdate();
		} catch (Exception ex) {
			vo = null;
			ex.printStackTrace();
		} finally {
			return vo;
		}
	}
	
	public BoardVo repl(HttpServletRequest req) {
		PreparedStatement ps = null;
		int r = 0;
		String sql = "insert into board(serial, mdate, worker, subject, "
				+ " content, hit, grp, deep, attfile, ori_attfile )"
				+ " values(seq_board_serial.nextval, sysdate, ?, ?, ?, 0, ?, "
				+ " ? || '-' || seq_board_serial.currval, ? , ?)";

		BoardVo vo = new BoardVo();
		int np = 1;
		String msg = "";

		MultipartRequest multi = null;

		try {
			multi = new MultipartRequest(req, uploadPath, size, encoding,
					new DefaultFileRenamePolicy());
			// 첨부파일
			Enumeration<String> files = multi.getFileNames();

			String file1 = files.nextElement();//file속성을 갖고 있는 태그명
			
			String fileName1 = multi.getFilesystemName(file1);
			String oriFileName1 = multi.getOriginalFileName(file1);

			file1 = files.nextElement();
			String fileName2 = multi.getFilesystemName(file1);
			String oriFileName2 = multi.getOriginalFileName(file1);

			vo.setSerial(Integer.parseInt(multi.getParameter("serial")));
			vo.setWorker(multi.getParameter("worker"));
			vo.setSubject(multi.getParameter("subject"));
			vo.setContent(multi.getParameter("content"));
			vo.setFindStr(multi.getParameter("findStr"));
			vo.setGrp(Integer.parseInt(multi.getParameter("grp")));
			vo.setDeep(multi.getParameter("deep"));
			vo.setAttfile(new String[] { fileName1, fileName2 });
			vo.setOriAttfile(new String[] { oriFileName1, oriFileName2 });

			if (multi.getParameter("nowPage").equals(""))
				np = 1;
			else
				np = Integer.parseInt(multi.getParameter("nowPage"));

			vo.setNowPage(np);

			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getWorker());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setInt(4, vo.getGrp());
			ps.setString(5, vo.getDeep());
			ps.setString(6, vo.getAttfile()[0] + "," + vo.getAttfile()[1]);
			ps.setString(7, vo.getOriAttfile()[0] + "," + vo.getOriAttfile()[1]);

			r = ps.executeUpdate();
		} catch (Exception ex) {
			vo = null;
			ex.printStackTrace();
		} finally {
			return vo;
		}
	}

	/* enctype이 없는 경우. 참조만...^^*/
	public int update(BoardVo v) {
		PreparedStatement ps = null;
		int r = 0;
		String sql = "";

		try {
			sql = "update board set subject=? , content=?, attifle=?, ori_attfile=? where serial=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, v.getSubject());
			ps.setString(2, v.getContent());
			ps.setString(3, v.getAttfile()[0] + "," + v.getAttfile()[1]);
			ps.setString(4, v.getOriAttfile()[0] + "," + v.getOriAttfile()[1]);
			ps.setInt(5, v.getSerial());

			r = ps.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			return r;
		}
	}


	public int repl(BoardVo vo) {
		PreparedStatement ps = null;
		int r = 0;
		String sql = "insert into board(serial, mdate, worker, subject, "
				+ " content, hit, grp, deep, attfile, ori_attfile )"
				+ " values(seq_board_serial.nextval, sysdate, ?, ?, ?, 0, ?, "
				+ " ? || '-' || seq_board_serial.currval, ? , ?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getWorker());
			ps.setString(2, vo.getSubject());
			ps.setString(3, vo.getContent());
			ps.setInt(4, vo.getGrp());
			ps.setString(5, vo.getDeep());
			ps.setString(6, vo.getAttfile()[0] + "," + vo.getAttfile()[1]);
			ps.setString(7, vo.getOriAttfile()[0] + "," + vo.getOriAttfile()[1]);

			r = ps.executeUpdate();
		} catch (Exception ex) {
			r = -1;
			ex.printStackTrace();
		} finally {
			return r;
		}
	}
	
}
