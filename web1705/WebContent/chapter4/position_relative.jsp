<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>position_relative</title>
<style>
.box{
	width:100px ; height:100px;
}
#div1 > div {
	position:relative;
}
.box1{ 
	background-color: #ff0000; 
	}
.box2{ 
	background-color: #00ff00; 
	}
.box3{ 
	background-color: #0000ff; 
	left:100px;
	top:-200px;
	}
.box4{ 
	background-color: #00ffff; 
	left:100px;
	top:-200px;
	}

</style>
</head>
<body>
<h1>relative example</h1>

<div id='div1'>
	<div class = 'box  box1'>box1</div>
	<div class = 'box  box2'>box2</div>
	<div class = 'box  box3'>box3</div>
	<div class = 'box  box4'>box4</div>
</div>
<div>하단에 있는 컨텐츠</div>


</body>
</html>