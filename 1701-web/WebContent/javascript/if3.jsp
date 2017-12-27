<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no">
<title>if3</title>
<style>
#result{
	width:300px;
	height:100px;
	overflow: auto;
	border:2px inset #aaaaaa;
}
</style>
<script>
window.onload=start;
function start(){
	var btn = document.getElementById('btnRun');
	btn.onclick=function(){
		var ff = document.frm; /*이름이 frm인 폼 전체를 객체명 ff에 대입 */
		var sel = ff.sel;
		//alert(sel.selectedIndex);//선택된 index값.(0 base)
		//alert(sel.value);//선택된 option의 value값
		var v = Number(sel.value);
		var str = '<h4>if~else if로 처리된 결과</h4>';
		if(v==1){
			str += "<font color='#ff0000' size='6'>A등급</font>";
		}else if(v==2){
			str += "<font color='#ff0000' size='6'>B등급</font>";
		}else if(v==3){
			str += "<font color='#ff0000' size='6'>C등급</font>";
		}else if(v==4){
			str += "<font color='#ff0000' size='6'>D등급</font>";
		}else if(v==5){
			str += "<font color='#ff0000' size='6'>F등급</font>";
		}
		
		var r = document.getElementById('result');//div
		r.innerHTML = str;
		
	}
	
}
</script>
</head>
<body>
<form name='frm' method='post'>
	<label>당신의 급수</label>
	<select name='sel' style='width:80px'>
		<option value='1'>1</option>
		<option value='2'>2</option>
		<option value='3'>3</option>
		<option value='4'>4</option>
		<option value='5'>5</option>
	</select>
	<p/>
	<input type='button' value='실행' id='btnRun' />
	<hr/>
	<div id='result'></div>
</form>
</body>
</html>