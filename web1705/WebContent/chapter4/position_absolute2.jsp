<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>position_absolute2</title>
<style>
#box>div{
	width:100px ; height: 100px;
	position:absolute;
}
#box{
	height:200px;
	position:relative;
	overflow:scroll;
}
.box1 {
	background-color: #ff4444;
	left:0px; top:0px;
}
.box2 {
	background-color: #44ff44;
	left:50px;top:50px;
}
.box3 {
	background-color: #4444ff;
	left:100px;top:100px;
}
.box4 {
	background-color: #44ffff;
	left:150px;top:150px;
}

</style>
</head>
<body>
<h1>자손태그가 absolute일 때 부모 태그의 상태 변화</h1>
<ul>
	<li>부모태그에는 높이를 지정해야 함.</li>
	<li>부모태그의 position은 relative로 지정해야 함.</li>
	<li>내용이 벗어난경우 조치(overflow:hidden | scroll)</li>
</ul>
<hr/>

<div id='box'>
	<div class='box1'>box1</div>
	<div class='box2'>box2</div>
	<div class='box3'>box3</div>
	<div class='box4'>box4</div>
</div>

<h2>하단의 내용과 box의 내용과의 관계...^^</h2>

</body>
</html>