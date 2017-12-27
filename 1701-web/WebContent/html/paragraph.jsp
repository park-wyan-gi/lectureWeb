<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>paragraph</title>
<style>
.a{
 background-color:#ffaaaa;
 display:inline-block;
 width:300px;
}
</style>
</head>
<body>
<h3>
1) span 태그를 사용하여 아이디, 성명, 연락처 항목을 화면에 표시<br/>
2) p태그를 사용하여 3개의 문단을 구성하고 문단의 정렬 방법을 추가<br/>
3) div 태그를 사용하여 문단 구분이 분리되지 않는 문단 3개 표시<br/>
4) pre 태그를 사용하여 입력된 문자들의 위치가 고정되어 있는지 표시<br/>
5) xmp 태그를 사용하여 입력된 문자들의 위치가 고정될 뿐만 아니라
작성된 태그모양도 그대로 표시되는지 체크<br/>
<hr/>
</h3>


<h4>span</h4>
<span class='a'>아이디</span>
<span class='b'>성명</span>
<span class='c'>연락처</span>
<br/>
<span class='a'>a001</span>
<span class='b'>길동이</span>
<span class='c'>010-1111-2222</span>
<h4>p와 align</h4>
<p align='left'>첫번째 문단<br/>첫번째 문단</p>
<p align='center'>두번째 문단<br/>두번째 문단</p>
<p align='right' class='a'>세번째 문단<br/>세번째 문단</p>

<h4>div</h4>
<div>첫번째 DIV </div>
<div>두번째 DIV </div>
<div>세번째 DIV </div>

<h4>pre</h4>

<pre>
입력한 <font color='#ff0000'>모습</font> 
그
대로 나타냄
</pre>

<h4>xmp</h4>
<xmp class='a'>
입력한 <font color='#ff0000'>모습</font> 
그
대로 나타냄
</xmp>



</body>
</html>