<%@page import="board.BoardMyba"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Community Replay Register</title>
<link rel='Stylesheet' type='text/css' href='./board_myba/board.css'></link>
<script src='./board_myba/board.js'></script>
</head>
<body>
<jsp:useBean id="boardVo" class="board.BoardVo"/>
<jsp:setProperty property="*" name="boardVo"/>
<%
BoardMyba board = new BoardMyba();
board.setVo(boardVo);
%>
<li>serial = <%=boardVo.getSerial()%>
<li>grp = <%=boardVo.getGrp() %>
<li>deep = <%=boardVo.getDeep() %>

<div id='board_body'>
	<h1>Community Reply Register</h1>

	<form name='community_form' method='post' enctype='multipart/form-data'>
		<label>작성자</label>
		<input type='search' name='mid'><br/>
		<label>제목</label>
		<input type='search' name='subject' size='70'><br/>
		<textarea name='content' rows='5' cols='68'></textarea><br/>
		
		<label>암호</label>
		<input type='password' name='pwd'><br/>

		<label>파일첨부</label>
		<input type='file' name='filename'><br/>

		<input type='button' id='btnList' value='목록'>
		<input type='button' id='btnRepResult' value='저장'>
		<input type='hidden' name='grp' 
			 value="<%=boardVo.getGrp() %>">
		<input type='hidden' name='deep' 
			 value="<%=boardVo.getDeep() %>">
		<input type='hidden' name='part' 
			 value="<%=(String)session.getAttribute("part")%>">							 
	</form>
</div>
<script>init()</script>

</body>
</html>