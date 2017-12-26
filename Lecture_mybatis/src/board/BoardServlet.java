package board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sun.awt.RepaintArea;

public class BoardServlet extends HttpServlet{
	//String url = "index.jsp?inc_left=./board_myba/board_list.jsp&inc=./board_myba/";
	String url = "./board_myba/";
	RequestDispatcher dispatcher;
	BoardMyba myba;
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		myba = new BoardMyba(req);
		
		
		String inc = req.getParameter("inc");
		if(inc==null){
			inc = req.getRequestURI();
		}
		
		if(inc.lastIndexOf("index.do")>=0){
			dispatcher = req.getRequestDispatcher("/index.jsp");
			dispatcher.forward(req, resp);
			
			
//			dispatcher = req.getRequestDispatcher(url + "board_list.jsp");
//			List<String> list = myba.getBrdList();
//			req.setAttribute("board_list", list);
//			dispatcher.include(req, resp);
//
//			dispatcher = req.getRequestDispatcher("nonpage.jsp");
//			dispatcher.include(req, resp);
//
//			List<BoardVo> list2 = myba.list();
//			
//			req.setAttribute("list", list2);
//			req.setAttribute("dao", myba);
			

			
		}else if(inc.lastIndexOf("board_list.do")>=0){
			dispatcher = req.getRequestDispatcher(url + "board_list.jsp");
			List<String> list = myba.getBrdList();
			req.setAttribute("board_list", list);
			dispatcher.include(req, resp);
			
			
		}else if(inc.lastIndexOf("aside.do")>=0){
			dispatcher = req.getRequestDispatcher("nonpage.jsp");
			dispatcher.include(req, resp);
			
			
		}else if(inc.lastIndexOf("test.do")>=0){
			dispatcher = req.getRequestDispatcher("test.jsp");
			req.setAttribute("test", "park w.g");
			dispatcher.include(req, resp);
			
		}else if(inc.lastIndexOf("list.do") >=0){
			List<BoardVo> list = myba.list();
			
			req.setAttribute("list", list);
			req.setAttribute("dao", myba);
			
			
			dispatcher = req.getRequestDispatcher(url + "list.jsp");
			dispatcher.include(req, resp);

		}
		
	}
}
