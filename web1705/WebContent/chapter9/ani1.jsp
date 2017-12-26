<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ani1</title>
<style>
#box{
	width:100px; height:100px;
	padding:20px;
	font-size:30px;
	box-sizing:border-box;
	border:1px solid #4444ff;
	background-color: orange;
	
	transition-duration : 8s;
	transition-timing-function:ease-in-out;
}

#box:hover{
	width:200px; height:300px;
}
#box:active{
	background-color: red;
}


</style>
</head>
<body>
<div id='box'>BOX</div>
</body>
</html>