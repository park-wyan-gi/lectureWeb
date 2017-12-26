<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name='viewport' 
			content='width=device-width, initial-scale=1.0' />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index</title>
<link rel='stylesheet' type='text/css' 
					href='./css/index.css?ver=<%=System.nanoTime()%>' />
<script src = './js/index.js'></script>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String inc = "./member.jsp";
String subInc = "./javascript/if.jsp";
String sId = null;
if(session.getAttribute("sId") != null){
	sId = (String)session.getAttribute("sId");	
}


if(request.getParameter("inc") != null){
	inc = request.getParameter("inc");
}
if( request.getParameter("subInc") != null){
	subInc = request.getParameter("subInc");
}
%>
<div id='login'>
	<% 	if(sId == null){ 	%>
	<input type='button' value='로그인' id='btnLogin' />
	<%} else { %>
	[ <%=sId %> ] 
	<input type='button' value='로그아웃' id='btnLogout' />
	<%} %>
</div>

<div id='header'>
	<%@include file="./header.jsp" %>
</div>
<div id='main'>
	<div id='sub_menu'>
		<jsp:include page="<%=inc %>"></jsp:include>	
	</div>	
	<div id='contents'>
		<jsp:include page="<%=subInc %>"></jsp:include>
	</div>
	<div id='aside'>
		<%@include file="./aside1.jsp" %>
	</div>
</div>
<div id='footer'>
	<%@include file="./footer.jsp" %>
</div>


<script>init()</script>
</body>
</html>