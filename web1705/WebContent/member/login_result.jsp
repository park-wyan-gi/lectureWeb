<%@page import="member.MemberDao"%>
<%@page import="member.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login_result</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="vo" class="member.MemberVo" scope="page"/>
<jsp:setProperty name="vo" property="*" />



<%
//String mid = request.getParameter("mid");
//String pwd = request.getParameter("pwd");
// MemberVo vo = new MemberVo();
//vo.setMid(mid);
//vo.setPwd(pwd);

MemberDao dao = new MemberDao();
MemberVo v = dao.login(vo);
if(v != null){
	session.setAttribute("sNic",v.getNicName());
	session.setAttribute("sId",v.getMid());
	response.sendRedirect("../index.jsp");
}else{
	out.print("아이디와 암호를 확인해 주세요!!!! <p/>");
	out.print("<a href='login.jsp'>로그인</a>");
}

%>
</body>
</html>







