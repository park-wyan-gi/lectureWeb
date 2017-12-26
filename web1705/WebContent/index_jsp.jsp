<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>JSP Exmaple</h3>
<%
String url = "index.jsp?inc=index_jsp.jsp&subInc=./jsp/";
%>
<ol>
	<li><a href='<%=url %>declare.jsp'>선언문</a></li>
	<li><a href='<%=url %>makeCookie.jsp'>쿠키생성</a></li>
	<li><a href='<%=url %>viewCookie.jsp'>쿠키보기</a></li>
	
</ol>
</body>
</html>