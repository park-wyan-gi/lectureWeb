<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>hover</title>
<script src = '../jq_lib/jquery-3.2.1.min.js'></script>

<script>
$(document).ready(function(){
	$('#here').css({
		'border'  :'1px solid #5555ff',
		'padding' :'10px',
		'width'   :'300px',
		'box-sizing':'border-box'
	});
	
	$('#result').css({
		'border'  :'3px solid #1111ff',
		'padding' :'30px',
		'width'   :'300px',
		'margin-top': '10px',
		'box-sizing':'border-box'
	});
	
	$('#here').hover(overF, outF);//callback type
	
});
function overF(){
	$(this).css('background-color','#9999ff');
	$('#result').text('<h2>mouse over</h2>');
	
}
function outF(){
	$(this).css('background-color','#ffffff');
	$('#result').html('<h2>mouse out</h2>');
	
}
</script>

</head>
<body>
	<div id='here'>이곳에 마우스를 올려보세요...</div>
	<div id='result'></div>
</body>
</html>












