<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src = '../jq_lib/jquery-3.2.1.min.js'></script>
<script>
$(document).ready(
	function(){
		$('#center div').css('background-color','#eeeeee');
		$('.center div').css('color','#ff0000');
		$('p, span').css('border','2px solid #9999ff');
	}	
);
</script>

</head>
<body>
<div id='center'>
	<p>P1</p>
	<div>DIV1</div>
	<p>P2</p>
</div>

<div class='center'>
	<span>SPAN1</span>
	<div>DIV2</div>
	<span>SPAN2</span>
</div>

</body>
</html>