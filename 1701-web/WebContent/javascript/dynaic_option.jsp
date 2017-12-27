<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>dynamic_option</title>
<style>
#sel{
   width:200px;
   margin-top:10px;
   margin-bottom:10px;
}
#result{
   border:1px inset #aaaaaa;
   width:200px;
   height:100px;
}
</style>
<script>
function DataVo(n, a, z){//이름, 주소, 우편번호
	this.name = n;
	this.address = a;
	this.zip = z;
}

function start(){
   //data setting
   var aryMnt = new Array();
   var aryRiver = new Array();
   var buttonFlag=''; //명산, 명천 버튼이 클릭된 경우 상태값 저장.
   
   aryMnt.push( new DataVo('설악산', '서초1', '11-111'));
   aryMnt.push( new DataVo('금강산', '서초2', '11-112'));
   aryMnt.push( new DataVo('지리산', '종로1', '11-113'));
   aryMnt.push( new DataVo('내장산', '종로2', '11-114'));
   aryMnt.push( new DataVo('남산',     '구로1', '11-115'));
   aryMnt.push( new DataVo('치악산', '구로2', '11-116'));
	
   aryRiver.push( new DataVo('한강', '서울', '22-221')); 
   aryRiver.push( new DataVo('두강', '인천', '22-222')); 
   aryRiver.push( new DataVo('세강', '대구', '22-223')); 
   aryRiver.push( new DataVo('오강', '부산', '22-224')); 
	
	
	var ff = document.frm;
	var rs = document.getElementById('result');
	
	ff.mnt.onclick = function(){
		buttonFlag='mnt';
		ff.sel.length=0; // select 상자의 값을 초기화
		for(i=0 ; i<aryMnt.length ; i++){
			d = aryMnt[i];
			ff.sel.options[i] = new Option(d.name + '---' + d.address + '---' + d.zip);
		}
	}
	
	ff.river.onclick = function(){
		buttonFlag='river';
		ff.sel.length=0;
		for(i=0 ; i<aryRiver.length ; i++){
			d = aryRiver[i];
			ff.sel.options[i] = new Option(d.name + '---' + d.address + '---' + d.zip);
		}
	}
	
	ff.sel.onchange = function(ev){
		var str = '';
		var d;
		
		if(buttonFlag == 'mnt'){
			d = aryMnt[ff.sel.selectedIndex];
		}else{
			d = aryRiver[ff.sel.selectedIndex];
		}
	      str += '<strong>Name : </strong>' + d.name + '<br/>'; 
	      str += '<strong>Address : </strong>' + d.address + '<br/>'; 
	      str += '<strong>Zip Code : </strong>' + d.zip + '<br/>'; 

	      rs.innerHTML = str;
	}
	
	
}
</script>
</head>
<body>
<form name='frm' method='post'>
   <input type='button' name='mnt' value='명산'>
   <input type='button' name='river' value='명천'><br/>
   <select name='sel' size='5' id='sel'>
   </select>
   <div id='result'></div>
</form>
<script>start()</script>
</body>
</html>