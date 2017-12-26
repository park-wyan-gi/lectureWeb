<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>emp_insert</title>
</head>
<body>
<h1>사원입력</h1>
<form method='post'  action='emp_insert_result.jsp'>
	<label>사번</label>
	<input type='text' name='employee_id' /> <br/>
	<label>성명</label>
	<input type='text' name='first_name' /><br/>
	<label>이메일</label>
	<input type='text' name='email' /><br/>
	<label>입사일</label>
	<input type='date' name='hire_date' /><br/>
	<label>급여</label>
	<input type='text' name='salary' /><br/>
	<label>부서코드</label>
	<input type='text' name='dCode' /><br/>
	<br/>
	<input type='submit' value='사원입력' />
	
	<a href='find_emp.jsp' >사원 조회</a> |
	<a href='emp_list.jsp' >사원 목록</a> 

</form>
</body>
</html>



