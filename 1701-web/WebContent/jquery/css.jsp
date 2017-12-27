<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>css</title>
<script src = '../jq_lib/jquery-3.2.1.min.js'></script>
<script>
$(document).ready(function(){
	$('div').css({
		'border':'1px solid #aaaaaa',
		'width':'60px',
		'text-align':'center',
		'padding':'4px',
		'display':'inline-block'
	});
	
	$('div').css('background',function(index){
		if(index%3==2) return "#ff9999";
		else return "#9999ff";
	});
});
</script>

</head>
<body>
<h2>map 구조로 여러개의 스타일 지정 및 css의 function</h2>

<div>DIV</div>
<div>DIV</div>
<div>DIV</div>
<div>DIV</div>
<div>DIV</div>
<div>DIV</div>
<div>DIV</div>
<div>DIV</div>
<div>DIV</div>
<div>DIV</div>
</body>
</html>