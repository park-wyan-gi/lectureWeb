<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#title{
	background-color: #aaaaaa;
	padding:3px;
	box-sizing: border-box;
}
#title > span, .list > span { display: inline-block;}
.list{ 
	border-bottom:1px solid #cccccc;
	padding:4px;	
	box-sizing: border-box;
}
.list:hover { background-color: #eeeeee}
.irum{ width:90px }
.addr{ width:80px}
.phone{ width:120px;}
</style>
<script>
var xhr;
function loadFunc(){
	xhr = new XMLHttpRequest();
	xhr.open('get', './xmldoc.jsp', true);
	xhr.send();
	xhr.onreadystatechange=setXML;
}

function setXML(){
	if(xhr.status == 200 && xhr.readyState == 4){
		var xmlDoc = xhr.responseXML;
		var rs = document.getElementById('result');
		var member = xmlDoc.getElementsByTagName('member');
		var str = '';
		for(i=0 ; i<member.length; i++){
			var child = member.item(i);
			var n = child.getElementsByTagName('name').item(0).firstChild.nodeValue;
			var a = child.getElementsByTagName('addr').item(0).firstChild.nodeValue;
			var p = child.getElementsByTagName('phone').item(0).firstChild.nodeValue;
			str += "<div class='list'>";
			str += "<span class='irum'>"  + n + "</span>";
			str += "<span class='addr'>"  + a + "</span>";
			str += "<span class='phone'>" + p + "</span>";
			str += "</div>";
		}
		rs.innerHTML = str;
	}
}
</script>
</head>
<body>
<h2>
XML 유형의 파일을 읽어 현재 페이지에 표시<hr/>
</h2>
<input type='button' value='Load XML' onclick='loadFunc()'/>

<p/>
<div id='title'>
	<span class='irum'>성명</span>
	<span class='addr'>주소</span>
	<span class='phone'>연락처</span>
</div>
<div id='result'></div>
</body>
</html>