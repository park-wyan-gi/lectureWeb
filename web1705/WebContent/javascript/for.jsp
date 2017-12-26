<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>for</title>
<style>
#for #result {
	border:3px dashed #0000ff;
	padding:4px;
	width:250px ; height: 300px;
	overflow: scroll;
	margin-top:6px;
}
</style>

<script>
window.onload = start; // call back type

function start(){
	var frm = document.frm;
	var str = '';
	var rs = document.getElementById('result');
	frm.btn.onclick = function(){
		var x = Number(frm.x.value);
		var y = Number(frm.y.value);
		//TODO
		str = x + ' ~ ' + y + ' 까지 구구단...<p/>';
		
		for(i=x ; i<=y ; i++){
			str += i + ' 단 <br/>';
			for(j=1 ; j<10 ; j++){
				var temp = i + ' * ' + j + ' = ' + (i*j) + '<br/>';
				str += temp;
			}
			str += '<br/>';
		}
		rs.innerHTML = str;
	}
}
</script>

</head>
<body>
<div id='for'>
	<h1>for</h1>
	<p>입력된 x~y단 까지의 구구단 출력</p>
	<form name='frm' method='post' >
		<label>구구단</label>
		<input type='text' name='x' value='2'  size='2'/> ~
		<input type='text' name='y' value='9' size='2' />
		<input type='button' name='btn' value='실행' /><br/>
		<div id='result'></div>
	</form>
</div>


</body>
</html>