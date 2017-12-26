<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>selector</title>
<style>
div { border : 1px solid #cccccc;}
span { 
	color : #0000ff;
	margin:30px;
}
#mnt{
	color:#ff0000;
}

.river{
	color:#ff0000;
	font-family : 궁서체;
}

label#chun, label.mong{
	color: #0000ff;
	font-size:40px;
	font-family : 휴먼편지체;
}

label#im {
	background-color:#ffff00;
}
label.m2{
	background-color:#00ffff;
}

</style>
</head>
<body>
<h1>선택자</h1>
<ul>
	<li>태그명을 사용한 선택자</li>
	<li>id값을 사용한 선택자 : 중복 불가</li>
	<li>class값을 사용한 선택자 : 중복 가능</li>
	<li>태그명 + id | class 을 조합한 선택자</li>
</ul>

<h2>태그명을 사용한 선택자</h2>
<div>
	<span>AAA</span>
	<span>BBB</span>
	<span>CCC</span>
	<span>DDD</span>
</div>

<h2>id값을 사용한 선택자</h2>
<div>
	<ol>유명한 산들
		<li id='mnt'>백두산</li>
		<li>한라산</li>
		<li>설악산</li>
		<li>금강산</li>
		<li>치악산</li>	
	</ol>

</div>

<h2>class를 지정한 선택자</h2>
<p>li를 사용하여 강이름을 나열하고 그중 하나에 class를 지정하여 
			문자색(color)을 빨간색으로
    글꼴(font-family)을 궁서체로 지정하시오</p>
<!-- TODO -->      
<div>
	<ol>
		<li>한강</li>
		<li class='river'>두강</li>
		<li>세강</li>
		<li>네강</li>
	</ol>
</div>

<h2>태그명 + id | class을 조합한 선택자</h2>
<p> span태그에 임의의값을 지정하여 5개정도 나열하고 span 태그에
        id와 class 를 지정하여 글자색, 글자크기, 폰트 종류를 지정하여 표시</p>
<!-- TODO -->        
 <div>
	<label>홍길동</label><br/>
	<label>일지매</label><br/>
	<label id='chun'>춘향이</label><br/>
	<label>향단이</label><br/>
	<label class='mong'>몽룡이</label><br/>
	
	<label class='mong' id='im'>임걱정(class, id 동시 적용)</label><br/>
	<label class='mong m2'>임걱정2(두개의 class 속성 적용)</label><br/>
  </div>
         
</body>
</html>



















