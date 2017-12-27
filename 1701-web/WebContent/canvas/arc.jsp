<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>arc</title>
<script>
window.onload=start;
function start(){
	var context = document.getElementById('mycanvas').getContext('2d');
	context.lineWidth=3;
	
	//stroke()먼저한 경우
	context.beginPath();
	context.arc(100,100,50,0,Math.PI*1, true);
	context.stroke();
	context.closePath();
	
	//closePath()를 먼저한 겨우
	context.beginPath();
	context.arc(250,100,50,0, Math.PI*1, true);
	context.closePath();
	context.stroke();
	
	//시작점을 중점 하단(콘모양)
	context.fillStyle='rgba(80,80,255,0.5)';
	context.strokeStyle='rgba(40,40,255,1)';
	context.beginPath();
	context.moveTo(400,160);
	context.arc(400,100,50,0, Math.PI*1, true);
	context.closePath();
	context.fill();
	context.stroke();

	
	//콘모양에 그림자 추가
	context.fillStyle='rgb(80,80,255)';
	context.strokeStyle='rgb(40,40,255)';
	context.shadowColor='rgb(200,200,200)';
	context.shadowOffsetX='5';
	context.shadowOffsetY='5';
	context.shadowBlur='8';
	
	context.beginPath();
	context.moveTo(550,160);
	context.arc(550,100,50,0, Math.PI*1, true);
	context.fill();
	context.closePath();
	context.stroke();

	
	
}

</script>
</head>
<body>
<h3>원호(arc) example<hr/></h3>
<canvas id='mycanvas' width='650px', height='400px'></canvas>
 
</body>
</html>