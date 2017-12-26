<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>storage2</title>
<script>
function Data(eId, pwd){
	this.eId = eId;
	this.pwd = pwd;
	
	this.setEId = function(eId){ this.eId = eId;}
	this.setPwd = function(pwd){ this.pwd = pwd; }
	
	this.getEId = function(){ return this.eId;}
	this.getPwd = function() { return this.pwd; }
}

window.onload = function(){
	var frm = document.frm;
	var rs = document.getElementById('result');
	
	//localStorage에 저장된 값을 읽어 form에적용
	var obj = localStorage.getItem("obj");
	if(obj != null){
		//문자열화(직렬화)로 저장된 자료를 객체화 시킴
		var d = JSON.parse(obj); 
		frm.eId.value = d.eId;
		frm.pwd.value = d.pwd;
		rs.innerHTML = 'Id : ' + d.eId + "<br/>Pwd:" + d.pwd;
	}
	
	frm.btnSave.onclick = function(){
		var eId = frm.eId.value;
		var pwd = frm.pwd.value;
		data = new Data(eId, pwd);
		var obj = JSON.stringify(data);//object -->serialize
		alert(obj);
		localStorage.setItem('obj', obj);
	}
	frm.btnLoad.onclick = function(){
		var obj = localStorage.getItem("obj");
		if(obj != null){
			var d = JSON.parse(obj); 
			frm.eId.value = d.eId;
			frm.pwd.value = d.pwd;
			rs.innerHTML = 'Id : ' + d.eId + "<br/>Pwd:" + d.pwd;
		}
	}
}

</script>
</head>
<body>
<h2>object를 storage에저장</h2>
<form name='frm'>
	<label>아이디</label>
	<input type='text' name='eId' value='kim' /><br/>
	<label>암호</label>
	<input type='password' name='pwd' value='1111' />
	<p/>
	<input type='button' name='btnSave' value='저장'/>
	<input type='button' name='btnLoad' value='읽기'/>
	<div id='result'></div>
</form>
</body>
</html>
