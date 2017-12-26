<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>function</title>
<script>
window.onload = start; // call back type

function start(){
	var frm = document.frm;
	var rs = document.getElementById('result'); //결과출력용 div
	frm.btn1.onclick = function(){
		var v = func1();
		rs.innerHTML = 'result=' + v;
	}
	
	frm.btn2.onclick = function(){
		var v = func1(10);
		rs.innerHTML = 'result=' + v;
	}
	
	frm.btn3.onclick = function(){
		var v = func1(10,20);
		rs.innerHTML = 'result=' + v;
	}
}

function func1(x,y){
	if(x==null) x=0;
	if(y==null) y=0;
	
	return x+y;	
}

</script>
</head>
<body>
<h1>사용자 정의 함수</h1>
<ul>
	<li>함수정의시 반환형에 관한 내용은 기술되지 않고 문장 끝에 
	       return문을 사용하여 처리 결과를 반환할 수 있다.</li>
	<li>매개변수의 개수나 유형에 따른 함수를 중복선언하지 않고
	       사용할 매개변수의 최대 크기만을 선언하여 사용할 수 있다.</li>
</ul>
<form name='frm' method='post'>
	<input type='button' value='sum()' name='btn1' />
	<input type='button' value='sum(x)' name='btn2' />
	<input type='button' value='sum(x, y)' name='btn3' />
</form>
<p/>
<div id='result'></div>


</body>
</html>

