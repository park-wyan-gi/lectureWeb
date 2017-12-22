<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src = './js/member.js'></script></head>
<style>
div{ border:0px solid #aaaaaa;}
#index{
	width:1100px;
	margin:0 auto;
}
#index > #center{
	overflow: hidden;
	vertical-align: top;
}

#index  #left{
	background-color:#eeeeee;
	width:194px;
	vertical-align: top;
}
#index  #content{
	width:900px;
}
#index #center > div {
	display: inline-block;
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
	<div id='center'>
		<div id='left'>
			<%@include file="./new_list.jsp" %>
		</div>
		<div id='content'>
			<jsp:include page="<%=inc %>" flush="true"/>
		</div>
	</div>
	<div>
		<%@include file="footer.jsp" %>
	</div>
</div>


</body>
</html>