<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src = '../jq_lib/jquery-3.2.1.min.js'></script>
<script>
$(document).ready( function(){
		$('div, p').css('border','1px solid #aaaaaa');
		$('div, p').css('padding','20px');
		$('div, p').css('box-sizing','border-box');
		$('div, p').css('margin','10px');
		
		// div의 속성값이 a=abd
		$("div[a='abd']").css('background-color','#ffcccc');
		
		// s속성값이 c로 끝나는 요소
		$("[s$='c']").css('background-color','#ccccff');
});
</script>
<title>selector3</title>
</head>
<body>
<h2>attribute를 사용한 select<hr/></h2>

<p s='abc'> p : s='abc'</p>
<div>DIV1</div>
<div id='id1' a='abd'> div : id='id1' a='abd'</div>
<div class='class1' a='bc'> div : class='class1 a='bc'</div>
<div>
	<p>P1</p>
	<p s='abc'> p :  s='abc'</p>
</div>
</body>
</html>