<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id='insert_result'>
	<h3>자료 입력 결과</h3>
	
	<font color='blue'>${msg }</font>
	
	<form name='frm_brd' method='post' action=''>
	
		<input type='button' value='목록으로' name='btnList' id='btnList'/>

	</form>
</div>

<script>
	var frm = document.frm_brd;
	frm.btnList.onclick = function(){
		frm.action = 'list.do';
		frm.submit();
	}

</script>
</body>
</html>