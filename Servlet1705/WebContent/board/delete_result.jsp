<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id='delete_result'>
	<h3>삭제 결과</h3>
	
	<font color='red'>${rs }</font>

	<form name='frm_brd' method='post' action=''>
		<input type='button' name='btnList' value='목록으로'/>
		
		<input type='text' name='nowPage' value='${param.nowPage }'/>
		<input type='text' name='findStr' value='${param.findStr }'/>
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





