<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>button_tag</title>
</head>
<body>
<h1>3가지 버튼</h1>
<ul>
	<li>button : 아무런 기능을 갖고 있지 않는 일반적인 버튼</li>
	<li>submit : 폼의 정보를 모두 서버로 전송하는 기능</li>
	<li>reset : 폼의 정보를 value속성으로 지정된 값으로 초기화</li>
</ul>

<form name='frm_button'>
	<input type='text' value='abc123가나다'>
	<p/>
	<input type='button' value='기본버튼'>
	<input type='submit' value='전송버튼'>
	<input type='reset' value='초기화'>

</form>





</body>
</html>