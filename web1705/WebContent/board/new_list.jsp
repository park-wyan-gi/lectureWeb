<%@page import="java.util.Map"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#brd_newlist  a {
	text-decoration: none;
}
#brd_newlist  a:hover {
	text-decoration: underline;
	font-weight: bolder;
}
</style>
</head>
<body>
<%
BoardDao dao = new BoardDao();
Map map = dao.newList();
request.setAttribute("map", map);
%>

<div id='brd_newlist'>
	<h4>최근 자료</h4>
		<ul>
			<c:set var="nlist" value="${map.get('n') }" />
			<c:forEach var='n' items="${nlist}">
				<li><a href='#' onclick='go(${n.serial })'>
						${n.subject } 
				</a></li>
			
			</c:forEach>
		</ul>
	<h4>인기 자료</h4>
		<ul>
			<c:set var="hlist" value="${map.get('h') }" />
			<c:forEach var='n' items="${hlist}">
				<li><a href='#' onclick='go(${n.serial })'>
						${n.subject } 
				</a></li>
			
			</c:forEach>
		</ul>
	
</div>

<script>
function go(serial){
	var frm = document.frm_brd;
	frm.serial.value = serial;
	frm.action = 'index.jsp?inc=./board/new_list.jsp'
			     + '&subInc=./board/view.jsp';
	frm.submit();
}
</script>
</body>
</html>