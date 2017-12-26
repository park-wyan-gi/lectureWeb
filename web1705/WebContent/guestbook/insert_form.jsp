<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
<div id='gb_insert'>
	<h3>방명록 입력</h3>
	<form name='frm_gb' method='post' >
	<label>작성자</label> 
	<input type='text' name='mid' size='6' readonly value='${sessionScope.sId }'/>
	<span class='rdate'><%=new Date().toLocaleString() %></span><br/>
	<textarea name='content' rows='6' cols='50'></textarea><br/>
	<label>암호</label>
	<input type='password' name='pwd' size='8'/><p/>
	<input type='button' value='작성' name='btnInsert' />
	</form>
</div>	
<script>gbInsert()</script>
</body>
</html>