<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>localStorage</title>
<script>
window.onload=start;

function Data(mid,pwd){
	this.mid = mid;
	this.pwd = pwd;
}

function start(){
	var btnS = document.getElementById('btnStore');
	var btnL = document.getElementById('btnLoad');
	
	btnS.onclick=function(){
		var ff = document.frm;
		var m = ff.mid.value;
		var p = ff.pwd.value;
	
		localStorage.setItem("mid", m);
		localStorage.setItem("pwd", p);
		
	}
	
	btnL.onclick=function(){
		var ff = document.frm;
		ff.mid.value = localStorage.getItem("mid");
		ff.pwd.value = localStorage.getItem("pwd");		
	}
}
</script>

</head>
<body>
<h3>localStorage Exmaple<hr/></h3>
<form name='frm'>
	<label>아이디<input type='text' name='mid'></label><br/>
	<label>암호<input type='password' name='pwd'></label><p/>
	
	<input type='button' id='btnStore' value='저장'>
	<input type='button' id='btnLoad'  value='읽기'>
</form>
</body>
</html>