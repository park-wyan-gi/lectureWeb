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
	$('#result').css({
		'border'     : '1px solid #aaaaaa',
		'padding'    : '10px',
		'box-sizing' : 'border-box',
		'box-shadow' : '3px 3px 5px'
		
	});
	
	//ajax
	$.ajax({
		type     : 'get',
		url      : 'test.jsp',
		dataType : 'html',
		success  : function(data){
			$('#result').html(data);
		},
		error    : function(xhr, status, error){
			alert(status + "," + error);
		}
	});
	
});

</script>
</head>
<body>
<h2>$.ajax : jquery 안에서 ajax를 사용하는 기본 골격</h2>
<div id='result'></div>
</body>
</html>



