<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>logout</title>
</head>
<body>
<%
session.setAttribute("sId", null);
response.sendRedirect("/Servlet1705/index.jsp");
%>
</body>
</html>