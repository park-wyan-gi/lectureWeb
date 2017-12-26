<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
<link rel='stylesheet' type='text/css'  href='../css/index.css' />
<script src = '../js/member.js'></script>
</head>
<body>
<div id='member_login'>
	<div id='header'>
		<%@include file="../header.jsp" %>
	</div>

	<div id='content'>
		<form name='frm_login' method='post'>
			<label>아이디</label>
			<input type='text' name='mid' /><br/>
			<label>암호</label>
			<input type='password' name='pwd' /><p/>
			<input type='button' name='btnLogin' value='로그인' />
			<input type='button' name='btnCancel' value='취소' />		
		</form>
	</div>

	<div id='footer'>
		<%@include file = '../footer.jsp' %>
	</div>
</div>
<script>initLogin()</script>
</body>
</html>








