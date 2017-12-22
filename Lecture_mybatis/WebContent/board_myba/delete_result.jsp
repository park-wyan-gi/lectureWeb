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
<jsp:setProperty property="*" name="boardVo"/>
<%
BoardMyba board = new BoardMyba();
boardVo.setFileid(boardVo.getSerial());
board.setVo(boardVo);
%>

<div id='board_body'>
	<h1>Community Delete Result</h1>
	<%
	if(board.delete()){
		out.print("정상적으로 삭제되었습니다.");
	}else{
		out.print("삭제중 오류 발생.");
	}
	
	%>
	<input type='button' value='목록' id='btnList'>
</div>
<script>init()</script>
</body>
</html>



