<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>one</title>
<script src = '../jq_lib/jquery-3.2.1.min.js'></script>
<script>
var cnt=0;
function chk(){
	cnt++;
	$('#result').html("cnt = " + cnt);
}
$(document).ready(function(){
	$('#btnMany').click(chk);
	$('#btnOne').one('click', function(){
		$(this).val('그만 누르삼!!!!!');
		chk();
	});
});
</script>


</head>
<body>
<h2>one : 현재 페이지에서 이벤트를 딱 한번만 발생시키는 핸들러</h2>
<input type='button' id='btnOne' value='한번만'>
<input type='button' id='btnMany' value='여러번'>
<p/>
<div id='result'></div>
</body>
</html>