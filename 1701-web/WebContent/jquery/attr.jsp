<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>attr</title>
<script src = '../jq_lib/jquery-3.2.1.min.js'></script>

<script>
$(document).ready(function(){ //window.onload=function(){}
	document.getElementById('btnView').onclick = function(){
		$('.data').attr('readonly','reayonly');
	}
	
	$('#btnModify').click(function(){
		$('.data').removeAttr('readonly');
	});
	
});
</script>
</head>
<body>
<form name='frm'>
	<input type='text' class='data' readonly='readonly' value='aaaa'/>
	<input type='text' class='data' readonly='readonly' value='aaaa'/>
	<input type='text' class='data' readonly='readonly' value='aaaa'/>
	<input type='text' class='data' readonly='readonly' value='aaaa'/>
	<input type='text' class='data' readonly='readonly' value='aaaa'/>
	<p/>
	<input type='button' value='View Mode' id='btnView'/>
	<input type='button' value='Modify Mode' id='btnModify'/>
</form>
</body>
</html>