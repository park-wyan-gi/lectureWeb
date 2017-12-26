<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>event</title>
<script>
function fun(a, b, ev){
	var ev = ev || window.event;
	var rs = document.getElementById('result');
	var str = "<li>a=" + a; 
	str +=   "<li>b=" + b;
	str += "<li>event name = " + ev.srcElement.name;
	str += "<li>event value = " + ev.srcElement.value;	
	str += "<li>event type = " + ev.srcElement.type;	
	str += "<li>event id = " + ev.srcElement.id;	
	str += "<li>event x = " + ev.x;	
	str += "<li>event y = " + ev.y;	
	rs.innerHTML = str;
}

</script>
</head>
<body>
<input type='button' value='fun()'           id='btn1' name='btn1'  onclick='fun()'/>
<input type='reset'    value='fun(10)'       id='btn2'  name='btn2' onclick='fun(10)'/>
<input type='button' value='fun(10,20)' id='btn3'  name='btn3' onclick='fun(10,20)'/>
<br/>
<div id='result'></div>
</body>
</html>