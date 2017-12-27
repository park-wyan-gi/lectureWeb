<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>event_check</title>
<style>
#btn, #btn2{
   width:100px;
   height:30px;
    cursor:pointer;
}
#ep{
   width:250px;
   height:60px;
   padding:10px;
   box-sizing:border-box;
}
#ep:hover{
   background-color:#aaaaaa;
   cursor:pointer;
}
</style>
<script>
function start(){
	//input, p 태그에 click 이벤트 추가 viewEvent() 호출
   var btn = document.getElementById('btn');
   
	var btn2 = document.getElementById('btn2');
   
	var p = document.getElementById('ep');
   btn.onclick = viewEvent;
   btn2.onclick = viewEvent;
	p.onclick = viewEvent;
}
function viewEvent(ev){
	var rs = document.getElementById('result');
	var str = '';
	
	for(s in ev){
		str += '<li>' + s + ' ------ ' + ev[s];
	}
	
	str += '<li>type ------ ' + ev.srcElement.type;
	str += '<li>name -----' + ev.srcElement.name;
	rs.innerHTML = str;
	
	if(ev.srcElement.name == 'red'){
		ep.style.backgroundColor='rgba(255,0,0,0.5)';
	}else if(ev.srcElement.name == 'blue'){
		ep.style.backgroundColor='rgba(0, 0,255,0.5)';
	}
	
	
}
</script>


</head>
<body>
<input type='button' id='btn'   name = 'red'    value='이벤트 체크'>
<input type='button' id='btn2' name = 'blue'  value='이벤트 체크'>

<p id='ep'>이곳을 클릭하세요~</p>

<div id='result'></div>

<script>start()</script>
</body>
</html>