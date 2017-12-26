<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>radio_result</title>
</head>
<body>
<h1>radio result</h1>
<p>라디오 버튼은 선택된 한개만이 서버로 전송</p>
<%
String chk = request.getParameter("chk");
out.print("radio = " + chk);
%>
</body>
</html>