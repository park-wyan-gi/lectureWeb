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
	<%
		String serial = request.getParameter("serial");
		out.print(serial);
	%>
	<form name='frm_brd' method='post' action=''>
		<input type='button' value='목록' name='btnList' id='btnList'/>
		<input type='button' value='상세보기' name='btnView' id='btnView'/>
		<input type='hidden' name='serial' value='<%=serial %>' />
	</form>
</div>
<script>
var frm = document.frm_brd;
var url = 'index.jsp?inc=./board/';

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




