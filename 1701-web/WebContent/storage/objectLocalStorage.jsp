<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>objectLocalStorage</title>
<script>
window.onload=start;

function Data(mid, pwd){
	this.mid = mid;
	this.pwd = pwd;
}

function start(){
	var btnS = document.getElementById('btnSave');
	var btnL = document.getElementById('btnLoad');
	
	btnS.onclick=function(){
		//form에 있는 정보를 가져와 Data객체 생성
		var ff = document.frm;
		var m = ff.mid.value;
		var p = ff.pwd.value;
		var d = new Data(m,p);
		
		// object를 직렬화
		var v = JSON.stringify(d);
		
		//localStorage에 저장
		localStorage.setItem('data', v);
		
		//alert(v);//직렬화된 데이터 확인
	}
	
	btnL.onclick=function(){
		var v = localStorage.getItem('data');
		
		//직렬화되서 저장된 v 값을 다시 Object로 변환
		var obj = JSON.parse(v);
		
		var ff = document.frm;
		ff.mid.value = obj.mid;
		ff.pwd.value = obj.pwd;
		
	}
}
</script>

</head>
<body>
<h3>localStorage에 Object 저장 Example<hr/></h3>

<form name='frm'>
	<label>아이디 <input type='text' name='mid'></label><br/>
	<label>암 호 <input type='password' name='pwd'></label><p/>
	
	<input type='button' id='btnSave' value='저장'>
	<input type='button' id='btnLoad' value='읽기'>

</form>

</body>
</html>