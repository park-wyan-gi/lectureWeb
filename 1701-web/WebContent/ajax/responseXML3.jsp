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
var xml;
var xsl;
function loadXML(){
	var findStr = document.getElementById('findStr').value;
	var url = 'xmlDoc2.jsp?findStr=' + findStr;
	if(xhr == null) xhr = new XMLHttpRequest();
	xhr.open('get', url, true);
	xhr.send();
	xhr.onreadystatechange = loadXSL;
}

function loadXSL(){
	if(xhr.status == 200 && xhr.readyState == 4){
		if(xhr == null) xhr = new XMLHttpRequest();
		
		xml = xhr.responseXML;
		
		xhr.open('get', 'xslDoc.xsl', true);
		xhr.send();
		xhr.onreadystatechange =margeXMLXSL;
	}	
}

function margeXMLXSL(){
	if(xhr.status == 200 && xhr.readyState == 4){
		var rs = document.getElementById('result');
		xsl = xhr.responseXML;
		
		if(window.ActiveXObject){//ie
			rs.innerHTML = xml.transformNode(xsl);
		}else{//w3c
			var xslt = new XSLTProcessor();
			xslt.importStylesheet(xsl);
			var temp = xslt.transformToFragment(xml, document);
			rs.innerHTML = "";
			rs.appendChild(temp);
		}
	}
}
</script>

</head>
<body>
<h2><center>게시판(XML + XSL)</center></h2>
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