package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import bean.*;
public class LoginServlet2 extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		//요청정보와 응답정보 설정
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");

		PrintWriter out = resp.getWriter();
		//session 영역 가져오기
		HttpSession session = req.getSession();
		RequestDispatcher disp =null;
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		
		Connection conn = new DBConnect().getConn();
		String sql = "select userid, userpwd from member " 
		           + " where userid=? and userpwd=? ";
		try{
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pwd);
	
			ResultSet rs = ps.executeQuery();
		
			if(rs.next()){
				session.setAttribute("id",id);
				disp = req.getRequestDispatcher("tri_index.jsp");
				disp.forward(req, resp);
			}else{
				out.print("<script>alert('사용자 정보가 틀림');location.href='tri_index.jsp';</script>");
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
}
