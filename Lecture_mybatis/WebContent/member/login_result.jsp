<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login_result.jsp</title>
</head>
<body>
<% // 넘겨받은 mid를 세션에 등록하고 다시 메인페이지로 이동
String mid = request.getParameter("mid");
session.setAttribute("mid", mid); // 센션에 등록작업
response.sendRedirect("../index.jsp");
%>
</body>
</html>