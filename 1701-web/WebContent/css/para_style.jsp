<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, user-scalable=no">

<title>para_style</title>
<style>
.a1{
	display:none;
}

.a2{
	visibility: hidden;
}
</style>
<script>
window.onload=function(){
	var q1 = document.getElementById('q1');
	var q2 = document.getElementById('q2');
	
	q1.onclick=function(){
		var a1 = document.getElementsByClassName('a1');//배열
		
		if(a1[0].style.display=='block'){
			a1[0].style.display='none';
		}else{
			a1[0].style.display='block';
		}
		
	}
	
	q2.onclick=function(){
		var a2 = document.getElementsByClassName('a2');
		if(a2[0].style.visibility=='visible'){
			a2[0].style.visibility='hidden';
		}else{
			a2[0].style.visibility='visible';
		}
	}
	
}

</script>

</head>
<body>
<fieldset>
	<legend>display와 visivility의 차이</legend>
		<h4>display:none or block</h4>
		<div id='q1'>Q1. 궁금한게 있나요??</div>
		<div class='a1'>
			먹고 싶은것도 많겠네요~~ ^^
		</div>
		<div>이곳은 어떻게...</div>
		<hr/>

		<h4>visivility:hidden or visible</h4>
		<div id='q2'>Q2. 궁금한게 있나요??</div>
		<div class='a2'>
			먹고 싶은것도 많겠네요~~ ^^
		</div>
		<div>이곳은 어떻게...</div>
		<hr/>
</fieldset>
</body>
</html>