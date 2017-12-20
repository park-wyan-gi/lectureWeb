<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
div{ border:0px solid #aaaaaa;}
#index{
	width:1100px;
	margin:0 auto;
}
#index > #content{
	width:100%;
	text-align: center;
}
</style>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String inc = "./board/list.jsp";
if(request.getParameter("inc") != null){
	inc = request.getParameter("inc");
}
%>
<div id='index'>
	<%@include file="header.jsp" %>
	
	<h1><center>Servlet으로 만드는 자료실</center></h1>
	
	<div id='content'>
		<jsp:include page="<%=inc %>" flush="true"/>
	
	</div>
	<div>
		<%@include file="footer.jsp" %>
	</div>
</div>


</body>
</html>