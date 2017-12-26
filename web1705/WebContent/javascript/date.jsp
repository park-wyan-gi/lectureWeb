<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>date</title>
<style>
#div1, #div2{
	border:2px solid #3333ff;
	width:300px; height:34px;
	padding:10px;
	font-size:24px;
}
#div1{
	background-color: #eeeeff;
}
#div2{
	margin-bottom:10px;
}
#btnStart, #btnStop{
	width:70px; height:34px;
}
</style>
<script>
var time = 0;
var timer = 0;
window.onload = function(){
	watch();
	var btnStart = document.getElementById('btnStart');
	var btnStop = document.getElementById('btnStop');
	
	var btnTStart = document.getElementById('btnTStart');
	var btnTStop = document.getElementById('btnTStop');
	
	var sw;
	btnStart.onclick = function(){
		time = 0;
		sw = setInterval(stopWatch, 10);
	}
	btnStop.onclick = function(){
		clearInterval(sw);//setinterval기능 중지
	}
	
	//timer
	btnTStart.onclick = function(){
		var t = document.getElementById('startTimer');
		timer = Number(t.value);
		tm = setInterval(funcTimer, 1000);
	}
	
	btnTStop.onclick = function(){
		clearInterval(tm);
	}
	
}
function funcTimer(){
	var div3 = document.getElementById('div3');
	timer--;
	div3.innerHTML = timer;
	if(timer <= 0){
		clearInterval(tm);
		div3.innerHTML = 'Timer Over !!!!';
	}
}


function stopWatch(){
	var div2 = document.getElementById('div2');
	time++;
	div2.innerHTML = time;
}
function watch(){
	setInterval(createDate,1000);
}
function createDate(){
	var week = ['일', '월', '화', '수', '목', '금', '토'];
	var now = new Date();
	var div1 = document.getElementById("div1");
	var str = '';
	str = now.getFullYear() + "-";
	str += (now.getMonth()+1) + "-";
	str += now.getDate();
	str += '(' + week[now.getDay()] + ')' ;
	
	str += ' ' + now.getHours() + ':' ;
	str += now.getMinutes() + ':' ;
	str += now.getSeconds();
	
	div1.innerHTML = str;
	
}

</script>

</head>
<body>
<h1>현재 시간</h1>
<div id='div1'>현재시간</div>
<h2>Stop Watch</h2>
<div id='div2'>StopWatch</div>
<input type='button' value='start' id='btnStart' />
<input type='button' value='stop' id='btnStop' />
<h2>Timer</h2>
<label>설정시간</label>
<input type='text' name='startTimer'  id = 'startTimer' value='60' /><br/>
<label>남은시간:</label>
<span id='div3'></span><p/>
<input type='button' value='Start' id='btnTStart' />
<input type='button' value='Stop' id='btnTStop' />

</body>
</html>










