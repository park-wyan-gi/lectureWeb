<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>declare</title>
<link rel='stylesheet' type='text/css' href='declare.css'>
<style>
/* 현재 페이지 내에 있는 모든 div에 적용 */
div{
  border : 2px dotted #0000ff;
}

#div1 {
  font-size: 150pt;
  color:#0000ff;
}
</style>
</head>
<body>
<h3>css 지정 방법 3가지</h3>
  <ol>
    <li>head태그안에 style태그를 선언하여 사용하기</li>
    <li>특정 태그에 style속성을 선언하여 사용하기</li>
    <li>외부 파일에 css 문서를 작성하여 적용하기</li>
  </ol>
  <hr/>

<h4>head태그안에 style 태그 선언된 내용 적용</h4>
<div id='div1'>박원기</div>
<div>홍길동</div>

<h4>특정 태그에 style 속성 사용</h4>
<p style='color:#ff0000'>박원기</p>

<h4>외부파일에 css를 정의하여 적용</h4>
<p class='title'>
  <span class='item'>아이디</span>
  <span class='item'>성명</span>
  <span class='item'>주소</span>
  <span class='item'>연락처</span>
</p>

<div class='list'>
  <span class='item'>A001</span>
  <span class='item'>홍길동</span>
  <span class='item'>서울</span>
  <span class='item phone'>010-1111-2222</span>
</div>
<div class='list'>
  <span class='item'>A002</span>
  <span class='item'>김길동</span>
  <span class='item'>인천</span>
  <span class='item phone'>010-1111-2222</span>
</div>
<div class='list'>
  <span class='item'>A003</span>
  <span class='item'>박길동</span>
  <span class='item'>대구</span>
  <span class='item phone'>010-1111-2222</span>
</div>

</body>
</html>















