<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>if</title>
<style>
#if, #if input{ font-size:25pt; }
#if>h1{
	color:#0000ff;
	font-size:40pt;
	border:1px solid #aaaaaa;
	padding-left:20px;
	border-left-width:10px;
	border-radius: 0 10px 10px 0;
}

#if input[name=score]{ color:#ff0000; }
#if #btn{ color:#0000ff;}
#if #result{
	color:#00ff00;
	font-size:30pt;
	margin-top:10px;
	width:400px; height:200px;
}
</style>

<script>
	window.onload=function(){//익명 블럭
		var frm = document.frm;
		var str = '';
		
		frm.btn.onclick = function(){
			var v = frm.score.value;
			str = '';
			str += '성적 : ' + v  + '\n';
			if(v>=90)           str += '학점 : A';
			else if(v>=80)  str += '학점 : B';
			else if(v>=70)  str += '학점 : C';
			else if(v>=60)  str += '학점 : D';
			else                   str += '학점 : F';

			frm.result.value = str;
		}
	}
</script>

</head>
<body>
<div id='if'>
	
	<h1>if</h1>
	<p>숫자를 입력하여 학점을 구해 출력</p>
	<form name='frm' method='post'>
		<label>성적</label>
		<input type='text' name='score'  value='90' size='3'/>
		<input type='button' id='btn'  name='btn' value='학점구하기' />
		<br/>
		<textarea cols='50' rows='10' name='result' id='result'></textarea>
	</form>

</div>
</body>
</html>