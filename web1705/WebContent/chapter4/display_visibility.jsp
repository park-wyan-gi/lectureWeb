<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>display_visibility</title>
<style>
#disp>.abc{
	--display:none;
	opacity:0.1;
 
}
#visi>.abc{
	visibility: hidden;
}
</style>
</head>
<body>
<h1>display | visibility</h1>
<p>
	display:none 속성과 visibility:hidden의 차이
</p>

<div id='disp'>
	<p>이것은 제목</p>
	<p class='abc'>이것은 본문</p>
	<p>이것은 바닥글</p>
</div>
<hr/>
<div id='visi'>
	<p>이것은 제목</p>
	<p class='abc'>이것은 본문</p>
	<p>이것은 바닥글</p>
</div>






</body>
</html>