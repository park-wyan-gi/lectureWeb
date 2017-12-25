package servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.BoardDao;
import bean.BoardVo;

public class BoardServlet extends HttpServlet{
	String url = "index.jsp?inc=./board/board_";
	RequestDispatcher dispatcher;
	BoardDao dao;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		String uri = req.getRequestURI();
		dao = new BoardDao(req);
		
		//자료입력 버튼이 클릭된 경우
		if(uri.lastIndexOf("insert.do") >=0){
			dispatcher = req.getRequestDispatcher(url + "insert.jsp");
			dispatcher.forward(req, resp);
		}else if(uri.lastIndexOf("insertR.do") >= 0){
			//데이터를 DB에 저장하는 부분
			String msg = dao.insert(req);
			req.setAttribute("msg", msg);
			
			dispatcher = req.getRequestDispatcher(url + "insert_result.jsp");
			dispatcher.forward(req, resp);
			
			
		}else if(uri.lastIndexOf("list.do") >=0 ){
			String findStr = "";
			int nowPage = 1;
			BoardVo vo = new BoardVo();
			if(req.getParameter("findStr") != null){
				findStr = req.getParameter("findStr");
			}
			if(req.getParameter("nowPage") != null){
				nowPage = Integer.parseInt(req.getParameter("nowPage"));
			}
			
			vo.setFindStr(findStr);
			vo.setNowPage(nowPage);
			
			List<BoardVo> list = dao.select(vo);
			
			req.setAttribute("list", list);
			req.setAttribute("dao", dao);
			
			dispatcher = req.getRequestDispatcher(url + "list.jsp");
			dispatcher.forward(req, resp);
			
			
		}else if(uri.lastIndexOf("view.do") >=0){
			int serial = Integer.parseInt(req.getParameter("serial"));
			BoardVo vo = dao.selectOne(serial);
			
			req.setAttribute("vo", vo);
			
			dispatcher = req.getRequestDispatcher(url + "view.jsp");
			dispatcher.forward(req, resp);
			
		}else if(uri.indexOf("modify.do") >=0){
			int serial = Integer.parseInt(req.getParameter("serial"));
			BoardVo vo = dao.selectOne(serial);
			req.setAttribute("vo",vo);
			
			dispatcher = req.getRequestDispatcher(url + "modify.jsp");
			dispatcher.forward(req, resp);
			
		}else if(uri.indexOf("modifyR.do") >=0){
			Map<String, Object> map = dao.modify(req);
			
			req.setAttribute("rMap", map);
			
			dispatcher = req.getRequestDispatcher(url + "modify_result.jsp");
			dispatcher.forward(req, resp);
			
		}else if(uri.indexOf("repl.do") >=0){
			int grp = Integer.parseInt(req.getParameter("grp"));
			String deep = req.getParameter("deep");
			
			req.setAttribute("grp", grp);
			req.setAttribute("deep", deep);
			
			dispatcher = req.getRequestDispatcher(url + "repl.jsp");
			dispatcher.forward(req, resp);
			
			
		}else if(uri.indexOf("replR.do") >=0){
			Map<String, Object> map = dao.repl(req);
			req.setAttribute("rMap", map);
			
			dispatcher = req.getRequestDispatcher(url + "repl_result.jsp");
			dispatcher.forward(req, resp);
			
		}else if(uri.indexOf("deleteR.do") >=0){
			int serial = Integer.parseInt(req.getParameter("serial"));
			String rs = dao.delete(serial);
			req.setAttribute("rs",rs);
			
			dispatcher = req.getRequestDispatcher(url + "delete_result.jsp");
			dispatcher.forward(req, resp);
		}
	
	}
	
}
