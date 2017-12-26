<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>arc</title>
<script>
	window.onload = function(){
		var arcCanvas = document.getElementById('arcCanvas');
		var cont = arcCanvas.getContext('2d');
		var w = arcCanvas.width;
		var h = arcCanvas.height;
		cont.lineWidth=3;
		cont.strokeStyle = '#ff0000';
		var x = 300;
		var y = 250;
		var r = 90;//반지름
		document.getElementById('arc').onclick = function(){
			cont.clearRect(0,0, w, h);
			cont.beginPath();
				cont.arc(x,y, r, 0, Math.PI*2, false);
				cont.closePath();
			cont.stroke();
		}
		document.getElementById('hArcTop').onclick = function(){
			cont.clearRect(0,0,w,h);
			cont.beginPath();
				cont.arc(x,y, r, 0, Math.PI*1, true);
				cont.closePath();
			cont.stroke();
		}
		document.getElementById('hArcBottom').onclick = function(){
			cont.clearRect(0,0,w,h);
			cont.beginPath();
				cont.arc(x,y, r, 0, Math.PI*1, false);
				cont.closePath();
			cont.stroke();
		}
		document.getElementById('pacMan').onclick = function(){
			var v = 2/360*45;
			cont.clearRect(0,0, w, h);
			cont.beginPath();
				cont.moveTo(x-10, y);
				cont.arc(x,y, r, Math.PI*(2-v), Math.PI*v, true);
				cont.closePath();
			cont.stroke();
			cont.beginPath();
				cont.arc(x, y-40, 10, 0, Math.PI*2);
				cont.closePath();
			cont.stroke();
				
				
		}
		
		
	}
</script>
</head>
<body>
<h1>원|원호 그릭</h1>
<canvas id='arcCanvas' width='600px' height='500px'></canvas>
<br/>
<input type='button' id='arc' value='원그리기' />
<input type='button' id='hArcTop' value='위쪽 반원' />
<input type='button' id='hArcBottom' value='아래 반원' />
<input type='button' id='pacMan' value='팩맨' />
</body>
</html>