<%@page import="java.io.Writer"%>
<%@page import="java.io.StringWriter"%>
<%@page import="board.BoardMyba"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='Stylesheet' type='text/css' href='./board_myba/board.css'></link>
<title>파일 다운로드</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="boardVo" class="board.BoardVo"/>
<jsp:setProperty property="*" name="boardVo"/>
<%
BoardMyba board = new BoardMyba();
boardVo.setRequest(request);
board.setVo(boardVo);

out.clear();
out = pageContext.pushBody();
board.fileDownload(response);
%>
</body>
</html>













