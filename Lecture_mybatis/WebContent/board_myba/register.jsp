<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>community(register)</title>
<link rel='Stylesheet' type='text/css' href='./board_myba/board.css'></link>
<script src='./board_myba/board.js'></script>
</head>
<body>
<%
String part = (String)session.getAttribute("part");
%>
<div id='board_body'>

	<h1>Community Register</h1>
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
		<input type='button' id='btnSave' value='저장'>
		<input type='hidden' name='part' value="<%=part%>">
	</form>
</div>
<script>init()</script>
</body>
</html>


