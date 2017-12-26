<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="db.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>find_emp</title>
</head>
<body>
<h1>사원검색</h1>
<%
	request.setCharacterEncoding("utf-8");
	String empId="";
	String fn = "";
	String phone="";
	String email = "";
	String salary = "";
	String dCode = "";
	String dName = "";
	
	if( request.getMethod().equals("POST") ){
		empId = request.getParameter("empId");
	}
%>

<form method='post'>
	<label>사원아이디</label>
	<input type='text' name='empId' value='<%=empId %>' />
	<input type='submit' value='검색' /> 
</form>
<%
if( request.getMethod().equals("POST") ){
	Connection conn = new DBConn().getConn();
	PreparedStatement  ps = null;
	ResultSet rs = null;
	String sql = "select first_name, phone_number, email, to_char(salary, '999,999') sal , "
	 		              + " d.department_id dCode, d.department_name dName "
			              + " from emp e left JOIN departments d "
			              + " on e.department_id = d.department_id "
			              + " where employee_id = ? ";
	ps = conn.prepareStatement(sql);
	ps.setString(1, empId);
	
	rs = ps.executeQuery();
	
	if(rs.next()){
		fn = rs.getString("first_name");
		phone = rs.getString("phone_number");
		email = rs.getString("email");
		salary = rs.getString("sal");
		dCode = rs.getString("dCode");
		dName = rs.getString("dName");
		
		out.print("<ul>");
		out.print("<li> 성명 : " + fn + "</li>");
		out.print("<li> 연락처 : " + phone + "</li>");
		out.print("<li> 이메일 : " + email + "</li>");
		out.print("<li> 급여 : " + salary + "</li>");
		out.print("<li> 부서 : " + dCode + "(" + dName + ")</li>");
		
		out.print("</ul>");	
	}
}
%>

<a href='emp_insert.jsp' >사원 입력</a> |
<a href='emp_list.jsp' >사원 목록</a> 




</body>
</html>