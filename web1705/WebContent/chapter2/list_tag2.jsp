
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
<title>list_tag2</title>
</head>
<body>
<%
Connection conn = new DBConn().getConn();
String sql = "select first_name, salary, phone_number, email from employees where employee_id=100";
PreparedStatement ps = conn.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
out.print("<ol>");
while(rs.next()){
	out.print("<li><b>성명 : </b>" + rs.getString("first_name") + "</li>");
	out.print("<li><b>급여 : </b>" + rs.getInt("salary") + "</li>");
	out.print("<li><b>연락처 : </b>" + rs.getString("phone_number") + "</li>");
	out.print("<li><b>이메일 : </b>" + rs.getString("email") + "</li>");
}
out.print("</ol>");

%>





</body>
</html>