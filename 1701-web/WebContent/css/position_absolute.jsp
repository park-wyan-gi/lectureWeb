<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no">

<title>position_absolute</title>
<style>
#main{
	position:absolute;
	left:100px;
	top:100px;
	border:1px solid #0000ff;
	width:400px;
	height:400px;
}

#main > div {
	position:absolute;
	width:100px;
	height:100px;
}


#div1{
	left:50px;
	top:50px;
	background-color:rgba(0,0,255,0.2);
}

#div2{
	left:100px;
	top:100px;
	background-color:rgba(0,255,0,0.2);
}

#div3{
	left:150px;
	top:150px;
	background-color:rgba(255,0,0,0.2);
}
#div4{
	left:200px;
	top:200px;
	background-color:rgba(255,255,0,0.7);
}
#div5{
	left:250px;
	top:250px;
	background-color:rgba(0,255,255,0.2);
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
</body>
</html>