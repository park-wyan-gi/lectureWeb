<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>gradient</title>
<style>
#linear, #radial{
	width:800px; height:650px;
	border:1px solid #aaaaaa;
}
#linear{
	background: -webkit-gradient(linear, 
																left top, right top,
																color-stop(1%, #ff0000),
																color-stop(50%, #ffff00),
																color-stop(100%, #0000ff)
	);
}
#radial{
	background:-webkit-radial-gradient( circle,
																																#ff0000, #0000ff, #ffff00);
}
</style>
</head>
<body>
<h1>gradient</h1>
<div id='linear'></div>

<div id='radial'></div>



</body>
</html>