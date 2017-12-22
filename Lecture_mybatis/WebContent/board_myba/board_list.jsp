<%@page import="board.BrdListVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardMyba"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Community List</title>

</head>
<body>
<%
BoardMyba bm = new BoardMyba();
ArrayList al = (ArrayList)bm.getBrdList();
%>
<h1>COMMUNITY</h1>
게시판 갯수 : <%=al.size() %>
<ul>
<% for(int i=0; i<al.size() ; i++){
		BrdListVo v = (BrdListVo)al.get(i);	
	%>

	<li><a href='#' onclick="goBoard('<%=v.getBrdName()%>')"><%=v.getBrdName() %></a>
<!-- 	<li><a href='#' onclick="goBoard('qa')">QnA</a>
	<li><a href='#' onclick="goBoard('faq')">FAQ</a>
	<li><a href='#' onclick="goBoard('board')">Board</a>
	-->
<%}%>
	
</ul>
</body>
</html>