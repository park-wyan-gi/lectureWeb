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
<title>table_emp</title>
</head>
<body>
<h1>table을 사용하여 직원 목록표시</h1>
<table border="50" cellpadding='5' cellspacing='0'>
<tr>
	<th>No</th>
	<th>성명</th>
	<th>급여</th>
	<th>연락처</th>
	<th>이메일</th>
</tr>	
<%
Connection conn = new DBConn().getConn();
String sql = "select first_name, to_char(salary, '999,999') sal , phone_number, email "
									+ " from employees "
             			+ " where department_id=80 ";
PreparedStatement ps = conn.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
int no=1;
while(rs.next()){
	out.print("<tr>");
	out.print("<td>" + (no++) + "</td>");
	out.print("<td>" + rs.getString("first_name") + "</td>");
	out.print("<td>" + rs.getString("sal") + "</td>");
	out.print("<td>" + rs.getString("phone_number") + "</td>");
	out.print("<td>" + rs.getString("email") + "</td>");
	out.print("</tr>");
}
%>
</table>
</body>
</html>