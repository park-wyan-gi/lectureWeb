<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>drawRect</title>
<style>
canvas {
	border:5px solid #a633f5;
}
</style>

<script>
window.onload=start;//body가 모두 읽혀지면 start 함수를 실행해라.
function start(){
	var canvas = document.getElementById('mycanvas1');
	var context = canvas.getContext('2d');
	context.strokeRect(10,10,100,100);
	context.strokeRect(150.5,10.5,200.5,100.5);
	
	context.strokeStyle = 'rgb(255,0,0)';
	context.strokeRect(10, 150, 100,100);
	
	//채울색상
	context.fillStyle='rgba(255,255,0,0.5)';
	context.fillRect(150,150,100,100);
	
	context.fillStyle='rgba(0,255,255,0.5)';
	context.fillRect(200,200,100,100);
	
	//canvas2, context2 객체 생성
	var canvas2 = document.getElementById('mycanvas2');
	var context2 = canvas2.getContext('2d');
	
	//1)패스시작 ->점을 이동 -> 선을 긋고 -> 패스를 닫는다.
	//2)패스시작 ->점 이동 -> 패스를 닫는다. ->선을긋는다.
	
	//직선
	context2.beginPath();
	context2.moveTo(10,40);
	context2.lineTo(100,40);
	context2.stroke();
	context2.closePath();
	
	//수직선
	context2.beginPath();
	context2.moveTo(10,40);
	context2.lineTo(10,140);
	context2.stroke();
	context2.closePath();
	
	//대각선(빨강색)
	context2.strokeStyle='rgb(255,0,0)';
	context2.beginPath();
	context2.moveTo(10,40);
	context2.lineTo(100,140);
	context2.stroke();
	context2.closePath();
	
	//파란색 삼각형(stroke을 먼저 실행한 경우)
	context2.lineWidth='10';
	context2.strokeStyle='rgb(255,0,0)';
	context2.fillStyle='rgb(0,0,255)';
	context2.beginPath();
	context2.moveTo(300,10);
	context2.lineTo(200,140);
	context2.lineTo(400,140);
	context2.fill();
	context2.stroke();
	context2.closePath();
	
	
	
}

</script>



</head>
<body>
<h3>draw rect example<hr/></h3>

<canvas id='mycanvas1' width='500px', height='300px'></canvas>
<p/>
<canvas id='mycanvas2' width='500px', height='300px'></canvas>
</body>
</html>













