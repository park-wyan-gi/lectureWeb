<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>selector2</title>
<script src = '../jq_lib/jquery-3.2.1.min.js'></script>
<script>
$(document).ready(
	function(){
		$('div').css('border','5px solid #888888');
		$('div').css('padding','20px');
		$('div').css('margin-right','10px');
		$('div').css('box-sizing','border-box');
		$('div').css('width','90px');
		$('div').css('float','left');
		
		$('#id1').css('background-color','#ff9999');
		$('.class1').css('background-color','#9999ff');
	}	
);
</script>
</head>
<body>
<div>DIV1</div>
<div id='id1'>DIV2</div>
<div class='class1'>DIV3</div>
</body>
</html>