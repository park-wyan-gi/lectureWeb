<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>strokeRect</title>
<style>
#canvas, #textCanvas, #lineCanvas {
	border:1px solid #0000ff;
	box-shadow:3px 3px 5px #aaaaaa;
}
</style>
<script>
window.onload = function(){
	var canvas = document.getElementById('canvas');
	var cont = canvas.getContext('2d');
	cont.strokeStyle = 'rgb(255,0,0)';
	cont.lineWidth=1;
	cont.strokeRect(10,10,100,100);
	
	cont.strokeStyle = 'rgb(0,0,255)';
	cont.strokeRect(150.5,10.5, 100.5,100.5);
	
	cont.strokeStyle = 'rgb(0,255,0)';
	cont.strokeRect(290,10,100,100);
	
	//alpha(투명도)
	cont.strokeStyle = 'rgb(255,0,0)';
	cont.fillStyle ='rgba(255,0,0,0.5)';
	cont.fillRect(10, 130, 100,100);
	
	cont.strokeStyle = 'rgb(0,0,255)';
	cont.fillStyle ='rgba(0,0,255, .5)';
	cont.fillRect(60, 180, 100,100);
	
	//-------------------------------
	// canvas에 text 그리기
	//-------------------------------
	var tCanvas = document.getElementById('textCanvas');
	cont = tCanvas.getContext('2d');
	cont.font = '20px 궁서체';
	cont.strokeText('박원기', 30,30);
	
	cont.font = '100px 궁서체';
	cont.strokeText('박원기', 30, 200);
	
	cont.fillStyle = 'rgba(0,0,255, 0.7)';
	cont.fillText('박원기', 30, 350);
	
	//----------------------------------
	// lineCanvas에 선그리기
	//----------------------------------
	var lineCanvas = document.getElementById('lineCanvas');
	cont = lineCanvas.getContext('2d');
	var w = lineCanvas.width;
	var h = lineCanvas.height;
	document.getElementById('btnH').onclick = function(){
		cont.clearRect(0,0, w,h);
		cont.lineWidth=30;
		cont.strokeStyle='#0000ff';
		
		cont.beginPath();
			cont.moveTo(100,100);
			cont.lineTo(400,100);
			cont.stroke();
		cont.closePath();
	}
	
	document.getElementById('btnV').onclick = function(){
		cont.clearRect(0,0,w,h);
		cont.lineWidth=50;
		cont.strokeStyle='#ff0000';
		
		cont.beginPath();
			cont.moveTo(100, 40);
			cont.lineTo(100, 300);
			cont.stroke();
		cont.closePath();
		
	}
	
	document.getElementById('btnT').onclick = function(){
		cont.clearRect(0,0,w,h);
		cont.lineWidth=10;
		cont.strokeStyle='#00ff00';
		
		cont.beginPath();
			cont.moveTo(150,100);
			cont.lineTo(50, 300);
			cont.lineTo(300, 300);
			cont.closePath();//2
		cont.stroke(); // 1  2의 실행순 교환후 관찰
	}
	
	document.getElementById('btnD').onclick=function(){
		cont.clearRect(0,0,w,h);
		cont.lineWidth=5;
		cont.strokeStyle='#0000ff';
		var pattern = [10,3];
		cont.setLineDash(pattern);
		cont.strokeRect(50,50,300,300);
	}
	
	document.getElementById('btnDD').onclick = function(){
		cont.clearRect(0,0,w,h);
		cont.lineWidth=5;
		cont.strokeStyle='#0000ff';
		var pattern = [15,3,3,3,3,3];
		cont.setLineDash(pattern);
		cont.strokeRect(50,50,300,300);
	}
	
}
</script>
</head>
<body>
<h1>사각형 그리기</h1>
<canvas id='canvas' width='500px' height='400px'></canvas>
<br/>
<canvas id='textCanvas' width='500px' height='400px'></canvas>
<br/>
<canvas id='lineCanvas' width='500px' height='400px'></canvas>
<br/>
<input type='button' value='수평선' id='btnH' />
<input type='button' value='수직선' id='btnV' />
<input type='button' value='삼각형' id='btnT' />
<input type='button' value='점선'      id='btnD' />
<input type='button' value='이점쇄선'  id='btnDD' />
</body>
</html>




