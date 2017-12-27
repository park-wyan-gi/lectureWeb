<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>load</title>
<script src = '../jq_lib/jquery-3.2.1.min.js'></script>
<script>
$(document).ready(function(){
	$('#btnLoad').click(function(){
		$('#result').load('test.jsp');
	});
	$('#btnMnt').click(function(){
		$('#result').load('test.jsp #mnt');
	});
	
	$('#btnRiver').click(function(){
		$('#result').load('test.jsp #river');
	})
});
</script>
</head>
<body>
<h2>load : $.ajax()보다 간단하게 페이지를 동적으로 로딩</h2>
<input type='button' value='LOAD' id='btnLoad'>
<input type='button' value='MNT' id='btnMnt'>
<input type='button' value='RIVER' id='btnRiver'>
<br/>
<div id='result'></div>
</body>
</html>