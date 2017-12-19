<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id='repl'>
	<h3>답글하기</h3>
	<%
		String serial = request.getParameter("serial");
		out.print(serial);
	%>
	<form name='frm_brd' method='post' action=''>
		<input type='button' value='답변저장' name='btnSave' />
		<input type='button' value='목록으로' name='btnList' />
		<input type='button' value='취소'    name = 'btnView' />
		<input type='hidden' name='serial' value='<%=serial %>' />		
	</form>
</div>
<script>
var frm = document.frm_brd;
var url = 'index.jsp?inc=./board/';

frm.btnSave.onclick = function(){
	frm.action = url + 'repl_result.jsp';
	frm.submit();
}
frm.btnList.onclick = function(){
	frm.action = url + 'list.jsp';
	frm.submit();
}
frm.btnView.onclick = function(){
	frm.action = url + 'view.jsp';
	frm.submit();
}
</script>
</body>
</html>








