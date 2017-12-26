<%@page import="java.util.Map"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src = 'http://code.jquery.com/jquery-3.2.1.min.js' ></script>
<script>
$(document).ready(function(){
	$url = 'index.jsp?inc=./board/new_list.jsp&subInc=./board/';
	$('#brd_mr #btnList').click(function(){
		$url += 'list.jsp';
		$frm = document.frm_brd;
		$frm.action = $url;
		$frm.submit();
	});
	

})
</script>
</head>
<body>
<div id='brd_mr'>
	<h3>수정 결과</h3>
	
	<%
		BoardDao dao = new BoardDao();
		Map rMap = dao.modify(request);
		request.setAttribute("rMap", rMap);
		
	%>
	${rMap['rs']}....
	<p/>
	<form name='frm_brd' method='post'>
		<input type='text' name='nowPage' value="${rMap['nowPage'] }"/> 
		<input type='text' name='findStr' value="${rMap['findStr'] }"/> 
		<input type='button' value='목록으로' id='btnList'/>
	</form>	
</div>
</body>
</html>