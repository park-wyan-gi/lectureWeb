<%@page import="board.BoardMyba"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel='Stylesheet' type='text/css' href='./board_myba/board.css'></link>
<script src='./board_myba/board.js'></script>
</head>
<body>
<jsp:useBean id="boardVo" class="board.BoardVo"/>
<%
String part = (String)session.getAttribute("part");
BoardMyba board = new BoardMyba();
boardVo.setRequest(request);
board.setVo(boardVo);
%>
<div id='board_body'>

	<h1>Community Register Result</h1>
	<%
	if(board.insert()){
		out.print(part.toUpperCase() + " 게시판에 자료가 정상적으로 입력되었습니다.");		
	}else{
		out.print("저장중 오류 발생");
	}
	%>	

	<input type='button' value='목록' id='btnList'>
</div>

<script>init()</script>
</body>
</html>