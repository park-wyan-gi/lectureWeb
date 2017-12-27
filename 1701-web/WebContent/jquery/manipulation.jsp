<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>manipulation</title>
<script src = '../jq_lib/jquery-3.2.1.min.js'></script>
<script>
$(document).ready(function(){
	//wrap
	var tri_wrap = "<div>Outer : </div>";
	$('.class1').wrap(tri_wrap);
	$('.p1').wrap($('.class2'));
	
	//append
	$('.append_div').append("<font color='red'>홍길동</font>");
	$('.append_div').prepend("<li>");
});
</script>

</head>
<body>
<h2>manipulation : 특정 요소에 엘리먼트를 추가하거나 삭제하는 방법</h2>

<span class='class1'>wrap test</span>

<p class='p1'>박원기</p><span class='class2'> 강사</span>
<hr/>

<span class='append_div'>Append : </span>

</body>
</html>