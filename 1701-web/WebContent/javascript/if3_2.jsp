<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no">
<title>if3_2</title>
<style>
label{
	display:inline-block;
	width:70px;
	text-align: right;
}
#btnRun{
	width:100px;
	font-size:14pt;
	height:40px;
	position:relative;
	left:80px;
}
#result{
	border:1px outset #aaaaaa;
	padding:10px;
	width:220px;
	height:150px;
	overflow: auto;
	background-image: url(../images/back3.png);
	background-repeat: no-repeat;
	background-size:100% 100%;
}
</style>
<script>
window.onload=start;
function start(){
	var btn = document.getElementById('btnRun');
	var rs =  document.getElementById('result');
	
	btn.onclick=function(){
		var ff = document.frm;
		var cn = ff.codeName.value;
		var ea = Number(ff.ea.value);
		var price = Number(ff.price.value);
		var amt=0;
		var str='';
		//구매수량에 따른 할인율
		var rate = 0;
		if(ea>=100000)     rate = 0.3;
		else if(ea>=20000) rate = 0.15;
		else if(ea>=10000) rate = 0.1;
		else if(ea>=1000)  rate = 0.05;
		else if(ea>=100)   rate = 0.01;
		
		amt = (ea*price) - (ea*price*rate);
		
		str = "<font size='5' color='blue'>Result</font><p/>";
		str += "<font size='4' color='black'>";
		str += "<strong>품명 : </strong>" + cn + "<br/>";
		str += "<strong>수량 : </strong>" + ea.toLocaleString('en') + "<br/>";
		str += "<strong>단가 : </strong>" + price.toLocaleString('en') + "<br/>";
		str += "<strong>할인율 : </string>" + rate +"<br/>";
		str += "<strong>총액 : </string>" + amt.toLocaleString('en') +"<br/>";
		str += "</font>";
		
		rs.innerHTML = str;
	}
}

</script>


</head>
<body>
<div id='title'>
구매수량을 기준으로 할인 금액을 계산하고 총액을 계산하여 그 결과를 출력
</div>
<form name='frm' method='post'>
	<label>제품명</label>
	<input type='text' name='codeName' value='냉장고'><br/>
	<label>구매 수량</label>
	<input type='text' name='ea' value='999'><br/>
	<label>단가</label>
	<input type='text' name='price' value='5000'><p/>
	<input type='button' value='계산' id='btnRun'><p/>
	<div id='result'></div>
</form>

</body>

</html>