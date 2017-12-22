<%@page import="begin.BeginDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
// parameter test
BeginDao dao = new BeginDao();
String pwd = dao.getPwd("aaaa");

out.print("irum : " + pwd);


%>
</body>
</html>