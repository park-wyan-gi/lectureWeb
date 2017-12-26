<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>emp_insert</title>
<style>
form > label{
	display : inline-block;
	width: 120px;
	text-align:right;
	font-size:25px;
}
form > input[req=true]{
	background-color : #ffdddd;
}
form > input[type=text], form>input[type=date]{
	width:220px;
	height:40px;
	font-size:25px;
	margin-bottom:6px;
}
form> input[type=submit]{
	width:140px;
	height:60px;
	font-size:25px;
}

form>a {
	border:1px solid #999999;
	background-color:#dddddd;
	width:140px;
	height:60px;
	font-size:25px;
	padding:12px;
	text-decoration:none;
	box-shadow:2px 2px 3px #eeeeee;
}
form>input[type=submit]:hover{
	background-color:#aaaaaa;
}
form>a:hover{
	background-color:#aaaaaa;
}
</style>
</head>
<body>
<h1>사원입력</h1>
<form method='post'  action='emp_insert_result.jsp'>
	<label>사번</label>
	<input type='text' name='employee_id'  req='true'/> <br/>
	<label>성명</label>
	<input type='text' name='first_name' req = 'true'/><br/>
	<label>이메일</label>
	<input type='text' name='email' /><br/>
	<label>입사일</label>
	<input type='date' name='hire_date' /><br/>
	<label>급여</label>
	<input type='text' name='salary' /><br/>
	<label>부서코드</label>
	<input type='text' name='dCode'  req='true'/><br/>
	<br/>
	<input type='submit' value='사원입력' />
	
	<a href='find_emp.jsp' >사원 조회</a>
	<a href='emp_list.jsp' >사원 목록</a> 

</form>
</body>
</html>



