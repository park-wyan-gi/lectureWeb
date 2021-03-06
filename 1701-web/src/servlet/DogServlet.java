package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DogServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		//요청정보중 한글이 깨지는 겨우
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		//checkbox의 값을 가져옴.
		String[] dog = req.getParameterValues("dog");
		
		// 브라우저에 출력하기 위한 객체
		PrintWriter out = resp.getWriter();
		
		out.print("<ul>");
		for(int i=0 ; i<dog.length ; i++){
			out.print("<li>" + dog[i] + "</li>");
		}
		out.print("</ul>");
		out.close();
	}

}
