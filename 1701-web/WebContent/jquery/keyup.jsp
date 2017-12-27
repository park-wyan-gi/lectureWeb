<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>keyup</title>
<script src = '../jq_lib/jquery-3.2.1.min.js'></script>
<script>
var cnt=0;
$(document).ready(function(){
	$('#key_text').keyup(function(ev){
		var str = '<li>code : ' + ev.keyCode;
		str += '<li>type : ' + ev.type;
		cnt++;
		
		$('#result').html(str + ', cnt=' + cnt);
	});
});
</script>
</head>
<body>
<input type='text' id='key_text' placeholder="키를 누르세요" size='30'><br/>
<div id='result'></div>
</body>
</html>