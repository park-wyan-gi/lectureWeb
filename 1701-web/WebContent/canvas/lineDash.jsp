<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>line Dash</title>

<script>
	window.onload = start;
		
	function start(){
		var canvas = document.getElementById('mycanvas');
		var context = canvas.getContext('2d');
		
		//긴점선
		context.setLineDash([10]);
		//점선의 꺽인부분처리를 선의 절반
		context.lineDashOffset=5;
		context.strokeRect(10,10,100,100);
		
		
		//일점쇄선
		context.setLineDash([10,2,2,2]);
		context.strokeRect(120,10,100,100);
		
		//점선
		context.setLineDash([2]);
		context.strokeRect(10,120,100,100);
	}

</script>

</head>
<body>
<h3>Line Style Example<hr/></h3>


<canvas id='mycanvas' width='600px' height='500px'></canvas>
</body>
</html>