<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>drawBarGraph</title>
<script>
window.onload=start;

function start(){
	var canvas = document.getElementById('barCanvas');
	var context = canvas.getContext('2d');

	
	context.beginPath();
	//수직선
	context.moveTo(30,10);
	context.lineTo(30,230);
	//수평선
	context.moveTo(10,201);
	context.lineTo(351,201);
	context.stroke();
	context.closePath();
	
	context.fillStyle='#ff0000';
	context.fillRect(40,100, 60,100);

	context.fillStyle='#00ff00';
	context.fillRect(110,40, 60,160);
	
	context.fillStyle='#0000ff';
	context.fillRect(180,60, 60,140);
	
	context.fillStyle='#ff00ff';
	context.fillRect(250,160, 60,40);
	
}

</script>
</head>
<body>

<h3>Bar Graph</h3>
<canvas id='barCanvas' width='400px' height='300px'></canvas>
</body>
</html>