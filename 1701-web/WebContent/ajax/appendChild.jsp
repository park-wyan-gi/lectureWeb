<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function init(){
	var cnt=1;
	document.getElementById('btnAppend').onclick=function(){
		var answer_zone = document.getElementById('answer_zone');
		
		var label = document.createElement('label');
		var br    = document.createElement('br');
		var input = document.createElement('input');

		label.innerHTML = cnt + "번째 보기 ";
		
		input.setAttribute('type', 'text');
		input.setAttribute('size', '50');
		input.setAttribute('name','answer');
		
		answer_zone.appendChild(label);
		answer_zone.appendChild(input);
		answer_zone.appendChild(br);
		
		cnt++;
	}
}
</script>
</head>
<body>
<h2>AppendChild Example</h2>
<form name='frm' id='frm' method='post'
      action = 'appendChild_result.jsp'>
      
	<label>문제</label><br/>
	<input type='text' size='50' name='q'><br/>
	<div id='answer_zone'>
	
	</div>
    <br/>
    <input type='button' id='btnAppend' value='보기추가'/>
    <p/>
    <label>정답유형</label>
	<label><input type='radio' name='answer_type' value='one'>한개</label>
	<label><input type='radio' name='answer_type' value='many'>여러개</label>
	<p/>
	
	<input type='submit' value='제출'/>      
	
</form>
<script>init()</script>
</body>
</html>