<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>emp_insert2</title>
<script>
var win;
window.onload=function(){
	var frm = document.frm;
	frm.btnFind.onclick = function(){
		win = window.open('find_dept.jsp', 'win', 'width=250px, height=300px');
	}
}
</script>
</head>
<body>
<h2>신입사원 입력</h2>
<form name='frm'>
	<label>부서코드</label>
	<input type='text' size='4' readonly name='dCode' />
	<input type='button' value='검색' name='btnFind' /><br/>
	<label>부서명</label>
	<input type='text' readonly name='dName' />
</form>
</body>
</html>