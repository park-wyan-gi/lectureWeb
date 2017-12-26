<%@page import="board.BrdListVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardMyba"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Community List</title>

</head>
<body>
<H3>Community</H3>
<ul>
	<c:forEach var='data' items="${board_list }">
		<li><a href='#' onclick="goBoard('${data}')">${data }</a></li>		
	</c:forEach>
	<li><a href='#' onclick="goBoard('qa')">QnA</a>
	<li><a href='#' onclick="goBoard('faq')">FAQ</a>
	
</ul>
 	
<form name='board_list' method='post'>
	<input type='hidden' name='part' />
</form>
	

</body>
</html>