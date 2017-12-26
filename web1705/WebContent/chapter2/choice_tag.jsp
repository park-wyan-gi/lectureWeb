<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>choice_tag</title>
</head>
<body>
<h1>선택할 수 있는 테그들</h1>
<ul>
	<li>radio</li>
	<li>checkbox</li>
	<li>select type</li>
	<li>combo type </li>
</ul>
<h2>radio</h2>
<div>radio 타입의 버튼을 그룹화 하려면 버튼의 이름을 동일하게 지정</div>
<form name = 'frm_radio'>
		<div>성별</div>
		<label><input type='radio' name='gender' value='m' checked />남</label>
		<label><input type='radio' name='gender' value='f'/>여</label>
		
		<p>가장 좋아하는 도시는 ?</p>
		<label><input type='radio' name='city' value='강원도' checked>강원도</label>
		<label><input type='radio' name='city' value='경상도'>경상도</label>
		<label><input type='radio' name='city' value='전라도'>전라도</label>
		<label><input type='radio' name='city' value='충청도'>충청도</label>
		<label><input type='radio' name='city' value='제주도'>제주도</label>
		<label><input type='radio' name='city' value='을릉도'>을릉도</label>
</form>

<h2>checkbox</h2>
<form name='frm_checkbox'>
	<p>좋아하는 연예은(다수선택 가능)?</p>
	<label><input type='checkbox' name='talent' value='이미자' checked>이미자</label>
	<label><input type='checkbox' name='talent' value='사미자'>사미자</label>
	<label><input type='checkbox' name='talent' value='고이자'>고이자</label>
	<label><input type='checkbox' name='talent' value='김기자'>김기자</label>
	<label><input type='checkbox' name='talent' value='이기자'>이기자</label>
</form>	

<h2>select(combox)</h2>
<form name='frm_bombox'>
		<p>올 겨울 가고 싶은 산은 ? </p>
		<select name='mnt' size='1'>
			<option>백두산</option>
			<option>금강산</option>
			<option>설악산</option>
			<option>치악산</option>
			<option>지리산</option>
			<option>내장산</option>
			<option>한라산</option>
		</select>
</form>

<h2>select(list)</h2>
<form name='frm_list'>
		<p>올 겨울 가고 싶은 산은 ? </p>
		<select name='mnt' size='5'>
			<option>백두산</option>
			<option>금강산</option>
			<option>설악산</option>
			<option>치악산</option>
			<option>지리산</option>
			<option>내장산</option>
			<option>한라산</option>
		</select>
</form>

<h2>select(multiple)</h2>
<form name='frm_multi'>
		<p>올 겨울 가고 싶은 산은 ? </p>
		<select name='mnt' size='5' multiple>
			<option>백두산</option>
			<option>금강산</option>
			<option>설악산</option>
			<option>치악산</option>
			<option>지리산</option>
			<option>내장산</option>
			<option>한라산</option>
		</select>
</form>

</body>
</html>


