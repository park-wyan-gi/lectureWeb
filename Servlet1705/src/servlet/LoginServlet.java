package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberDao;
import member.MemberVo;

public class LoginServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		//요청정보상태와 응답정보의 상태값 설정
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		RequestDispatcher disp = null;
		PrintWriter pw = resp.getWriter();
		
		String mid = req.getParameter("mid");
		String pwd = req.getParameter("pwd");
		
		boolean r = true; //회원정보가 있는 경우
		
		//TODO(DB를 연동하여 회원정보의 유무판단)
		MemberDao dao = new MemberDao();
		MemberVo vo = new MemberVo();
		vo.setMid(mid);
		vo.setPwd(pwd);
		MemberVo rVo = dao.login(vo);
		if(rVo ==null) r=false;
		
		
		if(r){
			//세션에 mid를 sId로 저장
			HttpSession session = req.getSession();
			session.setAttribute("sId", mid);

			//처리된 결과를 받을 페이지
			resp.sendRedirect("../index.jsp");
		}else{
			pw.print("login fail...");
		}
		
	
	}
}





