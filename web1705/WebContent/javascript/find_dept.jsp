<%@page import="db.DeptVo"%>
<%@page import="java.util.Vector"%>
<%@page import="db.EmpDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>find_dept</title>
<style>
#depts{
	width:200px; height:180px;
}
</style>
<script>
window.onload=function(){
	var frm = document.frm;
	frm.depts.ondblclick = function(){
		var index = frm.depts.selectedIndex;
		var dCode = frm.depts[index].value;
		var dName = frm.depts[index].text;
		
		var oFrm = window.opener.document.frm;
		oFrm.dCode.value = dCode;
		oFrm.dName.value = dName;
		self.close();
		
	}
}
</script>
</head>
<body>
<%
EmpDao dao = new EmpDao();
Vector<DeptVo> depts = dao.getDepts("");
StringBuffer sb = new StringBuffer();
for(int i=0 ; i<depts.size() ; i++){
	DeptVo v = depts.get(i);
	String temp = 
			String.format("<option value='%d'>%s</option>", 
									v.getdCode(),v.getdName());
	sb.append(temp);
}


%>

<h2>부서명</h2>
<form name='frm'>
	<select name='depts' size='10'  id='depts'><%=sb.toString() %></select>
</form>
</body>
</html>








