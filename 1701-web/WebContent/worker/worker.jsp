<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>nonWorker</title>
<script>
window.onload=function(){
	var btnS = document.getElementById('btnStart');
	var btnR = document.getElementById('btnRun');
	
	btnS.onclick=function(){
		var str = "";
		var rst = document.getElementById('result');//div
		var w = new Worker('thread.js');
		w.onmessage=function(ev){
			str = ev.data;
			rst.innerHTML = str;
		}
	}
	
	btnR.onclick=function(){
		alert('run 버튼이 클릭되었습니다.');
	}
	
}


</script>
</head>
<body>
<h3>non worker type Example<hr/></h3>
<input type='button' value='start' id='btnStart'>
<input type='button' value='run' id='btnRun'/>
<p/>
<div id='result'></div>
</body>
</html>