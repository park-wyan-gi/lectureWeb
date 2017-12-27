<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no">
<title>array_test2</title>
<style>
#title{
	border:1px solid #aaaaaa;
	padding:15px;
	box-sizing:border-box;
	margin-bottom:20px;
}

input[type='text'] {
	width:120px;
	height:25px;
	font-size:15pt;
	margin:4px;
}
input[type='button']{
	width:80px;
	height:30px;
	font-size:10pt;
}

#result{
	border:1px solid #aaaaaa;
	padding:10px;
	width:340px;
	height:150px;
	overflow: auto;
	box-sizing:border-box;
}

#errKor, #errMat{
	color:#ff4444;
	font-size:9pt;
}
</style>

<script>
//자바의 Vo객체와 유사
function DataVo(irum, kor, mat){
	this.irum = irum;
	this.kor  = kor;
	this.mat  = mat;
	this.tot  = kor + mat;
	this.avg  = this.tot / 2.0;
	//메서드
	this.output = function(){
		var str = '<tr>';
		str += '<td>' + this.irum + '</td>';
		str += '<td>' + this.kor + '</td>';
		str += '<td>' + this.mat + '</td>';
		str += '<td>' + this.tot + '</td>';
		str += '<td>' + this.avg + '</td>';
		str += '</tr>';
		
		return str;
	}
}


function start(){
	data = new Array();
	var ff = document.frm;
	
	//버튼들에 클릭 이벤트
	ff.btnSave.onclick     = saveFunc;
	ff.btnPrn.onclick      = prn;
	ff.btnPrnIrum.onclick  = prnIrum;
	ff.btnPrnScore.onclick = prnScore;
	
	
}
function saveFunc(){ //저장 버튼이 클릭
	var ff = document.frm;
	var rs = document.getElementById('result');
	
	var irum = ff.irum.value;
	
	var kor = ff.kor.value;
	var mat = ff.mat.value;
	
	var errKor = document.getElementById('errKor');
	var errMat = document.getElementById('errMat');

	errKor.innerHTML = '';
	errMat.innerHTML = '';
	
	if(! isFinite(kor)){
		ff.kor.focus();
		ff.kor.style.backgroundColor='#ffeeee';
		errKor.innerHTML = '국어 점수를 확인해 주세요';
		return;
	}
	
	if(! isFinite(mat)){
		ff.mat.focus();
		ff.mat.style.backgroundColor='#ffeeee';
		errMat.innerHTML = '수학 점수를 확인해 주세요';
		return;
	}
	
	var temp = new DataVo(irum, kor, mat);
	data.push(temp);
	
	rs.innerHTML = "<font color='blue'>데이터가 정상적으로 입력됨</font>";
}
function prn(){ //입력 순서대로 출력
	output(data);
}
function output(dd){
	var rs = document.getElementById('result');
	var str = "<table border='1' width='100%'>";
	for(d in dd){
		str += dd[d].output();
	}
	str += '</table>';
	rs.innerHTML = str;
}
function prnIrum(){ //이름순으로 출력
	var temp = new Array();
	temp = temp.concat(data);
	
	temp.sort(sortIrum);
	output(temp);

}
function prnScore(){ //평균순으로 출력
	var temp = new Array();
	temp = temp.concat(data);
	
	temp.sort(sortScore);
	output(temp);
}

function sortIrum(a,b){
	if(a.irum > b.irum) return 1;
	else return -1;
}


function sortScore(a,b){//평균순 정렬
	r = a.avg - b.avg;
	return r;
}
</script>
</head>
<body>
<div id='title'>
	성명, 국어, 수학을 입력받아 배열에 저장 한 후 출력시 총점과 평균을 계산하여 
	함께 출력 하시오.
</div>
<form name='frm' method='post'>
	<label>성명</label><input type='text' name='irum'><br/>
	<label>국어</label><input type='text' name='kor'><span id='errKor'></span>
	<br/>
	
	<label>수학</label><input type='text' name='mat'><span id='errMat'></span>
	<br/>
	
	<p/>
	<input type='button' value='저장'   id='btnSave'     name='btnSave'>
	<input type='button' value='출력'   id='btnPrn'      name='btnPrn'>
	<input type='button' value='이름순' id='btnPrnIrum'  name='btnPrnIrum'>
	<input type='button' value='평균순' id='btnPrnScore' name='btnPrnScore'>
</form>
<p/>
<div id='result' contenteditable="true"></div>

<script>start()</script>
</body>
</html>