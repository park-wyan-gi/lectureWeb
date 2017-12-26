<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>an2</title>
<style>
#graph{
	width:610px;
	border:3px solid #000000;
}

.bar{
	width:10px; height:50px;
	background-color: #eeeeee;
	margin:5px;
	opacity:0.3;
	
	transition-property: opacity, background-color, width;	
	transition-duration: 5s, 2s,  7s;
}

#graph:hover > .bar:nth-child(1){
	background-color: red;
	width:100px;
	opacity:1;
}
#graph:hover >.bar:nth-child(2){
	background-color: blue;
	width:300px;
	opacity:1;
}
#graph:hover >.bar:nth-child(3){
	background-color: green;
	width:600px;
	opacity:1;
}
#graph:hover >.bar:nth-child(4){
	background-color: yellow;
	width:200px;
	opacity:1;
}
#graph:hover >.bar:nth-child(5){
	background-color: pink;
	width:400px;
	opacity:1;
}


</style>
</head>
<body>
<h1>transition-property</h1>

<div id='graph'>
	<div class='bar'></div>
	<div class='bar'></div>
	<div class='bar'></div>
	<div class='bar'></div>
	<div class='bar'></div>
</div>
</body>
</html>