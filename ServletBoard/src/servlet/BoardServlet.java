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
import bean.PageVo;

public class BoardServlet extends HttpServlet {
   BoardDao dao = new BoardDao();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String url = req.getRequestURI();
		doPost(req, resp);
		/*
		System.out.println(url);
		RequestDispatcher dispatcher = null;
		if(url.lastIndexOf("main.jsp") >=0){
			System.out.println("main.jsp run.....");
			dispatcher = req.getRequestDispatcher(
					"index.jsp?inc=./board_servlet/board_list.jsp");
			dispatcher.forward(req, resp);
		}else{
		}
		*/
		
	
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
			   insert(req);
				dispatcher = req.getRequestDispatcher(
						"index.jsp?inc=./board_servlet/board_input_result.jsp");
				dispatcher.forward(req, resp);
				
			}else if(url.lastIndexOf("list.do") >=0 ){
			   list(req);
				dispatcher = req.getRequestDispatcher(
						"index.jsp?inc=./board_servlet/board_list.jsp");
				dispatcher.forward(req, resp);
				
			}else if(url.lastIndexOf("view.do")>=0){
				view(req);
				dispatcher = req.getRequestDispatcher(
						"index.jsp?inc=./board_servlet/board_view.jsp");
				dispatcher.forward(req, resp);
				
			}else if(url.lastIndexOf("delete.do")>=0){
				delete(req);
				dispatcher = req.getRequestDispatcher(
				      "index.jsp?inc=./board_servlet/board_delete.jsp");
				dispatcher.forward(req, resp);

			}else if(url.lastIndexOf("selectOne.do")>=0){
				selectOne(req);
				dispatcher = req.getRequestDispatcher(
						"index.jsp?inc=./board_servlet/board_modify.jsp");
				dispatcher.forward(req, resp);
				
			}else if(url.lastIndexOf("modify.do")>=0){
				modify(req);
				dispatcher = req.getRequestDispatcher(
						"index.jsp?inc=./board_servlet/board_modify_result.jsp");
				dispatcher.forward(req, resp);
				
			}else if(url.lastIndexOf("repl.do")>=0){
				selectOne(req);
				dispatcher = req.getRequestDispatcher(
						"index.jsp?inc=./board_servlet/board_repl.jsp");
				dispatcher.forward(req, resp);
				
			}else if(url.lastIndexOf("repl_result.do")>=0){
				repl(req);
				dispatcher = req.getRequestDispatcher(
						"index.jsp?inc=./board_servlet/board_repl_result.jsp");
				dispatcher.forward(req, resp);
			}
	}
	
	public void insert(HttpServletRequest req){
      int rs = dao.insert(req);
      String msg="";
      if(rs>0){
         msg = "정상적으로 저장되었습니다.";
      }else{
         msg = "저장중 오류 발생";
      }
      req.setAttribute("msg", msg);
	}
	
	
	public void list(HttpServletRequest req){
      try{
         BoardVo v = new BoardVo();
         String findStr ="";
         int nowPage = 1;
         
         //처음 링크로 실행되었을 때 ----------------------------------------
         if(req.getParameter("findStr") != null){
            findStr = req.getParameter("findStr");
         }
         
         if(req.getParameter("nowPage") != null){
            nowPage = Integer.parseInt(req.getParameter("nowPage"));
         }
         // ---------------------------------------------------
         
         v.setFindStr(findStr);
         v.setNowPage(nowPage);
         List<BoardVo> list = dao.list(v);
         PageVo pVo = dao.getpVo();
         
         req.setAttribute("list", list);
         req.setAttribute("obj", v);
         req.setAttribute("page", pVo);

      }catch(Exception ex){
            ex.printStackTrace();
      }
	}
	
	public void view(HttpServletRequest req){
		BoardVo vo = new BoardVo();
		vo.setSerial(Integer.parseInt(req.getParameter("serial")));
		
		BoardDao dao = new BoardDao();
		BoardVo v = dao.view(vo);
		v.setFindStr(req.getParameter("findStr"));
		v.setNowPage(Integer.parseInt(req.getParameter("nowPage")));
		
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
			msg = "정상적으로 삭제되었습니다.";
		}else{
			msg = "삭제중 오류 발생";
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
