<%@page import="bean.BoardDao"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="bean.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>board_delete.jsp</title>
</head>
<body>
<h2>게시판 삭제(Servlet)</h2>
${msg }
<p/>
<form name='frm_board' method='post'  action = 'list.do'>
   <input type='hidden' name='serial'       value ="${obj.serial }"/>
   <input type='hidden' name='nowPage'  value ="${obj.nowPage }"/>
   <input type='hidden' name='findStr'     value ="${obj.findStr }"/>
   <input type='submit' value='목록으로'/>    
</form>
</body>
</html>