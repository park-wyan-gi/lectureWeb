<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.title{
	font-size:30pt;
	color:#ff0000;
	padding:20px;
	border:1px solid #aaaaaa;
	box-sizing: border-box;
}

</style>
<script>
function init(){
	var title = document.getElementById('title');
	
	title.style.backgroundColor='#aaaaff';
	
	//속성지정
	document.getElementById('btnSet').onclick = function(){
		title.setAttribute('class', 'title');
	}
	//속성 해제
	document.getElementById('btnRemove').onclick = function(){
		title.removeAttribute('class');
	}
	
	//속성확인
	document.getElementById('btnGet').onclick = function(){
		var str = 'ID : ' + title.getAttribute("id")   + '\n';
		str += 'CLASS :' + title.getAttribute("class") + '\n';
		str += 'Value : ' + title.innerHTML;
		
		alert(str);
	}

}

</script>

</head>
<body>
<h2>Node에 속성(attribute) 지정/해제</h2>
<div id='title'>
화이팅 1701~~
</div>
<input type='button' value='속성지정' id='btnSet'>
<input type='button' value='속성해제' id='btnRemove'>
<input type='button' value='속성확인' id='btnGet'>

<script>init()</script>
</body>
</html>