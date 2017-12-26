<%@page import="java.sql.PreparedStatement"%>
<%@page import="db.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>emp_delete</title>
</head>
<body>
<h1>사원 정보 삭제</h1>
<%
String empId = request.getParameter("empId");
out.print("삭제할 사원번호 : " + empId);

Connection conn = new DBConn().getConn();
PreparedStatement ps = null;
String sql = "delete from emp where employee_id = ? ";
ps = conn.prepareStatement(sql);
ps.setString(1, empId);
int r = ps.executeUpdate();

if(r > 0){
	out.print("<font color='#0000ff'> 정상적으로 삭제됨.</font>");
}else{
	out.print("<font color='#ff0000'> 삭제중 오류 발생..</font>");
}

%>
<p/>
<a href='emp_list.jsp' >사원 목록</a>
</body>
</html>