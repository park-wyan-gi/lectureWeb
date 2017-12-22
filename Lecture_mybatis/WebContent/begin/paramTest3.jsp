<%@page import="begin.BeginVo"%>
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
// 결과값이 boolean형 인경우
BeginDao dao = new BeginDao();
BeginVo vo = new BeginVo();
vo.setMid("aaaa");
vo.setPwd("1111");

boolean b = dao.login(vo);

out.print("Result : " + b);


%>
</body>
</html>