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
	$('#btnSend').click(function(){
		var param = $('form').serialize();
		var url ='foreach_result.jsp?'+param;
		$('#result').load(url);
	});
});
</script>
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>

<h2>mybatis의 동적 sql 문장 (foreach)</h2>

<form name='frm' method='post'>
	<label>검색할 월은?</label>
	<label><input type='checkbox' name='month' value='01'>1</label>
	<label><input type='checkbox' name='month' value='02'>2</label>
	<label><input type='checkbox' name='month' value='03'>3</label>
	<label><input type='checkbox' name='month' value='04'>4</label>
	<label><input type='checkbox' name='month' value='05'>5</label>
	<label><input type='checkbox' name='month' value='06'>6</label>
	<label><input type='checkbox' name='month' value='07'>7</label>
	<label><input type='checkbox' name='month' value='08'>8</label>
	<label><input type='checkbox' name='month' value='09'>9</label>
	<label><input type='checkbox' name='month' value='10'>10</label>
	<label><input type='checkbox' name='month' value='11'>11</label>
	<label><input type='checkbox' name='month' value='12'>12</label>

	<p/>
	<label>작성자?</label>
	<label><input type='checkbox' name='worker' value='홍길동'>홍길동</label>
	<label><input type='checkbox' name='worker' value='kim'>kim</label>
	<label><input type='checkbox' name='worker' value='pwg'>pwg</label>
	<label><input type='checkbox' name='worker' value='hr'>hr</label>
	<label><input type='checkbox' name='worker' value='manager'>manager</label>
	
	<p/>
	<input type='reset' value='선택취소'/>
	<input type='button' value='전송' id='btnSend'/>
</form>

<div id='result'></div>
</body>


















</html>