<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원관리</title>
<link rel='stylesheet' type='text/css'  href='../css/index.css' />
<link rel='stylesheet' type='text/css' href='../css/member.css' />


<body>
<%
request.setCharacterEncoding("utf-8");

String inc = "./member.jsp";
String aside = "../aside1.jsp";
String sId = null;
if(session.getAttribute("sId") != null){
	sId = (String)session.getAttribute("sId");	
}


if(request.getParameter("inc") != null){
	inc = request.getParameter("inc");
}


%>
<div id='member'>
	<div id='login'>
		<% 	if(sId == null){ 	%>
		<input type='button' value='로그인' id='btnLogin' />
		<%} else { %>
		[ <%=sId %> ] 
		<input type='button' value='로그아웃' id='btnLogout' />
		<%} %>
	</div>
	<div id='header'>
		<%@include file="../header.jsp" %>
	</div>
	<div id='center'>
		<div id='content'>
			<jsp:include page="${param.inc}"></jsp:include>
		</div>
		<div id='aside'>
			<jsp:include page="<%=aside %>"></jsp:include>
		</div>
	</div>
	<div id='footer'>
		<%@include file = '../footer.jsp' %>
	</div>
</div>
<script>initLogin()</script>
</body>
</html>