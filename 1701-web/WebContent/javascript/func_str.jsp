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
	padding:30px;
	background-color:#333333;
	color:#ffffff;
	text-align:center;
	box-sizing:border-box;
	font-size:26pt;
	margin-bottom:20px;
}
.btn1{
	width:110px;
	height:30px;
	box-shadow:2px 2px 3px #aaaaaa;
}
#result{
	border:4px outset #aaaaaa;
	border-radius:6px;
	box-shadow:6px 6px 8px #aaaaaa;
	padding:10px;
	box-sizing:border-box;
	width: 340px;
	height:200px;
}

input[type='text']{
	font-size:14pt;
	box-shadow:2px 2px 3px #aaaaaa;
	padding:3px;
	box-sizing:border-bpx;
	
}
</style>
<script >
function start(){
	var ff = document.frm;
	ff.btnJumin.onclick = funcJumin;
	ff.btnSplit1.onclick = funcSplit1;
	ff.btnSplit2.onclick = funcSplit2;
	ff.btnSplit3.onclick = funcSplit3;
}

function funcJumin(){
	var ff = document.frm;
	var rs = document.getElementById('result');
	var jumin = ff.jumin.value;
	var y = jumin.substr(0,2);
	var m = jumin.substr(2,2);
	var d = jumin.substr(4,2);
	var g = Number(jumin.substr(7,1));
	
	var str = '<li>생년 : '  + y;p
	str += '<li>생월 : ' + m;
	str += '<li>생일 : ' + d;
	str += '<li>성별 : ' ;
	str += ( (g%2==1)? '늑대' : '여우');
	rs.innerHTML = str;
	
}

function funcSplit1(){
	var ff = document.frm;
	var rs = document.getElementById('result');
	var ary = ff.str.value.split(' ');
	var sum = 0;
	var avg = 0;
	var str = '';
	for(i=0 ; i<ary.length ; i++){
		sum += Number(ary[i]);
	}
	
	avg = sum / ary.length;
	
	str = '<li>Sum : ' + sum;
	str += '<li>Avg : ' + avg;
	rs.innerHTML = str;
}

function funcSplit2(){
	var ff = document.frm;
	var rs = document.getElementById('result');
	var ary = ff.str.value.split(' ');
	var big = 0;
	var small = 0;
	var str = '';
	for(i=0 ; i<ary.length ; i++){
		if(Number(ary[i]) >=100){
			big++;
		}else{
			small++;
		}
	}
	
	str = '<li>Bing : ' + big;
	str += '<li>Small : ' + small;
	
	rs.innerHTML = str;
}
function funcSplit3(){
	var ff = document.frm;
	var rs = document.getElementById('result');
	var ary = ff.str.value.split(' ');
	var sum = 0;
	var cnt=0;
	var str = '';
	for(i=0 ; i<ary.length ; i++){
		if(isFinite(ary[i])){
			cnt++;
			sum += Number(ary[i]);
		}
	}
	
	str = '<li>SUM : ' + sum;
	str += '<li>Count : ' + cnt;
	
	rs.innerHTML = str;
}
</script>


</head>
<body>
<div id='title'>
	문자함수 응용예
</div>

<form name='frm'>
	<input type='text' size='18' name='jumin' value='801213-1234567'>
	<input type='button' name='btnJumin'  class='btn1' value='주민번호 체크'><p/>
	
	<input type='text' name='str' size='30'
		value='100 200 300 4 5 6 7 8 9 10'><br/><br/>
	<input type='button' value='split 1' name='btnSplit1' class='btn1'>
	<input type='button' value='split 2' name='btnSplit2' class='btn1'>
	<input type='button' value='split 3' name='btnSplit3' class='btn1'>
</form>
<div id='result'></div>

<script>start()</script>
</body>
</html>





