<%@page import="member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function fun(b){
	if(b==0){
		window.opener.document.frm_insert.mid.value = '';
	}
	self.close();
}
</script>
</head>
<body>
<div id='idCheck'>
	<h3>아이디 중복체크</h3>
<%
	String mid = request.getParameter("mid");
	
	MemberDao dao = new MemberDao();
	boolean b = dao.idCheck(mid);
	if(b){
		out.print(mid + " 는 사용 가능");
		out.print("<input type='button' value='닫기' onclick='fun(1)'>");
	}else{
		out.print(mid + " 는 사용 불가...");
		out.print("<input type='button' value='닫기' onclick='fun(0)'>");
	}
%>	
	
</div>
</body>
</html>