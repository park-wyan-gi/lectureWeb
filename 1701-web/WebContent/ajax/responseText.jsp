<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
var xhr;
function start(){
	if(xhr == null) xhr = new XMLHttpRequest();
	//button에 이벤트 처리
	var btnText = document.getElementById('btnText');
	var btnJSP  = document.getElementById('btnJSP');
	var btnHTML = document.getElementById('btnHTML');
	var btnGu = document.getElementById('btnGu');
	
	btnText.onclick = readText;
	btnJSP.onclick  = readJSP;
	btnHTML.onclick = readHTML;
	btnGu.onclick   = readGu;
}

function readText(){
	xhr.open('get', './test.txt', true);
	xhr.send();
	var rs = document.getElementById('result');
	var str = '';
	xhr.onreadystatechange=function(){
		if(xhr.status==200 && xhr.readyState==4){
			str = xhr.responseText;			
			rs.innerHTML = str;
		}
	}
}
function readJSP(){
	if(xhr == null) xhr = new XMLHttpRequest();
	xhr.open('get', './test.jsp', true);
	xhr.send();

	var rs = document.getElementById('result');
	xhr.onreadystatechange=function(){
		if(xhr.status==200 && xhr.readyState==4){
			rs.innerHTML = xhr.responseText;			
		}
	}
}
function readHTML(){
	if(xhr==null) xhr = new XMLHttpRequest();
	xhr.open('get', './test.html', true);
	xhr.send();
	var rs = document.getElementById('result');
	xhr.onreadystatechange=function(){
		if(xhr.status==200 && xhr.readyState==4){
			rs.innerHTML = xhr.responseText;
		}		
	}
}

function readGu(){
	if(xhr==null) xhr = new XMLHttpRequest();
	
	var rs = document.getElementById('result');
	
	var dan = document.getElementById('dan').value;
	xhr.open('get', './gu.jsp?dan=' + dan, true);
	xhr.send();
	xhr.onreadystatechange=function(){
		if(xhr.status==200 && xhr.readyState==4){
			rs.innerHTML = xhr.responseText;
		}		
	}
}
</script>
</head>
<body>
<h2>ajax를 사용한 텍스트문서 읽기</h2>
<input type='button' value='TEXT'  id='btnText'/>
<input type='button' value='JSP'   id='btnJSP'/>
<input type='button' value='HTML'  id='btnHTML'/><br/>
<input type='text' name='dan' id='dan' size='4' value='2'/>
<input type='button' id='btnGu' value='구구단'/>
<hr/>
<div id='result'></div>
<script>start()</script>
</body>
</html>










