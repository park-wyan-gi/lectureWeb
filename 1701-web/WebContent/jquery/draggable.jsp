<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>draggable</title>
<link rel='stylesheet' 
	href='http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css'/>
<script src='http://code.jquery.com/jquery-1.9.1.js'></script>
<script src='http://code.jquery.com/ui/1.10.3/jquery-ui.js'></script>
<script>
	$(function(){
		$('#draggable').css({
			'width':'300px',
			'padding':'20px',
			'box-sizing':'border-box',
			'border':'1px solid #aaaaaa',
			'text-align':'center'
		
		});
		
		$('#draggable').draggable();
	});
</script>
</head>
<body>
<div id='draggable'>
	<p>마우스를 끌어 보세요</p>
</div>

</body>
</html>