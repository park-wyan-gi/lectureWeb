<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src = '../jq_lib/jquery-3.2.1.min.js'></script>
<script>
$(document).ready(function(){
	$('#frm').submit(function(){
		var data = $(this).serialize();
		alert(data);
		return false;
	});
});

</script>
</head>
<body>
<h2>serialize : form에 있는 값을 get형태의 파라메터 타입으로 변경</h2>
<form name='frm' id='frm' >
	<label>닉네임</label>
	<input type='text' name='nic' value='park'><br/>
	<label>암호</label>
	<input type='password' name='pwg' value='1234'><br/>
	<input type='hidden' name='mid' value='a001'><p/>
	
	<input type='submit' value='Serialize'>

</form>
</body>
</html>