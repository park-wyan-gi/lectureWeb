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
	<%
		String serial = request.getParameter("serial");
		out.print(serial);
	%>
	<form name='frm_brd' method='post' action=''>
		<input type='button' name='btnList' value='목록으로'/>
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





