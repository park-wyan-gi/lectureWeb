<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>selector3</title>
<style>

#items>li {
	list-style:none;
	float:left ; padding : 15px;
}
#items>li:first-child{
	border-radius : 20px 0 0 20px;
}
#items>li:last-child{
	border-radius: 0 20px 20px 0; 
}
#items>li:nth-child(2n){
	background-color:#990003;
	color:#ffff00;
}
#items>li:nth-child(2n+1){
	background-color:#030099;
	color:#ffff00;
}

#items>li:hover {
	background-color : #aaaaff;
	cursor: pointer;
}
</style>

</head>
<body>
<h1>구조 선택자</h1>
<ul>
	<li>:first-child</li>
	<li>:last-child</li>
	<li>:nth-child(수열)</li>
</ul>

<ul id='items'>
	<li>홈으로</li>
	<li>JAVA</li>
	<li>Database</li>
	<li>HTML</li>
	<li>CSS</li>
	<li>JavaScript</li>
	<li>JSP</li>
	<li>jQuery</li>
	<li>myBatis</li>
	<li>ajax</li>
	<li>Spring</li>
	<li>Android</li>
</ul>
<p/>

</body>
</html>