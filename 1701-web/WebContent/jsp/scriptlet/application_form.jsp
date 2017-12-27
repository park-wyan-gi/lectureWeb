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
application.setAttribute("msg","<div>aaaa</div>");

String msg = (String)application.getAttribute("msg");
out.print(msg);

%>


</body>
</html>