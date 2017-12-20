<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id='frm_mr'>
	<h3>자료 수정 결과</h3>
	
	<font color='blue'>${rMap['rs'] }</font>
	<p/>
	
	<form name='frm_brd' method='post' action=''>
		<input type='button' value='목록' name='btnList' id='btnList'/>
		<input type='button' value='상세보기' name='btnView' id='btnView'/>
		
		<input type='hidden' name='nowPage' value="${rMap['nowPage'] }" />
		<input type='hidden' name='findStr' value="${rMap['findStr'] }" />
		<input type='hidden' name='serial' value="${rMap['serial'] }" />
		
	</form>
</div>
<script>
var frm = document.frm_brd;
frm.btnList.onclick = function(){
	frm.action = 'list.do';
	frm.submit();
}

frm.btnView.onclick = function(){
	frm.action = 'view.do';
	frm.submit();
}
</script>

</body>
</html>




