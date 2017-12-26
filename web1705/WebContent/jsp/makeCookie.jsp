<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>makeCookie</title>
</head>
<body>
<%
Cookie cookie = 
		new Cookie("name", URLEncoder.encode("박원기", "utf-8"));
cookie.setMaxAge(10);
cookie.setPath("/");

response.addCookie(cookie);
%>
<h3>저장된 쿠키값</h3>
<ul>
	<li>name : <%=cookie.getName() %></li>
	<li>value : <%=cookie.getValue() %></li>
</ul>
</body>
</html>