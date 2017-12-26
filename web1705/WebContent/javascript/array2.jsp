<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>array2</title>

<script>
window.onload=function(){
	var member = new Array();
	var position=0; //데이터가 저장된 위치.
	var frm = document.frm;
	var rs = document.getElementById('result');
	
	//저장버튼이 클릭되면
	frm.btnSave.onclick= function(){
		member[position] = new Array(2);
		member[position][0] = frm.mid.value;
		member[position][1] = frm.pwd.value;
		position++;
		rs.innerHTML = "<font color='blue'>" + position + " 번째 데이터 저장됨.</font>";
	}
	
	
	//출력버튼이 클릭되면
	frm.btnPrint.onclick = function(){
		var str = '<ol>';
		for(i = 0 ; i<position ; i++){
			str += '<li>' + member[i][0] + ' ---- ' + member[i][1];
		}
		str += '</ol>';
		rs.innerHTML = str;
		
	}
	
	
	
	
}
</script>


</head>
<body>
<div id='array2'>
	<h1>2차원 배열</h1>
	<p>입력된 값을 2차원 배열에 저장한 후 출력</p>
	<form name='frm' method='post'>
		<label>아이디</label>
		<input type='text' name='mid' size='5' maxlength='5'/><br/>
		<label>암호</label>
		<input type='password' name='pwd' size='7' maxlength='6'/><br/>
		
		<input type='button' name='btnSave' value='저장' />
		<input type='button' name='btnPrint' value='출력' />
		<p/>
		<div id='result'></div>
	</form>

</div>
</body>
</html>