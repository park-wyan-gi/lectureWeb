<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id='view'>
	<h3>자료실 상세 내용</h3>
	<%
		String serial = request.getParameter("serial");
	
		out.print(serial);
	
	%>
	
	<form name='frm_brd' method='post' action=''>
		<input type='button' value='수정' name='btnModify' id='btnModify'/>
		<input type='button' value='삭제' name='btnDelete' id='btnDelete'/>
		<input type='button' value='댓글' name='btnRepl'   id='btnRepl'/>
		<input type='button' value='목록' name='btnList'   id='btnList'/>
		<input type='hidden' name='serial' value='<%=serial%>'/>
	</form>
</div>

<script>
var frm = document.frm_brd;
var url = 'index.jsp?inc=./board/';

frm.btnModify.onclick = function(){
	frm.action = url + 'modify.jsp';
	frm.submit();
}
frm.btnDelete.onclick = function(){
	frm.action = url + 'delete_result.jsp';
	frm.submit();
}

frm.btnRepl.onclick = function(){
	frm.action = url + 'repl.jsp';
	frm.submit();
}

frm.btnList.onclick = function(){
	frm.action = url + 'list.jsp';
	frm.submit();
}

</script>

</body>
</html>






