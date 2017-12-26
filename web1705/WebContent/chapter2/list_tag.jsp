<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list_tag</title>
</head>
<body>
<h1>목록태그</h1>
<ul>
	<li>OL : 순번이 있는 목록태그 
		<ul>
			<li>start = n : 시작번호</li>
			<li>type = A | a | I | i | 1
		</ul>
	</li>
	<li>UL : 기호문자로 되어 있는 목록태그
		<ul>
			<li>type = circle | disk | square
		</ul>
	
	</li>
	<li>li : OL 또는 UL 태그에서 실제 목록을 나열할때 사용</li>
	<li>DL : 정의 목록 태그
		<ul>
			<li>DT : 정의 용어 태그</li>
			<li>DD : 용어 설명</li>
		</ul>
	</li>
</ul>

<h1>Result View</h1>
<h2>OL</h2>
<ol start="10"  type="a">
	<li>백두산</li>
	<li>한라산</li>
	<li>금강산</li>
	<li>설악산</li>
	<li>도봉산</li>
	<li>치악산</li>
	<li>내장산</li>
	<li>지리산</li>
</ol>

<h2>UL</h2>
<ul type="circle">
	<li>사과</li>
	<li>배</li>
	<li>복숭아</li>
	<li>참외</li>
	<li>수박</li>
</ul>

<h2>DL</h2>
<dl>
	<dt>서울</dt>
	<dd>대한민국의 수도</dd>
	<dt>파리</dt>
	<dd>프랑스의 수도</dd>
	<dd>해충의 한 종류</dd>
</dl>

<h2>목록태그의 중첩</h2>
<ul>
	<li>한강</li>
	<li>소양강</li>
	<li>금강</li>
	<li>낙동강</li>
	<li>대동강</li>
	<li>그외
		<ol>
			<li>두강</li>
			<li>세강</li>
			<li>네강</li>
			<li>오강</li>
		</ol>
	
	</li>
</ul>


</body>
</html>



