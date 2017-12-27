<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>show_hide</title>
<script src = '../jq_lib/jquery-3.2.1.min.js'></script>
<script>

$(document).ready(function(){
	$('#btnHide').click(function(){	$('#data').hide();});
	$('#btnHideFast').click(function(){	$('#data').hide('fast');});
	$('#btnHideSlow').click(function(){	$('#data').hide('slow');});
	$('#btnHideCustom').click(function(){	$('#data').hide(3000);});
	
	$('#btnShow').click(function(){	$('#data').show();});
	$('#btnShowFast').click(function(){	$('#data').show('fast');});
	$('#btnShowSlow').click(function(){	$('#data').show('slow');});
	$('#btnShowCustom').click(function(){	$('#data').show(1000);});
	
	$('#btnToggle').click(function(t){	$('#data').toggle(2000);});
});
</script>
</head>
<body>
<h4>
	<li>show(duration, callback) : 지정된 경과 시간을 사용하여 서서히 보이기</li>
	<li>hide(duration, callback) : 감추기
	<li>callback : 지정된 효과가 모두 끝난 후 호출되는 함수
</h4>
<hr/>

<fieldset>
	<legend>보이기</legend>
	<input type='button' value='default show' id='btnShow'>
	<input type='button' value='fast show'    id='btnShowFast'>
	<input type='button' value='slow show'    id='btnShowSlow'>
	<input type='button' value='custom show'  id='btnShowCustom'>
</fieldset>
<fieldset>
	<legend>감추기</legend>
	<input type='button' value='default hide' id='btnHide'>
	<input type='button' value='fast hide'    id='btnHideFast'>
	<input type='button' value='slow hide'    id='btnHideSlow'>
	<input type='button' value='custom hide'  id='btnHideCustom'>
</fieldset>
<p/>
<div id='data'>
	<font color='blue' size='4'>명산지 목록</font><br/>
	<ul>
		<li>백두산</li>
		<li>금강산</li>
		<li>한라산</li>
		<li>치악산</li>
	</ul>
	<input type='button' value='toggle' id='btnToggle'>
</div>

<hr/>
</body>
</html>