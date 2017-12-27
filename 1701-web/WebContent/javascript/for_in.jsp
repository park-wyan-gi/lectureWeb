<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>for_in</title>
<style>
#result > div{
	border:1px solid #aaaaaa;
	padding:10px;
	width:100px;
	color:#000000;
	text-align:center;
	transition:background 4s, color 3s;
	
}
#result >div:hover{
	background-color: #666666;
	color:#ffff00;
	transition:background 1s, color 1s;
}
</style>
<script>
function start(){
	var rs = document.getElementById('result');
	var ar =['백두산','한라산','금강산','설악산','지리산','내장산'];
	var str='';
	
	for(var s in ar){
		str += '<div>' + ar[s] + '</div>';
	}
	rs.innerHTML = str;
}
</script>

</head>
<body>
<h3>for_in<hr/></h3>
<div id='result'></div>

<script>start();</script>
</body>
</html>