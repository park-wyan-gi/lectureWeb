<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src = '../jq_lib/jquery-3.2.1.min.js'></script>
<script>
$(document).ready(function(){
	//css
	$('.submenu').css({
		'display':'table-cell',
	});
	$('#menu1, #menu2').css({
		'border':'1px solid #cccccc',
		'background-color':'#666666',
		'color':'#eeeeee',
		'padding':'4px',
		'width':'120px',
		'bax-sizing':'border-box',
		'cursor':'pointer'
	});
	$('#submenu1, #submenu2').css({
		'border':'1px solid #cccccc',
		'background-color':'#aaaaaa',
		'padding':'4px',
		'width':'120px',
		'bax-sizing':'border-box'
	});
	
	$('#submenu1, #submenu2').hide();
	
	//event
	$('#menu1').click(function(){
		$('#submenu1').fadeTo(1000, 1);
		$('#submenu2').fadeTo(1500,0.1);
	});
	$('#menu2').click(function(){
		$('#submenu2').fadeTo(1000, 1);
		$('#submenu1').fadeTo(1500, 0.1);

	})
	
});
</script>
</head>
<body>
<h2>toggle로 구현한 메뉴</h2>

<div id='menu'>
	<div class='submenu'>
		<div id='menu1'>
			<img src='icon1.png' align='left' hspace='10px'> 메뉴1
		</div>
		
		<div id='submenu1'>
			<div>서브1</div>
			<div>서브2</div>
			<div>서브3</div>
		</div>
	</div>
	
	<div class='submenu'>
		<div id='menu2'>
			<img src='icon2.png' align='left' hspace='10px;'> 메뉴2
		</div>
		<div id='submenu2'>
			<div>서브4</div>
			<div>서브5</div>
			<div>서브6</div>
		</div>
	</div>
</div>

</body>
</html>