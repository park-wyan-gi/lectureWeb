<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>position_absolute</title>
<style>
.box {
	width:100px ; height:100px;
	position:absolute;
}

.red{
	background-color: #ff0000;
	z-index: 100;
}
.green{
	background-color:#00ff00;
	left:60px ; top:135px;
	opacity:0.5;
	z-index:50;
}
.blue{
	background-color: #0000ff;
	color:#ffff00;
	left:110px ; top:185px;
	opacity:0.5;
	z-index:71;
}
#div1{
	position:absolute;
	left:200px;
	top:350px;
}
</style>
</head>
<body>
<h1>absolute example</h1>
<div class = 'box  red'>RED</div>
<div class = 'box  green'>GREEN</div>
<div class = 'box  blue'>BLUE</div>

<div id='div1' >
	<div class = 'box  red'>RED2</div>
	<div class = 'box  green'>GREEN2</div>
	<div class = 'box  blue'>BLUE2</div>
</div>



</body>
</html>