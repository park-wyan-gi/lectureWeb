<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function sum(){
		ff = document.frm2;
		ff.x.value = parseInt(ff.a.value) + parseInt(ff.b.value)
		           + parseInt(ff.c.value); 
	}

</script>
</head>
<body onload='sum()'>
<form name='frm' method='post'>
	<label>현재 당신은?</label><br/>
	<select name='sel1' size='1' >
		<option value='학생'>학생</option>
		<option value='농업'>농업</option>
		<option value='상업'>상업</option>
		<option value='공업'>공업</option>
		<option value='서비스'>서비스</option>
		<option value='공무원'>공무원</option>
		<option value='일반인'>일반인</option>
	</select>
	<p/>
	<label>미래 당신은?</label><br/>
	<select name='sel2' size='4' multiple='multiple'>
		<option value='학생'>학생</option>
		<option value='농업'>농업</option>
		<option value='상업'>상업</option>
		<option value='공업'>공업</option>
		<option value='서비스'>서비스</option>
		<option value='공무원'>공무원</option>
		<option value='일반인'>일반인</option>
	</select>

	<p/>
	<label>홈페이지<input type='utl' list='homepages'></label>
	<br/>
	
	<datalist id='homepages'>
		<option value='http://www.google.com' label='Google'/>
		<option value='http://www.jobtc.kr' label='우리 카페'/>
		<option value='http://www.nave.com' label='네이버'/>
		<option value='http://www.daum.net' label='다음'/>	
	</datalist>

	<p/>
	<details>
		<summary>초대장</summary>
		<p>참석여부를 확인해 주세요</p>
		<label><input type='radio' name='chk' value='OK'>참석</label>
		<label><input type='radio' name='chk' value='NO'>불참</label>
	</details>

	<p/>
	<label>나머지 용량</label>
	<meter value='50' min='0' max='100'>
</form>

<form name='frm2'>
	<input type='range'    name='a' value='50' onchange='sum()'>
	+ <input type='number' name='b' value='50' onchange='sum()'>
	+ <input type='number' name='c' value='50' onchange='sum()'>
	= <output name='x'></output>
</form>

<p/>
<label>진행 상황</label>
<progress max='100' value='90'>

<p/>

<label>HTML5 과정</label>
<select namc='s'>
	<optgroup label='1. html5'>
		<option>html 역사</option>
		<option>html 구조</option>
		<option>html 미래</option>
	</optgroup>

	<optgroup label='2. Javascript'>
		<option>Javascript 제어문</option>
		<option>Javascript 함수</option>
		<option>Javascript 이벤트</option>
	</optgroup>

	<optgroup label='3. css'>
		<option>css가 뭐죠???</option>
		<option>css와 자바스크립트</option>
		<option>css 활용하기</option>
	</optgroup>

</select>

</body>
</html>