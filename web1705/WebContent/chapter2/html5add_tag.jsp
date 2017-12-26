<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>html5add_tag</title>
</head>
<body>
<h1>html5에 추가된 태그</h1>
<h2>datalist</h2>
<ul>
	<li>input='url'와 datalist 태그가 연동되서 목록을 보여주는 태그</li>
	<li>항목을 클릭하거나 앞단어와 일치하면 관련 내용을 필터링하여 보여줌</li>
</ul>
<form name='frm_datalist'>
	<label>Home page</label>
	<input  list='homepage' /><p/>
	
	<datalist id='homepage'>
		<option value='naver' label='네이버' />
		<option value='google' label='구글' />
		<option value='daum' label='다음' />
		<option value='nate' label='네이트' />
		<option value='chosun' label='조선일보' />
		<option value='etnews' label='전자신문' />
	</datalist>
</form>

<h2>details</h2>
<ul>
	<li>항목들을 감추었다가 해당 항목을 클릭하면 세부 내용을 보여주는 태그
	<li>open = 'true | false'
</ul>
<form name='frm_details'>
	<details>
		<summary>자바 커리큘럼</summary>
		<br/>
		<img src='img2.png'><br/>
		<ol>
			<li>자바 개요</li>
			<li>변수란?</li>
			<li>클래스와 메서드</li>
			<li>재정의와 중복선언</li>
		</ol>
	</details>
	
	<details open='false'>
		<summary>Database 커리큘럼</summary>
		<br/>
		<img src='../img1.png'><br/>
		<ol>
			<li>select</li>
			<li>join</li>
			<li>update</li>
			<li>insert</li>
			<li>delete</li>
			<li>sub query</li>
			<li>function | procedure</li>
		</ol>
	</details>
</form>

<h2>meter | progress</h2>
<ul>속성
	<li>min, max : meter 태그가 나타낼수 있는 최소, 최대값을 지정</li>
	<li>value : 현재값</li>
	<li>progress 태그는 max, value 속성만 가지고 있음</li>
</ul>
<form name='frm_meter'>
	<label>현재 잔량</label>
	<meter mix='0'  max='1000' value='300'></meter><br/>
	<progress max='1000' value='300'></progress>
</form>

<h2>optgroup</h2>
<p>select 태그의 소그룹을 만들어 표시해 줄수 있는 태그</p>
<label>HTML5 커리큘럼</label>
<select name='html5' size='10'>
	<optgroup label='1. html 의 개요'/>
		<option>1. html 역사</option>
		<option>2. html 구조</option>
		<option>3. html 미래</option>
	<optgroup label="2. 글꼴태그"/>
		<option>1. b </option>
		<option>2. h1~h6</option>
		<option>3. font</option>

</select>


</body>
</html>









