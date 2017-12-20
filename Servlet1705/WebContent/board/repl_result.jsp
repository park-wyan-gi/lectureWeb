<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id='repl_result'>
	<h3>답변 저장 결과</h3>
	<%
		String serial = request.getParameter("serial");
		out.print(serial);
	%>	
	<form name='frm_brd' method='post' action = ''>
		<input type='button' value='목록으로' name='btnList'/>
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