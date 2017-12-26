<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>use_css</title>
<style>
#abc {
	color : #ff0000;
	background-color : #ffff00;
	font-size:40px;
}
</style>
<link rel="stylesheet" type='text/css' href='use_css.css' />

</head>
<body>
<h1>css 를 사용하는 방법 3가지</h1>
<ol>
	<li>head태그안에 style 태그를 사용하여 css를 지정</li>
	<li>태그안에 style 속성을 지정해서 사용하는 방법</li>
	<li>외부 css 파일을 작성하여 link 태그로 사용하는 방법</li>
</ol>

<h2 id="abc">head태그에서 style 지정</h2>

<h2 style="color:#0000ff; font-size:20px">태그안에서 style지정</h2>

<h2 id='def'>외부 파일에서 지정된 style</h2>
</body>
</html>