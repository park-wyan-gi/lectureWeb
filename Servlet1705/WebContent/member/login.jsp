<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
<style>
#frm_login{
	text-align: center;
}
</style>
</head>
<body>

<form name='frm_login' method='post' action='login' id='frm_login'>
	<h2>로그인</h2>
	<label>아이디</label>
	<input type='text' name='mid' /><br/>
	<label>암 호</label>
	<input type='password' name='pwd' />
	<p/>
	<input type='submit' value='로그인' />
</form>

</body>
</html>