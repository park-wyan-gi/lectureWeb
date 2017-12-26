<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='stylesheet' type='text/css' href='./css/guestbook.css?ver=<%=System.nanoTime()%>' />
<script src='./js/guestbook.js?ver=<%=System.nanoTime() %>'></script>
<title>Insert title here</title>
</head>
<body>
<%
String url = "index.jsp?inc=./guestbook/main.jsp&subInc=./guestbook/";
request.setAttribute("url",url);
%>
<div id='gb_main'>
	<h2>방명록</h2>
	<ul>
		<li><a href = '${url}list.jsp'>방명록 조회</a></li>
		<li><a href='${url }insert_form.jsp'>방명록 작성</a></li>
	</ul>
</div>
</body>
</html>