<%@page import="board.BoardMyba"%>
<%@page import="board.BoardVo"%>
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
board.setVo(boardVo);
BoardVo vo = board.view();
if(vo == null) out.print("데이터가 없거나 변경되었습니다.");
else{ %>
<div id='board_body'>
	<h1>Community Details</h1>
	
	<ul>
		<li>Serial : <%=boardVo.getSerial() %>
		<li>작성자 : <%=vo.getMid()%>
		<li>작성일 : <%=vo.getMdate() %>
		<li>제목 : <%=vo.getSubject() %> 
		<li>내용 : <%=vo.getContent() %>
		<%if(vo.getFilename()!=null && vo.getFilename()!="") {%>
			<li>첨부파일 :
			<a href='#' onclick="fileDownload('<%=vo.getFilename()%>')">
				<%=vo.getFilename() %>	
			</a>
		<%} %>	
		<li>관심지수 :<%=vo.getHit() %>
	</ul>

	<input type='button' value='목록' id='btnList'>
	<input type='button' value="수정" onclick='modify(<%=vo.getSerial()%>)'>
	<input type='button' value="댓글" 
		onclick='rep(<%=vo.getSerial()%>,<%=vo.getGrp()%>, "<%=vo.getDeep()%>")'>
	<input type='button' value="삭제" 
		onclick="del(<%=vo.getSerial()%>,'<%=vo.getFilename()%>')">
	
</div>

<%} %>

<script>init()</script>
<iframe name='filedownload' id='filedownload' width='0px' height='0px' src="about:blank" frameBorder=0></iframe>
</body>
</html>





