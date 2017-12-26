<%@page import="board.BoardDao"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src = 'http://code.jquery.com/jquery-3.2.1.min.js' ></script>
<script>
$(document).ready(function(){
	$url = 'index.jsp?inc=./board/new_list.jsp&subInc=./board/';
	$('#brd_ir #btnList').click(function(){
		$url += 'list.jsp';
		location.href = $url;
	});
	
	$('#brd_ir #btnInsert').click(function(){
		$url += 'insert.jsp';
		location.href = $url;
	});
	
})
</script>
</head>
<body>
<div id='brd_ir'>
	<h3>입력 결과</h3>
	<%
		BoardDao dao = new BoardDao();
		String rs = dao.insert(request);
		out.print(rs);
	%>
	<p/>
	<input type='button' value='목록으로' id='btnList'/>
	<input type='button' value='입력' id='btnInsert' />
</div>
</body>
</html>







