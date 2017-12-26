<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>location</title>
<script>
window.onload = function(){
	var btn = document.getElementById('naver');
	btn.onclick = function(){
		location.href='http://www.naver.com';
	}
	document.getElementById('jobtc').onclick = function(){
		location.href='http://www.jobtc.kr';
	}
}

</script>
</head>
<body>

<input type='button' value='naver' id='naver' />
<input type='button' value='nate' id='nate' />
<input type='button' value='daum' id='daum' />
<input type='button' value='jobtc' id='jobtc' />
<input type='button' value='myHome' id='myHome' />

</body>
</html>