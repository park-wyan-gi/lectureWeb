<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id='repl_result'>
	<h3>답변 저장 결과</h3>
	
	<font color='blue'>${rMap['rs'] }</font>
	<p/>
	
	<form name='frm_brd' method='post' action=''>
		<input type='button' value='목록'    name='btnList' id='btnList'/>
		<input type='button' value='상세보기' name='btnView' id='btnView'/>
		
		<input type='hidden' name='nowPage' value="${rMap['nowPage'] }" />
		<input type='hidden' name='findStr' value="${rMap['findStr'] }" />
		<input type='hidden' name='serial'  value="${rMap['serial'] }" />
		
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