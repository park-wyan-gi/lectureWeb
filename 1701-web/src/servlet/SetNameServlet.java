package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SetNameServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//요청정보와 응답정보 설정
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		//session 영역 가져오기
		HttpSession session = req.getSession();
		session.setAttribute("name","박원기");
		
		PrintWriter out = resp.getWriter();
		out.println("<h1>이름이 세션에 저장되었습니다.</h1>");
	}

}
