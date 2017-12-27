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
String irum = "박원기";
String message = "반가워요...ajax";

out.print("<li>성명:" + irum);
out.print("<li>메시지:" + message);

%>
</body>
</html>