package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletTest extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
			
		resp.setContentType("text/html");
		resp.setCharacterEncoding("utf-8");
			
		Calendar c = Calendar.getInstance();
		int hour = c.get(Calendar.HOUR_OF_DAY);
		int minute = c.get(Calendar.MINUTE);
		int second = c.get(Calendar.SECOND);
		
		PrintWriter out = resp.getWriter();
		out.write("<html><head><title>Servlet Test</title></head>");
		out.write("<body><h1>");
		out.write("현재 시각은 ");
		out.write(hour + ":" + minute + ":" + second);
		out.write("</h1></body></html>");
		
		out.close();
		
		super.doGet(req, resp);
	}

}
