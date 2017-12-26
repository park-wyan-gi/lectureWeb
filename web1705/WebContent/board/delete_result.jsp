<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
<div id='brd_dr'>
	<h3>삭제 결과</h3>
	<%
		int serial = Integer.parseInt(request.getParameter("serial"));
	
		BoardDao dao = new BoardDao();
		String rs = dao.delete(serial);
		out.print(rs);
	%>

</div>

</body>
</html>