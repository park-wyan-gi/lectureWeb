<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no">

<title>position_fixed</title>
<style>
	#main{
		margin-top:-19px;
		margin-left:-8px;
		
		height:30px;
		border:2px solid #aaaaaa;
		position:fixed;
		background-color: rgba(200,200,200,.9);
		z-index: 3;
	}
	#main>div{
		display: table-cell;
		width:200px;
	}
	#sub{
		position: relative;
		top:60px;
		height:500px;
		z-index:2;
	}
</style>
</head>
<body>
<div id='main'>
	<div id='div1'>DIV1</div>
	<div id='div2'>DIV2</div>
	<div id='div3'>DIV3</div>
	<div id='div4'>DIV4</div>
	<div id='div5'>DIV5</div>
</div>
<div id='sub'>
	<h3>position_fixed</h3>
	이부분은 스크롤 됩니다.~~
</div>
</body>
</html>