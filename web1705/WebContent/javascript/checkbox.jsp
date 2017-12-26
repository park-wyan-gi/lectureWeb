<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>checkbox</title>
<style>
#result {
	border:2px solid #4444ff;
	padding:4px;
	width:200px ; height:100px;
	overflow:auto;
	background-color: #ddddff;
}
</style>
<script>
window.onload = function(){
	var frm = document.frm;
	var len = frm.chk.length; //체크박스 버튼의 개수
	var re = document.getElementById('result');

	frm.btn.onclick= function(){
		var str = '';
		for(i=0 ; i<len ; i++){
			if( frm.chk[i].checked )	{
					str += frm.chk[i].value + '<br/>';
			}		
		}	
		
		re.innerHTML = str;
	}
	
	frm.btnAll.onclick = function(){
		for(i=0 ; i<len ; i++){
			frm.chk[i].checked=true;		
		}
	}
}
</script>
</head>
<body>
<h1>checkbox</h1>
<form name='frm' method='post' action = 'checkbox_result.jsp'>
	<div id='result'></div>
	<br/>
	<label><input type='checkbox' name='chk'  value='티아라'>티아라</label>
	<label><input type='checkbox' name='chk'  value='소녀시대'>소녀시대</label>
	<label><input type='checkbox' name='chk'  value='황신혜'>황신혜</label>
	<label><input type='checkbox' name='chk'  value='김미화'>김미화</label>
	<label><input type='checkbox' name='chk'  value='이영자'>이영자</label>
	<label><input type='checkbox' name='chk'  value='고두심'>고두심</label>
	<label><input type='checkbox' name='chk'  value='신지'>신지</label>
	<br/>
	<input type='button' name='btn' value='CLICK' />
	<input type='reset' value='모두해제' />
	<input type='button' value='모두 선택' name='btnAll' />
	<input type='submit' value='전송' />
</form>
</body>
</html>