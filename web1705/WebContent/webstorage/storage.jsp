<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>storage</title>
<style>
form > label {
	display: inline-block;
	width:80px;
	text-align: right;
}
#zone {
	overflow: hidden;
	margin:20px;
}
#zone >fieldset{
	float:left;
}
#result{
	border:1px solid #aaaaaa;
	padding:10px;
	width:300px; height:200px;
}
</style>
<script>
window.onload = function(){
	var frm = document.frm;
	var rs = document.getElementById('result');
	
	frm.sSave.onclick = function(){
		var eId = frm.eId.value;
		var pwd = frm.pwd.value;
		sessionStorage.setItem('eId', eId);
		sessionStorage.setItem('pwd', pwd);
		rs.innerHTML = '세션영역에 데이터가 저장되었습니다.';
	}
	frm.sLoad.onclick=function(){
		var eId = sessionStorage.getItem('eId');
		var pwd = sessionStorage.getItem('pwd');
		
		var str = '<ul>';
		str += '<li> 아이디 : ' + eId + '</li>';
		str += '<li>암호 : ' + pwd + '</li></ul>';
		
		rs.innerHTML = str;
	}
	
	frm.lSave.onclick = function(){
		var eId = frm.eId.value;
		var pwd = frm.pwd.value;
		
		localStorage.setItem('eId', eId);
		localStorage.setItem('pwd', pwd);
		
		rs.innerHTML = 'localStorage에 저장됨...';
	}
	
	frm.lLoad.onclick =function(){
		var eId = localStorage.getItem('eId');
		var pwd = localStorage.getItem('pwd');
		var str = '<ul>';
		str += '<li>아이디 : ' + eId + '</li>';
		str += '<li>암호 : ' + pwd + '</li></ul>';
		rs.innerHTML = str;
	}
	
}

</script>

</head>
<body>
<h2>localStorage | sessionStorage Exmaple</h2>
<form name='frm' >
	<label>아이디</label>
	<input type='text' name='eId' value='park' /><br/>
	
	<label>암호</label>
	<input type='password' name='pwd' value='1111' /><br/>
	<div id='zone'>
		<fieldset>
			<legend>Session Storage</legend>
			<input type='button' value='SAVE' name='sSave'/>
			<input type='button' value='LOAD' name='sLoad' />
		</fieldset>
		<fieldset>
			<legend>Local Storage</legend>
			<input type='button' value='SAVE' name='lSave'/>
			<input type='button' value='LOAD' name='lLoad' />
		</fieldset>
	</div>
	<div id='result'></div>
	
</form>
</body>
</html>




