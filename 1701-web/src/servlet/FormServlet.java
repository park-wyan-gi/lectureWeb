package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FormServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		resp.setContentType("text/html;charset=utf-8");
		
		String mid = req.getParameter("mid");
		String pwd = req.getParameter("pwd");
		
		PrintWriter out = resp.getWriter();
		out.print("<li> 아이디 : " + mid);
		out.print("<li>암호 : " + pwd);
		
		out.close();
	}

	
}
