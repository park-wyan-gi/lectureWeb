<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>if1</title>

<script>
window.onload=start;
function start(){
	var btn = document.getElementById('btnRun');
	btn.onclick=function(){
		var ff = document.frm;
		var a = Number(ff.a.value);
		var b = Number(ff.b.value);
		var c=0;
		if(a>b){
			c=a-b;
		}else{
			c=a+b;
		}
		
		ff.result.value = 'if문 처리 결과\n';
		ff.result.value += 'c=' + c;
	}	
}
</script>

</head>
<body>
<form name='frm' method='post'>
	<label>첫번째 수</label>
	<input type='text' name='a'/><br/>
	<label>두번째 수</label>
	<input type='text' name='b'><p/>
	<input type='button' id='btnRun' value='실행'/><p/>
	<strong>결과</strong><br/>
	<textarea rows="10" cols="50" name='result'></textarea>
	
</form>

</body>
</html>