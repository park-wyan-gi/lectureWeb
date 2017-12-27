<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>gradient</title>
<script>
window.onload=start;
function start(){
	var context = document.getElementById('mycanvas').getContext('2d');
	var linear = context.createLinearGradient(0,0,200,100);
	linear.addColorStop(0, '#ffff00');
	linear.addColorStop(0.5, '#0000ff');
	linear.addColorStop(1,"#ff0000");
	
	context.fillStyle = linear;
	context.fillRect(0,0,200,100);
	
	//원형 Gradient
	var radial = context.createRadialGradient(400,100,30, 400,100,150);
	radial.addColorStop(0, '#ffff00');
	radial.addColorStop(0.5, '#0000ff');
	radial.addColorStop(1,"#ff0000");
	
	context.fillStyle = radial;
	context.fillRect(300,0,200,200);
	
	//원형 Gradient(arc)
	var radial = context.createRadialGradient(630,100,30, 700,100,100);
	radial.addColorStop(0, '#ffff00');
	radial.addColorStop(0.5, '#0000ff');
	radial.addColorStop(1,"#00ff00");
	
	context.fillStyle = radial;
	context.beginPath();
	context.arc(700,100,100, 0, Math.PI*2);
	context.fill();
	context.closePath();
	context.stroke();
	
		
	
}
</script>
</head>
<body>
<h3>선형, 원형 gradient Example<hr/></h3>
<canvas id='mycanvas' width='850px', height='400px'></canvas>

</body>
</html>