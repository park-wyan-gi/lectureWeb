<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name='viewport' content='width=device-width'>
<title>requestTest1.jsp</title>
</head>
<body>
<h3>form 정보를 받는 페이지<hr/></h3>
<%
request.setCharacterEncoding("utf-8");
String irum = request.getParameter("irum");
String gender = request.getParameter("gender");
String[] hobby = request.getParameterValues("hobby");

%>

이름 : <%=irum %><br/>
성별 : <%=gender %><br/>
취미 : <%=Arrays.toString(hobby) %>


<%
/* 현재 정보를 다른 페이지에 전달 */
pageContext.forward("requestTest2.jsp");
%>


</body>
</html>