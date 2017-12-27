<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#main{ width:950px; margin:auto;}
#btn{ 
	float:right;
}
#title{ 
	clear:both;
}
#title > span, .list > span { display: inline-block;}
#title { 
	background: #cccccc;
	padding:3px;
	box-sizing: border-box;
	border-bottom:1px solid #aaaaaa;
}
#title > span , .list > span{ width:110px;}
#title > .subject , .list>.subject { width:450px;}
</style>
<script>
var xhr;
function loadXML(){
	var findStr = document.getElementById('findStr').value;
	var url = 'xmlDoc2.jsp?findStr=' + findStr;
	if(xhr == null) xhr = new XMLHttpRequest();
	xhr.open('get', url, true);
	xhr.send();
	xhr.onreadystatechange = setXML;
}
function setXML(){
	if(xhr.status==200 && xhr.readyState==4){
		var xmlDoc = xhr.responseXML;
		var rs = document.getElementById('result');
		var items = xmlDoc.getElementsByTagName('item');
		var str='';
		
		for(i=0 ; i<items.length ; i++){
			var child = items.item(i);
			var serial = child.getElementsByTagName('serial').item(0).firstChild.nodeValue;
			var mdate = child.getElementsByTagName('mdate').item(0).firstChild.nodeValue;
			var subject = child.getElementsByTagName('subject').item(0).firstChild.nodeValue;
			var worker = child.getElementsByTagName('worker').item(0).firstChild.nodeValue;
			var hit = child.getElementsByTagName('hit').item(0).firstChild.nodeValue;
			
			str += "<div class='list'>";
			str += "<span class='serial'>"  + serial  + "</span>";
			str += "<span class='worker'>"  + worker  + "</span>";
			str += "<span class='subject'>" + subject + "</span>";
			str += "<span class='mdate'>"   + mdate   + "</span>";
			str += "<span class='hit'>"     + hit     + "</span>";
			str += "</div>";
		}
		rs.innerHTML = str;
	}
}
</script>

</head>
<body>
<h2><center>게시판</center></h2>
<div id='main'>
	<div id='btn'>
		<input type='text' size='30' id='findStr' onkeyup="loadXML()">
		<input type='button' value='검색' id='btnFind' onclick='loadXML()'>
	</div>
	<div id='title'>
		<span class='serial'>순</span>
		<span class='wordker'>작성자</span>
		<span class='subject'>제목</span>
		<span class='mdate'>작성일</span>
		<span class='hit'>조회수</span>
	</div>
	<div id='result'></div>

</div>
</body>
</html>