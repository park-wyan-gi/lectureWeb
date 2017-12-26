<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>selector2</title>
<style>
input[type=checkbox]:checked + div {
		height: 0px;
		border : 0px;
		background-color : #ff0000;
	}
	
	div{
	 border:2px solid #4444ff;
	 background-color : #eeeeff;
	 
		overflow : hidden;
		width:500px; height:300px;
		
		-ms-transition-duration : 3s;
		-webkit-transition-duration : 10s;
		-moz-transition-duration : 3s;
		-o-transition-duration : 3s;
		transition-duration : 10s;
		
	}
	
</style>
</head>
<body>
<h1>체크박스의 상태에 따른 변환 효과</h1>
<input id='chk' type='checkbox' />체크하세요
<div>
	<h2>이곳의 내용이...</h2>
</div>

</body>
</html>