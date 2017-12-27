<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list_tag</title>
</head>
<body>
<h3>
OL, UL, DL 태그들을 사용하여 항목을 나열하자.
<hr/>
</h3>

<p>OL Example </p>
<ol start='30' type='A'>
	<li>백두산</li>
	<li>한라산</li>
	<li>치악산</li>
	<li>설악산</li>
	<li>금강산</li>
</ol>

<ol start='30' type='a'>
	<li>백두산</li>
	<li>한라산</li>
	<li>치악산</li>
	<li>설악산</li>
	<li>금강산</li>
</ol>

<ol start='30' type='i'>
	<li>백두산</li>
	<li>한라산</li>
	<li>치악산</li>
	<li>설악산</li>
	<li>금강산</li>
</ol>

<p>UL Example</p>
<ul type='disk'>
	<li>백두산</li>
	<li>한라산</li>
	<li>치악산</li>
	<li>설악산</li>
	<li>금강산</li>
</ul>

<ul type='circle'>
	<li>백두산</li>
	<li>한라산</li>
	<li>치악산</li>
	<li>설악산</li>
	<li>금강산</li>
</ul>

<ul type='square'>
	<li>백두산</li>
	<li>한라산</li>
	<li>치악산</li>
	<li>설악산</li>
	<li>금강산</li>
</ul>

<p>DL Example</p>
<dl>
	<dt>명산</dt>
		<dd>백두산</dd>
		<dd>한라산</dd>
		<dd>치악산</dd>
		<dd>설악산</dd>
		<dd>금강산</dd>

	<dt>명천</dt>
		<dd>백두천</dd>
		<dd>한라천</dd>
		<dd>치악천</dd>
		<dd>설악천</dd>
		<dd>금강천</dd>
</dl>

<p>UL, OL 복합사용 Example</p>
<ul>
	<li>1학년</li>
	<ol>
		<li>홍길동</li>
		<li>김길동</li>
		<li>박길동</li>
	</ol>
	
	<li>2학년</li>
	<ol>
		<li>일지매</li>
		<li>이지매</li>
		<li>삼지매</li>
	</ol>
	
	<li>3학년
		<ol>
			<li>성춘향</li>
			<li>김춘향</li>
			<li>이춘향</li>
			<li>임춘향</li>		
		
		</ol>
	</li>

</ul>










</body>
</html>