<%@page import="org.apache.tomcat.util.http.fileupload.RequestContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%
/*
 * 멀티 게시판에서 사용되는 데이터 전송 폼
 * 작성자 : pwg
 * 작성일 : 2014.6
*/
%>
<form name='sendForm' method='post'>
	<input type='hidden' name='mid' value = "<%=request.getParameter("mid")%>">
	<input type='hidden' name='serial' value = "<%=request.getParameter("serial")%>">
	<input type='hidden' name='find' value="<%=request.getParameter("find")%>">
	<input type='hidden' name='nowPage' value="<%=request.getParameter("nowPage")%>">
</form>

</body>
</html>