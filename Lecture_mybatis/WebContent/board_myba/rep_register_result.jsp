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
BoardMyba board = new BoardMyba();
boardVo.setRequest(request);
board.setVo(boardVo);
%>
<div id='board_body'>

	<h1>Community Reply Result</h1>
	<%
	if(board.repInsert()){
		out.print("답글이 입력 되었습니다.");
	}else{
		out.print("답글입력시 오류 발생");
	}
	%>

	<input type='button' value='목록' id='btnList'>
</div>

<script>init()</script>

</body>
</html>