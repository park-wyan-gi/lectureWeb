<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no">
<title>array_test1</title>
<style>
#title{
	border:1px solid #aaaaaa;
	padding:15px;
	box-sizing:border-box;
	margin-bottom:20px;
}

input[type='text'] {
	width:87px;
	height:25px;
	font-size:15pt;
}
input[type='button']{
	width:90px;
	height:30px;
	font-size:10pt;
}

#result{
	border:1px solid #aaaaaa;
	padding:10px;
	width:188px;
	height:150px;
	overflow: auto;
	box-sizing:border-box;
}
</style>

<script>
function start(){
	data = new Array();
	position = 0; //데이터가 저장될 위치
	
	var ff = document.frm;
	var rs = document.getElementById('result');
	
	var btnSave = ff.btnSave;
	var btnPrn = ff.btnPrn;
	var btnPrnSort = ff.btnPrnSort;
	
	btnSave.onclick = saveFunc;
	btnPrn.onclick = prn; 
	btnPrnSort.onclick = prnSort; 
}

function saveFunc(){
	var rs = document.getElementById('result');
	var ff = document.frm;
	var d = ff.irum.value;
	if(d==''){
		rs.innerHTML = "<font color='red'>이름을 입력하세요.</font>";
		return;
	}
	
	data[position] = d;
	position++;
	
	rs.innerHTML = "<font color='blue'>데이터가 저장되었습니다.</font>";
	
}
function prn(){
	var rs = document.getElementById('result');
	
	rs.innerHTML = data.join("<br/>");
	
}
function prnSort(){
	var rs = document.getElementById('result');
	var tempData = new Array();
	tempData = tempData.concat(data);
	tempData.sort();
	
	rs.innerHTML = tempData.join("<br/>");
}
</script>
</head>
<body>
<div id='title'>
	성명을 입력받아 배열에 저장 한 후 출력 하시오.
</div>
<form name='frm' method='post'>
	<input type='text' name='irum'>
	<input type='button' value='저장' id='btnSave' name='btnSave'><p/>
	
	<input type='button' value='출력' id='btnPrn' name='btnPrn'>
	<input type='button' value='오름차 출력' id='btnPrnSort' name='btnPrnSort'>
</form>
<p/>
<div id='result'></div>

<script>start()</script>
</body>
</html>