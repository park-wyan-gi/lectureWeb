<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>tabWidget</title>
<link rel='stylesheet' 
	href='http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css'/>
<script src='http://code.jquery.com/jquery-1.9.1.js'></script>
<script src='http://code.jquery.com/ui/1.10.3/jquery-ui.js'></script>

<script>
$(function(){
	$('#tabs').tabs();
});
</script>
</head>
<body>
<h2>tabWidget : li와 a 태그를 조합하여 탭형태의 메뉴를 만듬.</h2>

<div id='tabs'>
	<ul>
		<li><a href='#tabs-1'>HTML5 소개</a></li>
		<li><a href='#tabs-2'>CSS3 소개</a></li>
		<li><a href='#tabs-3'>JavaScript 소개</a></li>
		<li><a href='#tabs-4'>jQuery 소개</a>
	</ul>

	<div id='tabs-1'>
		<font size='4' color='#3333ff'>첫번째 탭 메뉴</font>
		<p/>
		<img src='img1.png'>
	</div>
	
	<div id='tabs-2'>
		<font size='4' color='#3333ff'>두번째 탭 메뉴</font>
		<p/>
		<img src='img2.png'>
	</div>
	
	<div id='tabs-3'>
		<font size='4' color='#3333ff'>세번째 탭 메뉴</font>
		<p/>
		<img src='img3.png'>
	</div>
	
	<div id='tabs-4'>
		<font size='4' color='#3333ff'>네번째 탭 메뉴</font>
		<p/>
		<img src='icon1.png'>
		<img src='icon2.png'>
		<img src='img4.png'>
	</div>

</div>
</body>
</html>