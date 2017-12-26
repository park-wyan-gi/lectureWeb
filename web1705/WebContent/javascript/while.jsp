<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>while</title>
<style>
#while li{
	list-style: none;
	margin-left:-30px;
	padding-left:0;
}

#while li:first-child{
	border-top: 3px solid #aaaaaa;
}
#while li:last-child{
	border-bottom: 3px solid #aaaaaa;
}
#while li:nth-child(5n){
	border-bottom : 1px solid #aaaaaa;
}

#while #result {
	border:0px outset #bbbbbb;
	width:300px ; height:250px;
	overflow: scroll;
}
</style>
<script>
window.onload=function(){
	var frm = document.frm;
	frm.btn.onclick= function(){
		var x = Number(frm.x.value);
		var y = Number(frm.y.value);
		var i=x;
		var rs = document.getElementById('result');
		var str = '<h3>3 또는 5의 배수</h3><ul>';
		while(i<=y){
			if(i%3==0 || i%5==0){
				str += '<li>' + i + '</li> ';
			}
			i++;
		}
		str += '</ul>';
		rs.innerHTML = str;
	}
}

</script>

</head>
<body>
<div id='while'>
	<h1>while</h1>
	<p> x~y까지의 수중 3또는 5의배수만을 구하여 출력하시오.</p>
	
	<form name='frm' method='post'>
		<input type='text' name='x' value='1' size='2' /> ~
		<input type='text' name='y' value='100' size='2'/>
		<input type='button' name='btn' value='실행'/>
		<div id='result'></div>
	</form>
</div>
</body>
</html>