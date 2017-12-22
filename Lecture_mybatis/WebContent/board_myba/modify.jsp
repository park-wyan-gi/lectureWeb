<%@page import="board.BoardMyba"%>
<%@page import="board.BoardVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>통합 게시판 수정폼(modify)</title>
<link rel='Stylesheet' type='text/css' href='./board_myba/board.css'></link>
<script src='./board_myba/board.js'></script>
</head>
<body>
<jsp:useBean id="boardVo" class="board.BoardVo"/>
<jsp:setProperty property="*" name="boardVo"/>
<%
BoardMyba board = new BoardMyba();
board.setVo(boardVo);
BoardVo vo = board.view();
%>


<div id='board_body'>

	<h1>Community Modify</h1>
	<form name='community_form' method='post' 
			enctype='multipart/form-data'>
		<label>작성자</label>
		<input type='search' name='mid' readonly value="<%=vo.getMid()%>"><br/>
		<label>제목</label>
		<input type='search' name='subject' size='70' value="<%=vo.getSubject()%>"><br/>
		<textarea name='content' rows='5' cols='68'><%=vo.getContent() %></textarea><br/>
		<label>파일명 : </label>
		<%
		if(vo.getFilename() == null || 
			boardVo.getFileDelFlag().equals("del")){
		%>
		<input type='file' name='newfilename'>
		<br/>
		삭제될 파일명 : <%=vo.getFilename() %>
		<%}else {%>
			<%=vo.getFilename() %>
		<input type='button' value='삭제' 
			onclick ="fileDel('del',<%=vo.getSerial()%> )">
		
		<%} %>
		<br/>
		<label>암호</label>
		<input type='password' name='pwd'><br/>
		<input type='button' id='btnList' value='목록'>
		<input type='button' id='btnModifyResult' value='저장'>

		<input type='hidden' name='filename' 
				value="<%=vo.getFilename()%>">
		<input type='hidden' name='serial' 
				value='<%=vo.getSerial()%>'>
		<input type='hidden' name='fileDelFlag' 
				value='<%=boardVo.getFileDelFlag()%>'>
		
	</form>
</div>
<script>init()</script>
</body>
</html>