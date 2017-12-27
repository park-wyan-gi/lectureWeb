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
	if(xhr==null) xhr = new XMLHttpRequest();
	var btnFind = document.getElementById('btnFind');
	btnFind.onclick = find;
}
function find(){
	var findStr = document.getElementById('findStr').value;
	var rs = document.getElementById('result');
	
	xhr.open('get', './list.jsp?findStr=' + findStr, true);
	xhr.send();
	xhr.onreadystatechange = function(){
		if(xhr.status==200 && xhr.readyState==4){
			rs.innerHTML = xhr.responseText;
		}
	}
}
</script>
</head>
<body>
<h2>게시판 검색</h2>
<input type='text' id='findStr'>
<input type='button' value='검색' id='btnFind'/>
<hr/>
<div id='result'></div>
<script>start()</script>
</body>
</html>