<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>checkbox_result</title>
</head>
<body>
<h1>checkbox</h1>
<p>선택된 모든 정보가 전송</p>
<%
request.setCharacterEncoding("utf-8");
String[] chk = request.getParameterValues("chk");
for(String s : chk){
	out.print("<li>" + s);
}

%>
</body>
</html>