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
	<%
		String worker = request.getParameter("worker");
		String subject = request.getParameter("subject");
	
	%>
	<li>worker = <%=worker %>
	<li>subject= <%=subject %>
	<br/>
	<font color='blue'>${msg }</font>
	
	<form name='frm_brd' method='post' action=''>
	
		<input type='button' value='목록으로' name='btnList' id='btnList'/>

	</form>
</div>

<script>
	var frm = document.frm_brd;
	var url = 'index.jsp?inc=./board/';
	frm.btnList.onclick = function(){
		frm.action = url + 'list.jsp';
		frm.submit();
	}

</script>
</body>
</html>