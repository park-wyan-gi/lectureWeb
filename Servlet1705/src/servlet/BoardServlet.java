package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDao;

public class BoardServlet extends HttpServlet{
	String url = "index.jsp?inc=./board/";
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

		PrintWriter pw = resp.getWriter();
		//pw.print("ok.......박원기");
		
		String uri= req.getRequestURI();
		
		dao = new BoardDao();
		
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
		}
		
	
	
	
	}
	
}
