<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>radio</title>
<script>
window.onload = function(){
	var frm = document.frm;
	var len = frm.chk.length; //라디오 버튼의 개수
	
	frm.btn.onclick= function(){
		for(i=0 ; i<len ; i++){
			if( frm.chk[i].checked )	{
				var c=''; //문자색
				frm.re.value = frm.chk[i].value;
				frm.re.style.backgroundColor = frm.chk[i].value;
				
				switch(i){
				case 0:
				case 3:
					c='#ffffff';
					break;
				case 1:
					c = '#ffff00';
					break;
				}
				
				frm.re.style.color = c;
			}		
		}	
	}
}
</script>
</head>
<body>
<h1>radio</h1>
<form name='frm' method='post' action = 'radio_result.jsp'>
	<textarea rows="8" cols="35" name='re'></textarea>
	<br/>
	<label><input type='radio' name='chk'  value='#000000'>검정</label>
	<label><input type='radio' name='chk'  value='#ff0000'>빨강</label>
	<label><input type='radio' name='chk'  value='#00ff00'>녹색</label>
	<label><input type='radio' name='chk'  value='#0000ff'>파랑</label>
	<br/>
	<input type='button' name='btn' value='CLICK' />
	<input type='submit' value='전송' />
</form>
</body>
</html>