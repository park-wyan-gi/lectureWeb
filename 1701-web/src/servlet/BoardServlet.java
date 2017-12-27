package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import bean.BoardDao;
import bean.BoardVo;

public class BoardServlet extends HttpServlet {

	int size = 1024*1024*10;
	String uploadPath = "c:/workspace/1701-web/WebContent/upload/";
	String encoding = "utf-8";
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
			req.setCharacterEncoding("utf-8");
			resp.setContentType("text/html;charset=utf-8");
		
			String url = req.getRequestURI();
			RequestDispatcher dispatcher = null;
			String msg="";
			if(url.lastIndexOf("insert.do") >= 0){
				int rs = insert(req, resp);
				
				dispatcher = req.getRequestDispatcher(
						"tri_index.jsp?inc=../../board_servlet/board_input_result.jsp");
				
				if(rs>0){
					msg = "정상적으로 저장되었습니다.";
				}else{
					msg = "저장중 오류 발생";
				}
				req.setAttribute("msg", msg);
				dispatcher.forward(req, resp);
				
			}else if(url.lastIndexOf("list.do") >=0 ){
				try{
				BoardVo v = new BoardVo();
				String findStr ="";
				if(req.getParameter("findStr") == null){
					findStr = "";
				}else{
					findStr = req.getParameter("findStr");
				}
				v.setFindStr(findStr);
				List<BoardVo> list = list(v);
				dispatcher = req.getRequestDispatcher(
						"tri_index.jsp?inc=../../board_servlet/board_list.jsp");
				req.setAttribute("list", list);
				req.setAttribute("findStr", findStr);
				dispatcher.forward(req, resp);
				}catch(Exception ex){
					ex.printStackTrace();
				}
			}else if(url.lastIndexOf("view.do")>=0){
				view(req);
				dispatcher = req.getRequestDispatcher(
						"tri_index.jsp?inc=../../board_servlet/board_view.jsp");
				dispatcher.forward(req, resp);
				
			}else if(url.lastIndexOf("delete.do")>=0){
				delete(req);
				dispatcher = req.getRequestDispatcher(
						"tri_index.jsp?inc=../../board_servlet/board_delete.jsp");
				dispatcher.forward(req, resp);

			}else if(url.lastIndexOf("selectOne.do")>=0){
				selectOne(req);
				dispatcher = req.getRequestDispatcher(
						"tri_index.jsp?inc=../../board_servlet/board_modify.jsp");
				dispatcher.forward(req, resp);
				
			}else if(url.lastIndexOf("modify.do")>=0){
				modify(req);
				dispatcher = req.getRequestDispatcher(
						"tri_index.jsp?inc=../../board_servlet/board_modify_result.jsp");
				dispatcher.forward(req, resp);
				
			}else if(url.lastIndexOf("repl.do")>=0){
				selectOne(req);
				dispatcher = req.getRequestDispatcher(
						"tri_index.jsp?inc=../../board_servlet/board_repl.jsp");
				dispatcher.forward(req, resp);
				
			}else if(url.lastIndexOf("repl_result.do")>=0){
				repl(req);
				dispatcher = req.getRequestDispatcher(
						"tri_index.jsp?inc=../../board_servlet/board_repl_result.jsp");
				dispatcher.forward(req, resp);
			}
	}
	
	public int insert(HttpServletRequest req, HttpServletResponse resp){
		int rs = 0;
		MultipartRequest multi = null;
		
		try{
			multi = new MultipartRequest(req,
					uploadPath,
					size,
					encoding,
					new DefaultFileRenamePolicy());
			//첨부파일
			Enumeration<String> files = multi.getFileNames();
			
			String file1 = files.nextElement();
			String fileName1 = multi.getFilesystemName(file1);
			String oriFileName1 = multi.getOriginalFileName(file1);
			
			file1 = files.nextElement();
			String fileName2 = multi.getFilesystemName(file1);
			String oriFileName2 = multi.getOriginalFileName(file1);
			
			BoardVo vo = new BoardVo();
			vo.setWorker(multi.getParameter("worker"));
			vo.setSubject(multi.getParameter("subject"));
			vo.setContent(multi.getParameter("content"));
			vo.setAttfile(new String[]{fileName1,fileName2});
			vo.setOriAttfile(new String[]{oriFileName1,oriFileName2});
			
			BoardDao dao = new BoardDao();
			rs = dao.insert(vo);
			
		}catch(Exception ex){
			rs = -1;
			ex.printStackTrace();
		}finally{
			return rs;
		}
	}
	
	public List<BoardVo> list(BoardVo v){
		BoardDao dao = new BoardDao();
		List<BoardVo> list = dao.list(v);
		
		return list;
	}
	
	public void view(HttpServletRequest req){
		BoardVo vo = new BoardVo();
		vo.setSerial(Integer.parseInt(req.getParameter("serial")));
		int np  = 1;
		if(req.getParameter("nowPage").equals("")) np = 1;
		else np = Integer.parseInt(req.getParameter("nowPage"));
		
		BoardDao dao = new BoardDao();
		BoardVo v = dao.view(vo);
		v.setFindStr(req.getParameter("findStr"));
		v.setNowPage(np);
		
		req.setAttribute("obj", v);
		
	}
	public void delete(HttpServletRequest req){
		BoardVo vo = new BoardVo();
		vo.setSerial(Integer.parseInt(req.getParameter("serial")));
		int np  = 1;
		String msg = "";
		
		if(req.getParameter("nowPage").equals("")) np = 1;
		else np = Integer.parseInt(req.getParameter("nowPage"));
		
		BoardDao dao = new BoardDao();
		vo.setFindStr(req.getParameter("findStr"));
		vo.setNowPage(np);
		
		int r = dao.delete(vo);
		if(r>0){
			msg = "정상적으로 수정되었습니다.";
		}else{
			msg = "수정중 오류 발생";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("obj", vo);
		
	}
	public void selectOne(HttpServletRequest req){
		BoardVo vo = new BoardVo();
		vo.setSerial(Integer.parseInt(req.getParameter("serial")));
		int np  = 1;
		if(req.getParameter("nowPage").equals("")) np = 1;
		else np = Integer.parseInt(req.getParameter("nowPage"));
		
		BoardDao dao = new BoardDao();
		BoardVo v = dao.selectOne(vo);
		v.setFindStr(req.getParameter("findStr"));
		v.setNowPage(np);
		
		req.setAttribute("obj", v);
		
	}
	public void modify(HttpServletRequest req){
		BoardDao dao = new BoardDao();
		BoardVo vo = null;
		int np  = 1;
		String msg = "";
		
		vo = dao.update(req);
		if(vo != null){
			msg = "정상적으로 수정되었습니다.";
		}else{
			msg = "수정중 오류 발생";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("obj", vo);
	}
	public void repl(HttpServletRequest req){
		BoardDao dao = new BoardDao();
		String msg = "";
  		BoardVo vo = null;
		vo= dao.repl(req);
		if(vo != null){
			msg = "답변이 저장되었습니다.";
		}else{
			msg = "답변처리중 오류 발생";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("obj", vo);
		
	}
}
