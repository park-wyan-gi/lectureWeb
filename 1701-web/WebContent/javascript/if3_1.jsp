<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no">
<title>Insert title here</title>
<style>
#title{
	font-size:20pt;
	border:2px solid #aaaaaa;
	background-color:#eeeeee;
	padding:20px;
	margin-bottom:20px;
}
#score{
	font-size:20pt;
	width:90px;
	height:25px;
}
#btnRun{
	width:90px;
	height:30px;
}
#result{
	overflow: auto;
	width:190px;
	height:90px;
	border:1px solid #aaaaaa;
}
</style>

<script>
window.onload=start;
function start(){
	var btn = document.getElementById('btnRun');
	var rs = document.getElementById('result');

	btn.onclick = function(){
		var ff = document.frm;
		var score = Number(ff.score.value);
		var str ='학점은 ';
		if(score>=90) str += 'A 입니다.';
		else if(score>=80) str += 'B 입니다.';
		else if(score>=70) str += 'C 입니다.';
		else if(score>=60) str += 'D 입니다.';
		else if(score< 60) str += 'F 입니다.';

		rs.innerHTML = str;
	}
}

</script>

</head>
<body>
<div id='title'>
점수를 입력 받아 학점을 계산하시오.
</div>

<form name='frm' method='post'>
	<input type='text' name='score' id='score' value='90'>
	<input type='button' value='실행' id='btnRun'><br/>
	<div id='result'>
</form>

</body>
</html>