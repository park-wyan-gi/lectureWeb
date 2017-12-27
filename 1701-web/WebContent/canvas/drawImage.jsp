<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>drawImage</title>
<script>
window.onload=start;
function start(){
	var context = document.getElementById('mycanvas').getContext('2d');
	var img = new Image();
	img.src = '../images/poster1.png';
	
	img.onload=function(){
		
		//원본 그대로
		context.drawImage(img, 0,0); 
		
		//축소
		context.drawImage(img, 0,0, img.width, img.height, 500,0,100,100);
		
		//특정 부분 확대
		context.drawImage(img, 160,120,60,60, 650,0,300,300);
		
	}
}
</script>
</head>
<body>
<h3>이미지 축소/확대 Example<hr/></h3>
<canvas id='mycanvas' width='850px', height='700px'></canvas>


</body>
</html>